import Foundation
import JSONCodable

/// Team
open class Team<T : Codable>: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case total = "total"
        case prefs = "prefs"
    }

    /// Team ID.
    public let id: String
    /// Team creation date in ISO 8601 format.
    public let createdAt: String
    /// Team update date in ISO 8601 format.
    public let updatedAt: String
    /// Team name.
    public let name: String
    /// Total number of team members.
    public let total: Int
    /// Team preferences as a key-value object
    public let prefs: Preferences<T>

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        total: Int,
        prefs: Preferences<T>
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.total = total
        self.prefs = prefs
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.total = try container.decode(Int.self, forKey: .total)
        self.prefs = try container.decode(Preferences<T>.self, forKey: .prefs)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(total, forKey: .total)
        try container.encode(prefs, forKey: .prefs)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "total": total as Any,
            "prefs": prefs.toMap() as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Team {
        return Team(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            total: map["total"] as! Int,
            prefs: Preferences.from(map: map["prefs"] as! [String: Any])
        )
    }
}
