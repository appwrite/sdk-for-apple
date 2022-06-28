
/// Execution
public class Execution {

    /// Execution ID.
    public let id: String

    /// Execution creation date in Unix timestamp.
    public let createdAt: Int

    /// Execution update date in Unix timestamp.
    public let updatedAt: Int

    /// Execution read permissions.
    public let read: [Any]

    /// Function ID.
    public let functionId: String

    /// The trigger that caused the function to execute. Possible values can be: `http`, `schedule`, or `event`.
    public let trigger: String

    /// The status of the function execution. Possible values can be: `waiting`, `processing`, `completed`, or `failed`.
    public let status: String

    /// The script status code.
    public let statusCode: Int

    /// The script response output string. Logs the last 4,000 characters of the execution response output.
    public let response: String

    /// The script stderr output string. Logs the last 4,000 characters of the execution stderr output
    public let stderr: String

    /// The script execution time in seconds.
    public let time: Double

    init(
        id: String,
        createdAt: Int,
        updatedAt: Int,
        read: [Any],
        functionId: String,
        trigger: String,
        status: String,
        statusCode: Int,
        response: String,
        stderr: String,
        time: Double
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.read = read
        self.functionId = functionId
        self.trigger = trigger
        self.status = status
        self.statusCode = statusCode
        self.response = response
        self.stderr = stderr
        self.time = time
    }

    public static func from(map: [String: Any]) -> Execution {
        return Execution(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! Int,
            updatedAt: map["$updatedAt"] as! Int,
            read: map["$read"] as! [Any],
            functionId: map["functionId"] as! String,
            trigger: map["trigger"] as! String,
            status: map["status"] as! String,
            statusCode: map["statusCode"] as! Int,
            response: map["response"] as! String,
            stderr: map["stderr"] as! String,
            time: map["time"] as! Double
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$read": read as Any,
            "functionId": functionId as Any,
            "trigger": trigger as Any,
            "status": status as Any,
            "statusCode": statusCode as Any,
            "response": response as Any,
            "stderr": stderr as Any,
            "time": time as Any
        ]
    }
                                                
}