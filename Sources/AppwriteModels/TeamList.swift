import Foundation
import JSONCodable

/// Teams List
open class TeamList<T: Codable>: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case teams = "teams"
    }

    /// Total number of teams that matched your query.
    public let total: Int
    /// List of teams.
    public let teams: [Team<T>]

    init(
        total: Int,
        teams: [Team<T>]
    ) {
        self.total = total
        self.teams = teams
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.teams = try container.decode([Team<T>].self, forKey: .teams)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(teams, forKey: .teams)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "teams": teams.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> TeamList {
        let defaults: [String: Any] = [
            "total": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return TeamList(
            total: map["total"] as! Int,
            teams: (map["teams"] as! [[String: Any]]).map { Team.from(map: $0) }
        )
    }
}
