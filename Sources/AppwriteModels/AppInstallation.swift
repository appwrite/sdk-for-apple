import Foundation
import JSONCodable

/// AppInstallation
open class AppInstallation: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case appId = "appId"
        case teamId = "teamId"
        case scopes = "scopes"
        case authorizationDetails = "authorizationDetails"
        case createdById = "createdById"
        case createdByName = "createdByName"
        case lastAccessedAt = "lastAccessedAt"
    }

    /// Installation ID.
    public let id: String
    /// Installation creation time in ISO 8601 format.
    public let createdAt: String
    /// Installation update time in ISO 8601 format.
    public let updatedAt: String
    /// ID of the installed application.
    public let appId: String
    /// ID of the team the application is installed on.
    public let teamId: String
    /// Scopes granted to the application. Snapshot of the application&#039;s installation scopes taken when the installation was created or last updated.
    public let scopes: [String]
    /// Authorization details granted to the application. Rich authorization request (RFC 9396) style entries; the Appwrite Console stores authorized project IDs here.
    public let authorizationDetails: [AnyCodable]
    /// ID of the user who created the installation.
    public let createdById: String
    /// Name of the user who created the installation.
    public let createdByName: String
    /// Time an access token was last issued for the installation in ISO 8601 format. Null if never used.
    public let lastAccessedAt: String?

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        appId: String,
        teamId: String,
        scopes: [String],
        authorizationDetails: [AnyCodable],
        createdById: String,
        createdByName: String,
        lastAccessedAt: String?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.appId = appId
        self.teamId = teamId
        self.scopes = scopes
        self.authorizationDetails = authorizationDetails
        self.createdById = createdById
        self.createdByName = createdByName
        self.lastAccessedAt = lastAccessedAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.appId = try container.decode(String.self, forKey: .appId)
        self.teamId = try container.decode(String.self, forKey: .teamId)
        self.scopes = try container.decode([String].self, forKey: .scopes)
        self.authorizationDetails = try container.decode([AnyCodable].self, forKey: .authorizationDetails)
        self.createdById = try container.decode(String.self, forKey: .createdById)
        self.createdByName = try container.decode(String.self, forKey: .createdByName)
        self.lastAccessedAt = try container.decodeIfPresent(String.self, forKey: .lastAccessedAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(appId, forKey: .appId)
        try container.encode(teamId, forKey: .teamId)
        try container.encode(scopes, forKey: .scopes)
        try container.encode(authorizationDetails, forKey: .authorizationDetails)
        try container.encode(createdById, forKey: .createdById)
        try container.encode(createdByName, forKey: .createdByName)
        try container.encodeIfPresent(lastAccessedAt, forKey: .lastAccessedAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "appId": appId as Any,
            "teamId": teamId as Any,
            "scopes": scopes as Any,
            "authorizationDetails": authorizationDetails as Any,
            "createdById": createdById as Any,
            "createdByName": createdByName as Any,
            "lastAccessedAt": lastAccessedAt as Any,
        ]
    }

    public static func from(map: [String: Any]) -> AppInstallation {
        return AppInstallation(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            appId: map["appId"] as! String,
            teamId: map["teamId"] as! String,
            scopes: map["scopes"] as! [String],
            authorizationDetails: (map["authorizationDetails"] as! [Any]).map { AnyCodable($0) },
            createdById: map["createdById"] as! String,
            createdByName: map["createdByName"] as! String,
            lastAccessedAt: map["lastAccessedAt"] as? String
        )
    }
}
