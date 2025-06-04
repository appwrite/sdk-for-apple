import Foundation
import JSONCodable

/// Log
open class Log: Codable {

    enum CodingKeys: String, CodingKey {
        case event = "event"
        case userId = "userId"
        case userEmail = "userEmail"
        case userName = "userName"
        case mode = "mode"
        case ip = "ip"
        case time = "time"
        case osCode = "osCode"
        case osName = "osName"
        case osVersion = "osVersion"
        case clientType = "clientType"
        case clientCode = "clientCode"
        case clientName = "clientName"
        case clientVersion = "clientVersion"
        case clientEngine = "clientEngine"
        case clientEngineVersion = "clientEngineVersion"
        case deviceName = "deviceName"
        case deviceBrand = "deviceBrand"
        case deviceModel = "deviceModel"
        case countryCode = "countryCode"
        case countryName = "countryName"
    }

    /// Event name.
    public let event: String

    /// User ID.
    public let userId: String

    /// User Email.
    public let userEmail: String

    /// User Name.
    public let userName: String

    /// API mode when event triggered.
    public let mode: String

    /// IP session in use when the session was created.
    public let ip: String

    /// Log creation date in ISO 8601 format.
    public let time: String

    /// Operating system code name. View list of [available options](https://github.com/appwrite/appwrite/blob/master/docs/lists/os.json).
    public let osCode: String

    /// Operating system name.
    public let osName: String

    /// Operating system version.
    public let osVersion: String

    /// Client type.
    public let clientType: String

    /// Client code name. View list of [available options](https://github.com/appwrite/appwrite/blob/master/docs/lists/clients.json).
    public let clientCode: String

    /// Client name.
    public let clientName: String

    /// Client version.
    public let clientVersion: String

    /// Client engine name.
    public let clientEngine: String

    /// Client engine name.
    public let clientEngineVersion: String

    /// Device name.
    public let deviceName: String

    /// Device brand name.
    public let deviceBrand: String

    /// Device model name.
    public let deviceModel: String

    /// Country two-character ISO 3166-1 alpha code.
    public let countryCode: String

    /// Country name.
    public let countryName: String


    init(
        event: String,
        userId: String,
        userEmail: String,
        userName: String,
        mode: String,
        ip: String,
        time: String,
        osCode: String,
        osName: String,
        osVersion: String,
        clientType: String,
        clientCode: String,
        clientName: String,
        clientVersion: String,
        clientEngine: String,
        clientEngineVersion: String,
        deviceName: String,
        deviceBrand: String,
        deviceModel: String,
        countryCode: String,
        countryName: String
    ) {
        self.event = event
        self.userId = userId
        self.userEmail = userEmail
        self.userName = userName
        self.mode = mode
        self.ip = ip
        self.time = time
        self.osCode = osCode
        self.osName = osName
        self.osVersion = osVersion
        self.clientType = clientType
        self.clientCode = clientCode
        self.clientName = clientName
        self.clientVersion = clientVersion
        self.clientEngine = clientEngine
        self.clientEngineVersion = clientEngineVersion
        self.deviceName = deviceName
        self.deviceBrand = deviceBrand
        self.deviceModel = deviceModel
        self.countryCode = countryCode
        self.countryName = countryName
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.event = try container.decode(String.self, forKey: .event)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.userEmail = try container.decode(String.self, forKey: .userEmail)
        self.userName = try container.decode(String.self, forKey: .userName)
        self.mode = try container.decode(String.self, forKey: .mode)
        self.ip = try container.decode(String.self, forKey: .ip)
        self.time = try container.decode(String.self, forKey: .time)
        self.osCode = try container.decode(String.self, forKey: .osCode)
        self.osName = try container.decode(String.self, forKey: .osName)
        self.osVersion = try container.decode(String.self, forKey: .osVersion)
        self.clientType = try container.decode(String.self, forKey: .clientType)
        self.clientCode = try container.decode(String.self, forKey: .clientCode)
        self.clientName = try container.decode(String.self, forKey: .clientName)
        self.clientVersion = try container.decode(String.self, forKey: .clientVersion)
        self.clientEngine = try container.decode(String.self, forKey: .clientEngine)
        self.clientEngineVersion = try container.decode(String.self, forKey: .clientEngineVersion)
        self.deviceName = try container.decode(String.self, forKey: .deviceName)
        self.deviceBrand = try container.decode(String.self, forKey: .deviceBrand)
        self.deviceModel = try container.decode(String.self, forKey: .deviceModel)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.countryName = try container.decode(String.self, forKey: .countryName)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(event, forKey: .event)
        try container.encode(userId, forKey: .userId)
        try container.encode(userEmail, forKey: .userEmail)
        try container.encode(userName, forKey: .userName)
        try container.encode(mode, forKey: .mode)
        try container.encode(ip, forKey: .ip)
        try container.encode(time, forKey: .time)
        try container.encode(osCode, forKey: .osCode)
        try container.encode(osName, forKey: .osName)
        try container.encode(osVersion, forKey: .osVersion)
        try container.encode(clientType, forKey: .clientType)
        try container.encode(clientCode, forKey: .clientCode)
        try container.encode(clientName, forKey: .clientName)
        try container.encode(clientVersion, forKey: .clientVersion)
        try container.encode(clientEngine, forKey: .clientEngine)
        try container.encode(clientEngineVersion, forKey: .clientEngineVersion)
        try container.encode(deviceName, forKey: .deviceName)
        try container.encode(deviceBrand, forKey: .deviceBrand)
        try container.encode(deviceModel, forKey: .deviceModel)
        try container.encode(countryCode, forKey: .countryCode)
        try container.encode(countryName, forKey: .countryName)
    }

    public func toMap() -> [String: Any] {
        return [
            "event": event as Any,
            "userId": userId as Any,
            "userEmail": userEmail as Any,
            "userName": userName as Any,
            "mode": mode as Any,
            "ip": ip as Any,
            "time": time as Any,
            "osCode": osCode as Any,
            "osName": osName as Any,
            "osVersion": osVersion as Any,
            "clientType": clientType as Any,
            "clientCode": clientCode as Any,
            "clientName": clientName as Any,
            "clientVersion": clientVersion as Any,
            "clientEngine": clientEngine as Any,
            "clientEngineVersion": clientEngineVersion as Any,
            "deviceName": deviceName as Any,
            "deviceBrand": deviceBrand as Any,
            "deviceModel": deviceModel as Any,
            "countryCode": countryCode as Any,
            "countryName": countryName as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Log {
        return Log(
            event: map["event"] as! String,
            userId: map["userId"] as! String,
            userEmail: map["userEmail"] as! String,
            userName: map["userName"] as! String,
            mode: map["mode"] as! String,
            ip: map["ip"] as! String,
            time: map["time"] as! String,
            osCode: map["osCode"] as! String,
            osName: map["osName"] as! String,
            osVersion: map["osVersion"] as! String,
            clientType: map["clientType"] as! String,
            clientCode: map["clientCode"] as! String,
            clientName: map["clientName"] as! String,
            clientVersion: map["clientVersion"] as! String,
            clientEngine: map["clientEngine"] as! String,
            clientEngineVersion: map["clientEngineVersion"] as! String,
            deviceName: map["deviceName"] as! String,
            deviceBrand: map["deviceBrand"] as! String,
            deviceModel: map["deviceModel"] as! String,
            countryCode: map["countryCode"] as! String,
            countryName: map["countryName"] as! String
        )
    }
}
