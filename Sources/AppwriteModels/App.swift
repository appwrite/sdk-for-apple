import Foundation
import JSONCodable

/// App
open class App: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case description = "description"
        case clientUri = "clientUri"
        case logoUri = "logoUri"
        case privacyPolicyUrl = "privacyPolicyUrl"
        case termsUrl = "termsUrl"
        case contacts = "contacts"
        case tagline = "tagline"
        case tags = "tags"
        case labels = "labels"
        case images = "images"
        case supportUrl = "supportUrl"
        case dataDeletionUrl = "dataDeletionUrl"
        case redirectUris = "redirectUris"
        case postLogoutRedirectUris = "postLogoutRedirectUris"
        case enabled = "enabled"
        case type = "type"
        case deviceFlow = "deviceFlow"
        case teamId = "teamId"
        case userId = "userId"
        case installationScopes = "installationScopes"
        case installationRedirectUrl = "installationRedirectUrl"
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
    /// Application description shown to users during OAuth2 consent.
    public let description: String
    /// Application homepage URL shown to users during OAuth2 consent.
    public let clientUri: String
    /// Application logo URL shown to users during OAuth2 consent.
    public let logoUri: String
    /// Application privacy policy URL shown to users during OAuth2 consent.
    public let privacyPolicyUrl: String
    /// Application terms of service URL shown to users during OAuth2 consent.
    public let termsUrl: String
    /// Application support or security contact emails.
    public let contacts: [String]
    /// Application tagline shown to users during OAuth2 consent.
    public let tagline: String
    /// Application tags shown to users during OAuth2 consent.
    public let tags: [String]
    /// Application labels. Read-only for clients; only a server SDK using a project API key can update them.
    public let labels: [String]
    /// Application image URLs shown to users during OAuth2 consent.
    public let images: [String]
    /// Application support URL shown to users during OAuth2 consent.
    public let supportUrl: String
    /// Application data deletion URL shown to users during OAuth2 consent.
    public let dataDeletionUrl: String
    /// List of authorized redirect URIs. These URIs can be used to redirect users after they authenticate.
    public let redirectUris: [String]
    /// List of authorized post-logout redirect URIs for OpenID Connect RP-Initiated Logout. The logout endpoint only redirects users to URIs in this list after ending their session.
    public let postLogoutRedirectUris: [String]
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
    /// Scopes the application requests when installed on a team. Organization-level and project-level scopes only.
    public let installationScopes: [String]
    /// URL users are redirected to after creating or updating an installation of this application. Empty for no redirect.
    public let installationRedirectUrl: String
    /// List of application secrets.
    public let secrets: [AppSecret]

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        description: String,
        clientUri: String,
        logoUri: String,
        privacyPolicyUrl: String,
        termsUrl: String,
        contacts: [String],
        tagline: String,
        tags: [String],
        labels: [String],
        images: [String],
        supportUrl: String,
        dataDeletionUrl: String,
        redirectUris: [String],
        postLogoutRedirectUris: [String],
        enabled: Bool,
        type: String,
        deviceFlow: Bool,
        teamId: String,
        userId: String,
        installationScopes: [String],
        installationRedirectUrl: String,
        secrets: [AppSecret]
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.description = description
        self.clientUri = clientUri
        self.logoUri = logoUri
        self.privacyPolicyUrl = privacyPolicyUrl
        self.termsUrl = termsUrl
        self.contacts = contacts
        self.tagline = tagline
        self.tags = tags
        self.labels = labels
        self.images = images
        self.supportUrl = supportUrl
        self.dataDeletionUrl = dataDeletionUrl
        self.redirectUris = redirectUris
        self.postLogoutRedirectUris = postLogoutRedirectUris
        self.enabled = enabled
        self.type = type
        self.deviceFlow = deviceFlow
        self.teamId = teamId
        self.userId = userId
        self.installationScopes = installationScopes
        self.installationRedirectUrl = installationRedirectUrl
        self.secrets = secrets
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.clientUri = try container.decode(String.self, forKey: .clientUri)
        self.logoUri = try container.decode(String.self, forKey: .logoUri)
        self.privacyPolicyUrl = try container.decode(String.self, forKey: .privacyPolicyUrl)
        self.termsUrl = try container.decode(String.self, forKey: .termsUrl)
        self.contacts = try container.decode([String].self, forKey: .contacts)
        self.tagline = try container.decode(String.self, forKey: .tagline)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.labels = try container.decode([String].self, forKey: .labels)
        self.images = try container.decode([String].self, forKey: .images)
        self.supportUrl = try container.decode(String.self, forKey: .supportUrl)
        self.dataDeletionUrl = try container.decode(String.self, forKey: .dataDeletionUrl)
        self.redirectUris = try container.decode([String].self, forKey: .redirectUris)
        self.postLogoutRedirectUris = try container.decode([String].self, forKey: .postLogoutRedirectUris)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.type = try container.decode(String.self, forKey: .type)
        self.deviceFlow = try container.decode(Bool.self, forKey: .deviceFlow)
        self.teamId = try container.decode(String.self, forKey: .teamId)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.installationScopes = try container.decode([String].self, forKey: .installationScopes)
        self.installationRedirectUrl = try container.decode(String.self, forKey: .installationRedirectUrl)
        self.secrets = try container.decode([AppSecret].self, forKey: .secrets)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(clientUri, forKey: .clientUri)
        try container.encode(logoUri, forKey: .logoUri)
        try container.encode(privacyPolicyUrl, forKey: .privacyPolicyUrl)
        try container.encode(termsUrl, forKey: .termsUrl)
        try container.encode(contacts, forKey: .contacts)
        try container.encode(tagline, forKey: .tagline)
        try container.encode(tags, forKey: .tags)
        try container.encode(labels, forKey: .labels)
        try container.encode(images, forKey: .images)
        try container.encode(supportUrl, forKey: .supportUrl)
        try container.encode(dataDeletionUrl, forKey: .dataDeletionUrl)
        try container.encode(redirectUris, forKey: .redirectUris)
        try container.encode(postLogoutRedirectUris, forKey: .postLogoutRedirectUris)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(type, forKey: .type)
        try container.encode(deviceFlow, forKey: .deviceFlow)
        try container.encode(teamId, forKey: .teamId)
        try container.encode(userId, forKey: .userId)
        try container.encode(installationScopes, forKey: .installationScopes)
        try container.encode(installationRedirectUrl, forKey: .installationRedirectUrl)
        try container.encode(secrets, forKey: .secrets)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "description": description as Any,
            "clientUri": clientUri as Any,
            "logoUri": logoUri as Any,
            "privacyPolicyUrl": privacyPolicyUrl as Any,
            "termsUrl": termsUrl as Any,
            "contacts": contacts as Any,
            "tagline": tagline as Any,
            "tags": tags as Any,
            "labels": labels as Any,
            "images": images as Any,
            "supportUrl": supportUrl as Any,
            "dataDeletionUrl": dataDeletionUrl as Any,
            "redirectUris": redirectUris as Any,
            "postLogoutRedirectUris": postLogoutRedirectUris as Any,
            "enabled": enabled as Any,
            "type": type as Any,
            "deviceFlow": deviceFlow as Any,
            "teamId": teamId as Any,
            "userId": userId as Any,
            "installationScopes": installationScopes as Any,
            "installationRedirectUrl": installationRedirectUrl as Any,
            "secrets": secrets.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> App {
        return App(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            description: map["description"] as! String,
            clientUri: map["clientUri"] as! String,
            logoUri: map["logoUri"] as! String,
            privacyPolicyUrl: map["privacyPolicyUrl"] as! String,
            termsUrl: map["termsUrl"] as! String,
            contacts: map["contacts"] as! [String],
            tagline: map["tagline"] as! String,
            tags: map["tags"] as! [String],
            labels: map["labels"] as! [String],
            images: map["images"] as! [String],
            supportUrl: map["supportUrl"] as! String,
            dataDeletionUrl: map["dataDeletionUrl"] as! String,
            redirectUris: map["redirectUris"] as! [String],
            postLogoutRedirectUris: map["postLogoutRedirectUris"] as! [String],
            enabled: map["enabled"] as! Bool,
            type: map["type"] as! String,
            deviceFlow: map["deviceFlow"] as! Bool,
            teamId: map["teamId"] as! String,
            userId: map["userId"] as! String,
            installationScopes: map["installationScopes"] as! [String],
            installationRedirectUrl: map["installationRedirectUrl"] as! String,
            secrets: (map["secrets"] as! [[String: Any]]).map { AppSecret.from(map: $0) }
        )
    }
}
