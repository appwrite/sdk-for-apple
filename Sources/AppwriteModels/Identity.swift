import Foundation
import JSONCodable

/// Identity
open class Identity: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case userId = "userId"
        case provider = "provider"
        case providerUid = "providerUid"
        case providerEmail = "providerEmail"
        case providerAccessToken = "providerAccessToken"
        case providerAccessTokenExpiry = "providerAccessTokenExpiry"
        case providerRefreshToken = "providerRefreshToken"
        case providerIdToken = "providerIdToken"
    }

    /// Identity ID.
    public let id: String
    /// Identity creation date in ISO 8601 format.
    public let createdAt: String
    /// Identity update date in ISO 8601 format.
    public let updatedAt: String
    /// User ID.
    public let userId: String
    /// Identity Provider.
    public let provider: String
    /// ID of the User in the Identity Provider.
    public let providerUid: String
    /// Email of the User in the Identity Provider.
    public let providerEmail: String
    /// Identity Provider Access Token.
    public let providerAccessToken: String
    /// The date of when the access token expires in ISO 8601 format.
    public let providerAccessTokenExpiry: String
    /// Identity Provider Refresh Token.
    public let providerRefreshToken: String
    /// Identity Provider ID token (JWT) from the most recent native sign-in. Empty for identities created through the browser OAuth2 flow.
    public let providerIdToken: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        userId: String,
        provider: String,
        providerUid: String,
        providerEmail: String,
        providerAccessToken: String,
        providerAccessTokenExpiry: String,
        providerRefreshToken: String,
        providerIdToken: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userId = userId
        self.provider = provider
        self.providerUid = providerUid
        self.providerEmail = providerEmail
        self.providerAccessToken = providerAccessToken
        self.providerAccessTokenExpiry = providerAccessTokenExpiry
        self.providerRefreshToken = providerRefreshToken
        self.providerIdToken = providerIdToken
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.userId = try container.contains(.userId) ? container.decode(String.self, forKey: .userId) : ""
        self.provider = try container.contains(.provider) ? container.decode(String.self, forKey: .provider) : ""
        self.providerUid = try container.contains(.providerUid) ? container.decode(String.self, forKey: .providerUid) : ""
        self.providerEmail = try container.contains(.providerEmail) ? container.decode(String.self, forKey: .providerEmail) : ""
        self.providerAccessToken = try container.contains(.providerAccessToken) ? container.decode(String.self, forKey: .providerAccessToken) : ""
        self.providerAccessTokenExpiry = try container.contains(.providerAccessTokenExpiry) ? container.decode(String.self, forKey: .providerAccessTokenExpiry) : ""
        self.providerRefreshToken = try container.contains(.providerRefreshToken) ? container.decode(String.self, forKey: .providerRefreshToken) : ""
        self.providerIdToken = try container.contains(.providerIdToken) ? container.decode(String.self, forKey: .providerIdToken) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(userId, forKey: .userId)
        try container.encode(provider, forKey: .provider)
        try container.encode(providerUid, forKey: .providerUid)
        try container.encode(providerEmail, forKey: .providerEmail)
        try container.encode(providerAccessToken, forKey: .providerAccessToken)
        try container.encode(providerAccessTokenExpiry, forKey: .providerAccessTokenExpiry)
        try container.encode(providerRefreshToken, forKey: .providerRefreshToken)
        try container.encode(providerIdToken, forKey: .providerIdToken)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "userId": userId as Any,
            "provider": provider as Any,
            "providerUid": providerUid as Any,
            "providerEmail": providerEmail as Any,
            "providerAccessToken": providerAccessToken as Any,
            "providerAccessTokenExpiry": providerAccessTokenExpiry as Any,
            "providerRefreshToken": providerRefreshToken as Any,
            "providerIdToken": providerIdToken as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Identity {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "userId": "",
            "provider": "",
            "providerUid": "",
            "providerEmail": "",
            "providerAccessToken": "",
            "providerAccessTokenExpiry": "",
            "providerRefreshToken": "",
            "providerIdToken": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return Identity(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            userId: map["userId"] as! String,
            provider: map["provider"] as! String,
            providerUid: map["providerUid"] as! String,
            providerEmail: map["providerEmail"] as! String,
            providerAccessToken: map["providerAccessToken"] as! String,
            providerAccessTokenExpiry: map["providerAccessTokenExpiry"] as! String,
            providerRefreshToken: map["providerRefreshToken"] as! String,
            providerIdToken: map["providerIdToken"] as! String
        )
    }
}
