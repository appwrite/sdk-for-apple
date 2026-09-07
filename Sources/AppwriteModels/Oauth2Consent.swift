import Foundation
import JSONCodable

/// OAuth2 Consent
open class Oauth2Consent: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case userId = "userId"
        case appId = "appId"
        case cimdUrl = "cimdUrl"
        case scopes = "scopes"
        case resources = "resources"
        case authorizationDetails = "authorizationDetails"
        case expire = "expire"
    }

    /// Consent ID.
    public let id: String
    /// Consent creation time in ISO 8601 format.
    public let createdAt: String
    /// Consent update date in ISO 8601 format.
    public let updatedAt: String
    /// ID of the user the consent belongs to.
    public let userId: String
    /// ID of the registered app the consent was given to. Empty for URL-form (CIMD) clients.
    public let appId: String
    /// Client ID metadata document URL of the client the consent was given to. Empty for registered apps.
    public let cimdUrl: String
    /// OAuth2 scopes the user consented to.
    public let scopes: [String]
    /// RFC 8707 resource indicators the user consented to.
    public let resources: [String]
    /// Authorization details the user consented to, as a JSON string. Each entry has a `type` plus project-defined fields.
    public let authorizationDetails: String
    /// Consent expiration time in ISO 8601 format. Empty when the consent has no token-bound expiry yet.
    public let expire: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        userId: String,
        appId: String,
        cimdUrl: String,
        scopes: [String],
        resources: [String],
        authorizationDetails: String,
        expire: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userId = userId
        self.appId = appId
        self.cimdUrl = cimdUrl
        self.scopes = scopes
        self.resources = resources
        self.authorizationDetails = authorizationDetails
        self.expire = expire
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.appId = try container.decode(String.self, forKey: .appId)
        self.cimdUrl = try container.decode(String.self, forKey: .cimdUrl)
        self.scopes = try container.decode([String].self, forKey: .scopes)
        self.resources = try container.decode([String].self, forKey: .resources)
        self.authorizationDetails = try container.decode(String.self, forKey: .authorizationDetails)
        self.expire = try container.decode(String.self, forKey: .expire)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(userId, forKey: .userId)
        try container.encode(appId, forKey: .appId)
        try container.encode(cimdUrl, forKey: .cimdUrl)
        try container.encode(scopes, forKey: .scopes)
        try container.encode(resources, forKey: .resources)
        try container.encode(authorizationDetails, forKey: .authorizationDetails)
        try container.encode(expire, forKey: .expire)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "userId": userId as Any,
            "appId": appId as Any,
            "cimdUrl": cimdUrl as Any,
            "scopes": scopes as Any,
            "resources": resources as Any,
            "authorizationDetails": authorizationDetails as Any,
            "expire": expire as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Oauth2Consent {
        return Oauth2Consent(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            userId: map["userId"] as! String,
            appId: map["appId"] as! String,
            cimdUrl: map["cimdUrl"] as! String,
            scopes: map["scopes"] as! [String],
            resources: map["resources"] as! [String],
            authorizationDetails: map["authorizationDetails"] as! String,
            expire: map["expire"] as! String
        )
    }
}
