import Foundation
import JSONCodable

/// Presences List
open class PresenceList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case presences = "presences"
    }

    /// Total number of presences that matched your query.
    public let total: Int
    /// List of presences.
    public let presences: [Presence]

    init(
        total: Int,
        presences: [Presence]
    ) {
        self.total = total
        self.presences = presences
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.presences = try container.decode([Presence].self, forKey: .presences)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(presences, forKey: .presences)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "presences": presences.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> PresenceList {
        return PresenceList(
            total: map["total"] as! Int,
            presences: (map["presences"] as! [[String: Any]]).map { Presence.from(map: $0) }
        )
    }
}
