import Foundation
import AsyncHTTPClient
import NIO
import NIOHTTP1

open class Realtime : Service {

    private let TYPE_ERROR = "error"
    private let TYPE_EVENT = "event"
    private let DEBOUNCE_NANOS = 1_000_000

    private var socketClient: WebSocketClient? = nil
    private var activeChannels = Set<String>()
    private var activeSubscriptions = [Int: RealtimeCallback]()

    let connectSync = DispatchQueue(label: "ConnectSync")

    private var subCallDepth = 0
    private var reconnectAttempts = 0
    private var subscriptionsCounter = 0
    private var reconnect = true

    private func createSocket() async throws {
        guard activeChannels.count > 0 else {
            reconnect = false
            try await closeSocket()
            return
        }

        var queryParams = "project=\(client.config["project"]!)"

        for channel in activeChannels {
            queryParams += "&channels[]=\(channel)"
        }

        let url = "\(client.endPointRealtime!)/realtime?\(queryParams)"

        if (socketClient != nil) {
            reconnect = false
            try await closeSocket()
        }

        socketClient = WebSocketClient(
            url,
            tlsEnabled: !client.selfSigned,
            delegate: self
        )

        try await socketClient?.connect()
    }

    private func closeSocket() async throws {
        guard let client = socketClient,
              let group = client.threadGroup else {
            return
        }

        if (client.isConnected) {
            let promise = group.any().makePromise(of: Void.self)
            client.close(promise: promise)
            try await promise.futureResult.get()
        }

        try await group.shutdownGracefully()
    }

    private func getTimeout() -> Int {
        switch reconnectAttempts {
        case 0..<5: return 1000
        case 5..<15: return 5000
        case 15..<100: return 10000
        default: return 60000
        }
    }

    public func subscribe(
        channel: String,
        callback: @escaping (RealtimeResponseEvent) -> Void
    ) async throws -> RealtimeSubscription {
        return try await subscribe(
            channels: [channel],
            payloadType: String.self,
            callback: callback
        )
    }

    public func subscribe(
        channels: Set<String>,
        callback: @escaping (RealtimeResponseEvent) -> Void
    ) async throws -> RealtimeSubscription {
        return try await subscribe(
            channels: channels,
            payloadType: String.self,
            callback: callback
        )
    }

    public func subscribe<T : Codable>(
        channel: String,
        payloadType: T.Type,
        callback: @escaping (RealtimeResponseEvent) -> Void
    ) async throws -> RealtimeSubscription {
        return try await subscribe(
            channels: [channel],
            payloadType: T.self,
            callback: callback
        )
    }

    public func subscribe<T : Codable>(
        channels: Set<String>,
        payloadType: T.Type,
        callback: @escaping (RealtimeResponseEvent) -> Void
    ) async throws -> RealtimeSubscription {
        subscriptionsCounter += 1

        let count = subscriptionsCounter

        channels.forEach {
            activeChannels.insert($0)
        }

        activeSubscriptions[count] = RealtimeCallback(
            for: Set(channels),
            with: callback
        )

        connectSync.sync {
            subCallDepth+=1
        }

        try await Task.sleep(nanoseconds: UInt64(DEBOUNCE_NANOS))

        if self.subCallDepth == 1 {
            try await self.createSocket()
        }

        connectSync.sync {
            self.subCallDepth -= 1
        }

        return RealtimeSubscription {
            self.activeSubscriptions[count] = nil
            self.cleanUp(channels: channels)
            try await self.createSocket()
        }
    }

    func cleanUp(channels: Set<String>) {
        activeChannels = activeChannels.filter { channel in
            guard channels.contains(channel) else {
                return true
            }
            let subsWithChannel = activeSubscriptions.filter { callback in
                return callback.value.channels.contains(channel)
            }
            return !subsWithChannel.isEmpty
        }
    }
}

extension Realtime: WebSocketClientDelegate {

    public func onOpen(channel: Channel) {
        self.reconnectAttempts = 0
    }

    public func onMessage(text: String) {
        let data = Data(text.utf8)
        if let json = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            if let type = json["type"] as? String {
                switch type {
                case TYPE_ERROR: try! handleResponseError(from: json)
                case TYPE_EVENT: handleResponseEvent(from: json)
                default: break
                }
            }
        }
    }

    public func onClose(channel: Channel, data: Data) async throws {
        if (!reconnect) {
            reconnect = true
            return
        }

        let timeout = getTimeout()

        print("Realtime disconnected. Re-connecting in \(timeout / 1000) seconds.")

        try await Task.sleep(nanoseconds: UInt64(timeout * 1_000_000))

        self.reconnectAttempts += 1

        try await self.createSocket()
    }

    public func onError(error: Swift.Error?, status: HTTPResponseStatus?) {
        print(error?.localizedDescription ?? "Unknown error")
    }

    func handleResponseError(from json: [String: Any]) throws {
        throw AppwriteError(message: json["message"] as? String ?? "Unknown error")
    }

    func handleResponseEvent(from json: [String: Any]) {
        guard let data = json["data"] as? [String: Any],
              let channels = data["channels"] as? [String],
              let events = data["events"] as? [String],
              let payload = data["payload"] as? [String: Any] else {
            return
        }
        guard channels.contains(where: { channel in
            activeChannels.contains(channel)
        }) else {
            return
        }

        for subscription in activeSubscriptions {
            if channels.contains(where: { subscription.value.channels.contains($0) }) {
                let response = RealtimeResponseEvent(
                    events: events,
                    channels: channels,
                    timestamp: data["timestamp"] as! String,
                    payload: payload
                )
                subscription.value.callback(response)
            }
        }
    }
}
