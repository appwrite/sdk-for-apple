import Foundation
import JSONCodable

/// App
open class App: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case redirectUris = "redirectUris"
        case enabled = "enabled"
        case type = "type"
        case deviceFlow = "deviceFlow"
        case teamId = "teamId"
        case userId = "userId"
        case secrets = "secrets"
    }

    /// App ID.
    public let id: String
    /// App creation time in ISO 8601 format.
    public let createdAt: String
    /// App update date in ISO 8601 format.
    public let updatedAt: String
    /// Application name.
    public let name: String
    /// List of authorized redirect URIs. These URIs can be used to redirect users after they authenticate.
    public let redirectUris: [String]
    /// Whether the app is enabled or not.
    public let enabled: Bool
    /// OAuth2 client type. `public` for SPAs, mobile, and native apps that cannot keep a client secret (PKCE required); `confidential` for server-side clients that authenticate with a client secret.
    public let type: String
    /// Whether this client may use the OAuth2 Device Authorization Grant (RFC 8628).
    public let deviceFlow: Bool
    /// ID of team that owns the application, if owned by team. Otherwise, user ID will be used.
    public let teamId: String
    /// ID of user who owns the application, if owned by user. Otherwise, team ID will be used.
    public let userId: String
    /// List of application secrets.
    public let secrets: [AppSecret]

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        redirectUris: [String],
        enabled: Bool,
        type: String,
        deviceFlow: Bool,
        teamId: String,
        userId: String,
        secrets: [AppSecret]
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.redirectUris = redirectUris
        self.enabled = enabled
        self.type = type
        self.deviceFlow = deviceFlow
        self.teamId = teamId
        self.userId = userId
        self.secrets = secrets
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.redirectUris = try container.decode([String].self, forKey: .redirectUris)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.type = try container.decode(String.self, forKey: .type)
        self.deviceFlow = try container.decode(Bool.self, forKey: .deviceFlow)
        self.teamId = try container.decode(String.self, forKey: .teamId)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.secrets = try container.decode([AppSecret].self, forKey: .secrets)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(redirectUris, forKey: .redirectUris)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(type, forKey: .type)
        try container.encode(deviceFlow, forKey: .deviceFlow)
        try container.encode(teamId, forKey: .teamId)
        try container.encode(userId, forKey: .userId)
        try container.encode(secrets, forKey: .secrets)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "redirectUris": redirectUris as Any,
            "enabled": enabled as Any,
            "type": type as Any,
            "deviceFlow": deviceFlow as Any,
            "teamId": teamId as Any,
            "userId": userId as Any,
            "secrets": secrets.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> App {
        return App(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            redirectUris: map["redirectUris"] as! [String],
            enabled: map["enabled"] as! Bool,
            type: map["type"] as! String,
            deviceFlow: map["deviceFlow"] as! Bool,
            teamId: map["teamId"] as! String,
            userId: map["userId"] as! String,
            secrets: (map["secrets"] as! [[String: Any]]).map { AppSecret.from(map: $0) }
        )
    }
}
