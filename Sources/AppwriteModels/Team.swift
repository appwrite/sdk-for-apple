
/// Team
public class Team {

    /// Team ID.
    public let id: String

    /// Team name.
    public let name: String

    /// Team creation date in Unix timestamp.
    public let dateCreated: Int

    /// Total number of team members.
    public let total: Int

    init(
        id: String,
        name: String,
        dateCreated: Int,
        total: Int
    ) {
        self.id = id
        self.name = name
        self.dateCreated = dateCreated
        self.total = total
    }

    public static func from(map: [String: Any]) -> Team {
        return Team(
            id: map["$id"] as! String,
            name: map["name"] as! String,
            dateCreated: map["dateCreated"] as! Int,
            total: map["total"] as! Int
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "name": name as Any,
            "dateCreated": dateCreated as Any,
            "total": total as Any
        ]
    }
                    
}