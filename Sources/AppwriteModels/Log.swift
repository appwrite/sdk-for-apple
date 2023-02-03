import Foundation
import JSONCodable

/// Log
public class Log {

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
