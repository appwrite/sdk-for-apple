import Foundation
import JSONCodable

/// Session
open class Session: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case userId = "userId"
        case expire = "expire"
        case provider = "provider"
        case providerUid = "providerUid"
        case providerAccessToken = "providerAccessToken"
        case providerAccessTokenExpiry = "providerAccessTokenExpiry"
        case providerRefreshToken = "providerRefreshToken"
        case ip = "ip"
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
        case current = "current"
        case factors = "factors"
        case secret = "secret"
        case mfaUpdatedAt = "mfaUpdatedAt"
    }

    /// Session ID.
    public let id: String
    /// Session creation date in ISO 8601 format.
    public let createdAt: String
    /// Session update date in ISO 8601 format.
    public let updatedAt: String
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
    /// Returns a list of active session factors.
    public let factors: [String]
    /// Secret used to authenticate the user. Only included if the request was made with an API key
    public let secret: String
    /// Most recent date in ISO 8601 format when the session successfully passed MFA challenge.
    public let mfaUpdatedAt: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
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
        current: Bool,
        factors: [String],
        secret: String,
        mfaUpdatedAt: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
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
        self.factors = factors
        self.secret = secret
        self.mfaUpdatedAt = mfaUpdatedAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.expire = try container.decode(String.self, forKey: .expire)
        self.provider = try container.decode(String.self, forKey: .provider)
        self.providerUid = try container.decode(String.self, forKey: .providerUid)
        self.providerAccessToken = try container.decode(String.self, forKey: .providerAccessToken)
        self.providerAccessTokenExpiry = try container.decode(String.self, forKey: .providerAccessTokenExpiry)
        self.providerRefreshToken = try container.decode(String.self, forKey: .providerRefreshToken)
        self.ip = try container.decode(String.self, forKey: .ip)
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
        self.current = try container.decode(Bool.self, forKey: .current)
        self.factors = try container.decode([String].self, forKey: .factors)
        self.secret = try container.decode(String.self, forKey: .secret)
        self.mfaUpdatedAt = try container.decode(String.self, forKey: .mfaUpdatedAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(userId, forKey: .userId)
        try container.encode(expire, forKey: .expire)
        try container.encode(provider, forKey: .provider)
        try container.encode(providerUid, forKey: .providerUid)
        try container.encode(providerAccessToken, forKey: .providerAccessToken)
        try container.encode(providerAccessTokenExpiry, forKey: .providerAccessTokenExpiry)
        try container.encode(providerRefreshToken, forKey: .providerRefreshToken)
        try container.encode(ip, forKey: .ip)
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
        try container.encode(current, forKey: .current)
        try container.encode(factors, forKey: .factors)
        try container.encode(secret, forKey: .secret)
        try container.encode(mfaUpdatedAt, forKey: .mfaUpdatedAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
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
            "current": current as Any,
            "factors": factors as Any,
            "secret": secret as Any,
            "mfaUpdatedAt": mfaUpdatedAt as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Session {
        return Session(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
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
            current: map["current"] as! Bool,
            factors: map["factors"] as! [String],
            secret: map["secret"] as! String,
            mfaUpdatedAt: map["mfaUpdatedAt"] as! String
        )
    }
}
