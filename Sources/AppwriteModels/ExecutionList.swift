
/// Executions List
public class ExecutionList {

    /// Total sum of items in the list.
    public let sum: Int

    /// List of executions.
    public let executions: [Execution]

    init(
        sum: Int,
        executions: [Execution]
    ) {
        self.sum = sum
        self.executions = executions
    }

    public static func from(map: [String: Any]) -> ExecutionList {
        return ExecutionList(
            sum: map["sum"] as! Int,
            executions: (map["executions"] as! [[String: Any]]).map { Execution.from(map: $0) } as! [Execution]
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "executions": executions.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                        
}