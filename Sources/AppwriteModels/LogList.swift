
/// Logs List
public class LogList {

    /// Total number of items available on the server.
    public let sum: Int

    /// List of logs.
    public let logs: [Log]

    init(
        sum: Int,
        logs: [Log]
    ) {
        self.sum = sum
        self.logs = logs
    }

    public static func from(map: [String: Any]) -> LogList {
        return LogList(
            sum: map["sum"] as! Int,
            logs: (map["logs"] as! [[String: Any]]).map { Log.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "logs": logs.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                    
}