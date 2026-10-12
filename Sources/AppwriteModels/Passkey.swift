import Foundation
import JSONCodable

/// Passkey
open class Passkey: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case accessedAt = "accessedAt"
    }

    /// Passkey ID.
    public let id: String
    /// Passkey creation date in ISO 8601 format.
    public let createdAt: String
    /// Passkey update date in ISO 8601 format.
    public let updatedAt: String
    /// Passkey name.
    public let name: String
    /// Most recent sign-in with this passkey in ISO 8601 format. Empty until the passkey is used to sign in.
    public let accessedAt: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        accessedAt: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.accessedAt = accessedAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.accessedAt = try container.contains(.accessedAt) ? container.decode(String.self, forKey: .accessedAt) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(accessedAt, forKey: .accessedAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "accessedAt": accessedAt as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Passkey {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "name": "",
            "accessedAt": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return Passkey(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            accessedAt: map["accessedAt"] as! String
        )
    }
}
