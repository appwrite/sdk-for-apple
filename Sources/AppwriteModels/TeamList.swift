
/// Teams List
public class TeamList {

    /// Total sum of items in the list.
    public let sum: Int

    /// List of teams.
    public let teams: [Team]

    init(
        sum: Int,
        teams: [Team]
    ) {
        self.sum = sum
        self.teams = teams
    }

    public static func from(map: [String: Any]) -> TeamList {
        return TeamList(
            sum: map["sum"] as! Int,
            teams: (map["teams"] as! [[String: Any]]).map { Team.from(map: $0) } as! [Team]
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "teams": teams.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                        
}