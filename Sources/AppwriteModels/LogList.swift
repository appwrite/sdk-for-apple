
/// Logs List
public class LogList {

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

    public static func from(map: [String: Any]) -> LogList {
        return LogList(
            total: map["total"] as! Int,
            logs: (map["logs"] as! [[String: Any]]).map { Log.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "logs": logs.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                    
}
