import Foundation
import JSONCodable

/// OAuth2 Consent Token
open class Oauth2ConsentToken: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case consentId = "consentId"
        case userId = "userId"
        case appId = "appId"
        case cimdUrl = "cimdUrl"
        case scopes = "scopes"
        case resources = "resources"
        case authorizationDetails = "authorizationDetails"
        case expire = "expire"
    }

    /// Token family ID.
    public let id: String
    /// Token creation time in ISO 8601 format.
    public let createdAt: String
    /// Token update date in ISO 8601 format. Refreshing the token family updates this.
    public let updatedAt: String
    /// ID of the consent the token family was issued under.
    public let consentId: String
    /// ID of the user the token family belongs to.
    public let userId: String
    /// ID of the registered app the token family was issued to. Empty for URL-form (CIMD) clients.
    public let appId: String
    /// Client ID metadata document URL of the client the token family was issued to. Empty for registered apps.
    public let cimdUrl: String
    /// OAuth2 scopes granted on the token family.
    public let scopes: [String]
    /// RFC 8707 resource indicators granted on the token family.
    public let resources: [String]
    /// Authorization details granted on the token family, as a JSON string. Each entry has a `type` plus project-defined fields.
    public let authorizationDetails: String
    /// Expiration time of the current access token of this family in ISO 8601 format.
    public let expire: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        consentId: String,
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
        self.consentId = consentId
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
        self.consentId = try container.decode(String.self, forKey: .consentId)
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
        try container.encode(consentId, forKey: .consentId)
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
            "consentId": consentId as Any,
            "userId": userId as Any,
            "appId": appId as Any,
            "cimdUrl": cimdUrl as Any,
            "scopes": scopes as Any,
            "resources": resources as Any,
            "authorizationDetails": authorizationDetails as Any,
            "expire": expire as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Oauth2ConsentToken {
        return Oauth2ConsentToken(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            consentId: map["consentId"] as! String,
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
