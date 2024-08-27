import Foundation
import JSONCodable

/// Executions List
public class ExecutionList {

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

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "executions": executions.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ExecutionList {
        return ExecutionList(
            total: map["total"] as! Int,
            executions: (map["executions"] as! [[String: Any]]).map { Execution.from(map: $0) }
        )
    }
}
