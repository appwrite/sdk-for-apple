import Foundation
import JSONCodable

/// Session
public class Session {

    /// Session ID.
    public let id: String

    /// Session creation date in ISO 8601 format.
    public let createdAt: String

    /// User ID.
    public let userId: String

    /// Session expiration date in ISO 8601 format.
    public let expire: String

    /// Session Provider.
    public let provider: String

    /// Session Provider User ID.
    public let providerUid: String

    /// Session Provider Access Token.
    public let providerAccessToken: String

    /// The date of when the access token expires in ISO 8601 format.
    public let providerAccessTokenExpiry: String

    /// Session Provider Refresh Token.
    public let providerRefreshToken: String

    /// IP in use when the session was created.
    public let ip: String

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

    /// Returns true if this the current user session.
    public let current: Bool


    init(
        id: String,
        createdAt: String,
        userId: String,
        expire: String,
        provider: String,
        providerUid: String,
        providerAccessToken: String,
        providerAccessTokenExpiry: String,
        providerRefreshToken: String,
        ip: String,
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
        countryName: String,
        current: Bool
    ) {
        self.id = id
        self.createdAt = createdAt
        self.userId = userId
        self.expire = expire
        self.provider = provider
        self.providerUid = providerUid
        self.providerAccessToken = providerAccessToken
        self.providerAccessTokenExpiry = providerAccessTokenExpiry
        self.providerRefreshToken = providerRefreshToken
        self.ip = ip
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
        self.current = current
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "userId": userId as Any,
            "expire": expire as Any,
            "provider": provider as Any,
            "providerUid": providerUid as Any,
            "providerAccessToken": providerAccessToken as Any,
            "providerAccessTokenExpiry": providerAccessTokenExpiry as Any,
            "providerRefreshToken": providerRefreshToken as Any,
            "ip": ip as Any,
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
            "countryName": countryName as Any,
            "current": current as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Session {
        return Session(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            userId: map["userId"] as! String,
            expire: map["expire"] as! String,
            provider: map["provider"] as! String,
            providerUid: map["providerUid"] as! String,
            providerAccessToken: map["providerAccessToken"] as! String,
            providerAccessTokenExpiry: map["providerAccessTokenExpiry"] as! String,
            providerRefreshToken: map["providerRefreshToken"] as! String,
            ip: map["ip"] as! String,
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
            countryName: map["countryName"] as! String,
            current: map["current"] as! Bool
        )
    }
}
