import Foundation
import JSONCodable

/// Team
public class Team<T : Codable> {

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
