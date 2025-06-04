import Foundation
import JSONCodable

/// Logs List
open class LogList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case logs = "logs"
    }

    /// Total number of logs documents that matched your query.
    public let total: Int

    /// List of logs.
    public let logs: [Log]


    init(
        total: Int,
        logs: [Log]
    ) {
        self.total = total
        self.logs = logs
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.logs = try container.decode([Log].self, forKey: .logs)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(logs, forKey: .logs)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "logs": logs.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> LogList {
        return LogList(
            total: map["total"] as? Int ?? 0,
            logs: (map["logs"] as? [[String: Any]] ?? []).map { Log.from(map: $0) }
        )
    }
}
