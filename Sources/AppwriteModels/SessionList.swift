import Foundation
import JSONCodable

/// Sessions List
open class SessionList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case sessions = "sessions"
    }

    /// Total number of sessions documents that matched your query.
    public let total: Int

    /// List of sessions.
    public let sessions: [Session]


    init(
        total: Int,
        sessions: [Session]
    ) {
        self.total = total
        self.sessions = sessions
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.sessions = try container.decode([Session].self, forKey: .sessions)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(sessions, forKey: .sessions)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "sessions": sessions.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> SessionList {
        return SessionList(
            total: map["total"] as? Int ?? 0,
            sessions: (map["sessions"] as? [[String: Any]] ?? []).map { Session.from(map: $0) }
        )
    }
}
