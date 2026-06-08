import Foundation
import JSONCodable

/// OAuth2 Grant
open class Oauth2Grant: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case userId = "userId"
        case appId = "appId"
        case scopes = "scopes"
        case authorizationDetails = "authorizationDetails"
        case prompt = "prompt"
        case redirectUri = "redirectUri"
        case authTime = "authTime"
        case expire = "expire"
    }

    /// Grant ID.
    public let id: String
    /// Grant creation time in ISO 8601 format.
    public let createdAt: String
    /// Grant update date in ISO 8601 format.
    public let updatedAt: String
    /// ID of the user the grant belongs to.
    public let userId: String
    /// ID of the OAuth2 client (app) the grant was requested for.
    public let appId: String
    /// Requested OAuth2 scopes the user is being asked to consent to.
    public let scopes: [String]
    /// Requested authorization_details the user is being asked to consent to, as a JSON string. Each entry has a `type` plus project-defined fields.
    public let authorizationDetails: String
    /// OIDC prompt directive the consent screen should honor. Space-separated list of: login, consent, select_account.
    public let prompt: String
    /// Redirect URI the user will be sent to after the flow completes.
    public let redirectUri: String
    /// Unix timestamp of when the user last authenticated.
    public let authTime: Int
    /// Grant expiration time in ISO 8601 format.
    public let expire: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        userId: String,
        appId: String,
        scopes: [String],
        authorizationDetails: String,
        prompt: String,
        redirectUri: String,
        authTime: Int,
        expire: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userId = userId
        self.appId = appId
        self.scopes = scopes
        self.authorizationDetails = authorizationDetails
        self.prompt = prompt
        self.redirectUri = redirectUri
        self.authTime = authTime
        self.expire = expire
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.appId = try container.decode(String.self, forKey: .appId)
        self.scopes = try container.decode([String].self, forKey: .scopes)
        self.authorizationDetails = try container.decode(String.self, forKey: .authorizationDetails)
        self.prompt = try container.decode(String.self, forKey: .prompt)
        self.redirectUri = try container.decode(String.self, forKey: .redirectUri)
        self.authTime = try container.decode(Int.self, forKey: .authTime)
        self.expire = try container.decode(String.self, forKey: .expire)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(userId, forKey: .userId)
        try container.encode(appId, forKey: .appId)
        try container.encode(scopes, forKey: .scopes)
        try container.encode(authorizationDetails, forKey: .authorizationDetails)
        try container.encode(prompt, forKey: .prompt)
        try container.encode(redirectUri, forKey: .redirectUri)
        try container.encode(authTime, forKey: .authTime)
        try container.encode(expire, forKey: .expire)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "userId": userId as Any,
            "appId": appId as Any,
            "scopes": scopes as Any,
            "authorizationDetails": authorizationDetails as Any,
            "prompt": prompt as Any,
            "redirectUri": redirectUri as Any,
            "authTime": authTime as Any,
            "expire": expire as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Oauth2Grant {
        return Oauth2Grant(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            userId: map["userId"] as! String,
            appId: map["appId"] as! String,
            scopes: map["scopes"] as! [String],
            authorizationDetails: map["authorizationDetails"] as! String,
            prompt: map["prompt"] as! String,
            redirectUri: map["redirectUri"] as! String,
            authTime: map["authTime"] as! Int,
            expire: map["expire"] as! String
        )
    }
}
