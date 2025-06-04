import Foundation
import JSONCodable

/// Executions List
open class ExecutionList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case executions = "executions"
    }

    /// Total number of executions documents that matched your query.
    public let total: Int

    /// List of executions.
    public let executions: [Execution]


    init(
        total: Int,
        executions: [Execution]
    ) {
        self.total = total
        self.executions = executions
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.executions = try container.decode([Execution].self, forKey: .executions)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(executions, forKey: .executions)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "executions": executions.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ExecutionList {
        return ExecutionList(
            total: map["total"] as? Int ?? 0,
            executions: (map["executions"] as? [[String: Any]] ?? []).map { Execution.from(map: $0) }
        )
    }
}
