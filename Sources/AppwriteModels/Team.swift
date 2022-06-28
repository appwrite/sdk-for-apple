
/// Team
public class Team {

    /// Team ID.
    public let id: String

    /// Team creation date in Unix timestamp.
    public let createdAt: Int

    /// Team update date in Unix timestamp.
    public let updatedAt: Int

    /// Team name.
    public let name: String

    /// Total number of team members.
    public let total: Int

    init(
        id: String,
        createdAt: Int,
        updatedAt: Int,
        name: String,
        total: Int
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.total = total
    }

    public static func from(map: [String: Any]) -> Team {
        return Team(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! Int,
            updatedAt: map["$updatedAt"] as! Int,
            name: map["name"] as! String,
            total: map["total"] as! Int
        )
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
                        
}