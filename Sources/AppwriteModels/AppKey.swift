import Foundation
import JSONCodable

/// AppKey
open class AppKey: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case appId = "appId"
        case secret = "secret"
        case hint = "hint"
        case createdById = "createdById"
        case createdByName = "createdByName"
        case lastAccessedAt = "lastAccessedAt"
    }

    /// App key ID.
    public let id: String
    /// App key creation time in ISO 8601 format.
    public let createdAt: String
    /// App key update time in ISO 8601 format.
    public let updatedAt: String
    /// Application ID this app key belongs to.
    public let appId: String
    /// App key secret.
    public let secret: String
    /// Last few characters of the app key secret, used to help identify it.
    public let hint: String
    /// ID of the user who created the app key.
    public let createdById: String
    /// Name of the user who created the app key.
    public let createdByName: String
    /// Time the app key was last used for authentication in ISO 8601 format. Null if never used.
    public let lastAccessedAt: String?

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        appId: String,
        secret: String,
        hint: String,
        createdById: String,
        createdByName: String,
        lastAccessedAt: String?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.appId = appId
        self.secret = secret
        self.hint = hint
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
        self.secret = try container.decode(String.self, forKey: .secret)
        self.hint = try container.decode(String.self, forKey: .hint)
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
        try container.encode(secret, forKey: .secret)
        try container.encode(hint, forKey: .hint)
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
            "secret": secret as Any,
            "hint": hint as Any,
            "createdById": createdById as Any,
            "createdByName": createdByName as Any,
            "lastAccessedAt": lastAccessedAt as Any,
        ]
    }

    public static func from(map: [String: Any]) -> AppKey {
        return AppKey(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            appId: map["appId"] as! String,
            secret: map["secret"] as! String,
            hint: map["hint"] as! String,
            createdById: map["createdById"] as! String,
            createdByName: map["createdByName"] as! String,
            lastAccessedAt: map["lastAccessedAt"] as? String
        )
    }
}
