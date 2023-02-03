import Foundation
import JSONCodable

/// Team
public class Team {

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


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        total: Int
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.total = total
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "total": total as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Team {
        return Team(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            total: map["total"] as! Int
        )
    }
}
