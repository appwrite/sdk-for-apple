import Foundation
import JSONCodable

/// Device
open class Device: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case expire = "expire"
        case activeSessionId = "activeSessionId"
        case sessions = "sessions"
        case secret = "secret"
    }

    /// Device ID.
    public let id: String
    /// Device creation date in ISO 8601 format.
    public let createdAt: String
    /// Device update date in ISO 8601 format.
    public let updatedAt: String
    /// Device expiration date in ISO 8601 format.
    public let expire: String
    /// ID of the session that is currently active on the device. Empty when no session is active, for example right after the active session was deleted.
    public let activeSessionId: String
    /// List of sessions the device holds. Switch between them to change the active account.
    public let sessions: [Session]
    /// Secret used to authenticate the device. Carried by the device cookie; only included in the response if the request was made with an API key.
    public let secret: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        expire: String,
        activeSessionId: String,
        sessions: [Session],
        secret: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.expire = expire
        self.activeSessionId = activeSessionId
        self.sessions = sessions
        self.secret = secret
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.expire = try container.contains(.expire) ? container.decode(String.self, forKey: .expire) : ""
        self.activeSessionId = try container.contains(.activeSessionId) ? container.decode(String.self, forKey: .activeSessionId) : ""
        self.sessions = try container.contains(.sessions) ? container.decode([Session].self, forKey: .sessions) : []
        self.secret = try container.contains(.secret) ? container.decode(String.self, forKey: .secret) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(expire, forKey: .expire)
        try container.encode(activeSessionId, forKey: .activeSessionId)
        try container.encode(sessions, forKey: .sessions)
        try container.encode(secret, forKey: .secret)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "expire": expire as Any,
            "activeSessionId": activeSessionId as Any,
            "sessions": sessions.map { $0.toMap() } as Any,
            "secret": secret as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Device {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "expire": "",
            "activeSessionId": "",
            "sessions": [Any](),
            "secret": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return Device(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            expire: map["expire"] as! String,
            activeSessionId: map["activeSessionId"] as! String,
            sessions: (map["sessions"] as! [[String: Any]]).map { Session.from(map: $0) },
            secret: map["secret"] as! String
        )
    }
}
