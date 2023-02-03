import Foundation
import JSONCodable

/// Teams List
public class TeamList {

    /// Total number of teams documents that matched your query.
    public let total: Int

    /// List of teams.
    public let teams: [Team]


    init(
        total: Int,
        teams: [Team]
    ) {
        self.total = total
        self.teams = teams
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "teams": teams.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> TeamList {
        return TeamList(
            total: map["total"] as! Int,
            teams: (map["teams"] as! [[String: Any]]).map { Team.from(map: $0) }
        )
    }
}
