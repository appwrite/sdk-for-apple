
/// Execution
public class Execution {

    /// Execution ID.
    public let id: String

    /// Execution creation date in ISO 8601 format.
    public let createdAt: String

    /// Execution upate date in ISO 8601 format.
    public let updatedAt: String

    /// Execution roles.
    public let permissions: [Any]

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

    /// The script stdout output string. Logs the last 4,000 characters of the execution stdout output. This will return an empty string unless the response is returned using an API key or as part of a webhook payload.
    public let stdout: String

    /// The script stderr output string. Logs the last 4,000 characters of the execution stderr output. This will return an empty string unless the response is returned using an API key or as part of a webhook payload.
    public let stderr: String

    /// The script execution time in seconds.
    public let time: Double

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        permissions: [Any],
        functionId: String,
        trigger: String,
        status: String,
        statusCode: Int,
        response: String,
        stdout: String,
        stderr: String,
        time: Double
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.functionId = functionId
        self.trigger = trigger
        self.status = status
        self.statusCode = statusCode
        self.response = response
        self.stdout = stdout
        self.stderr = stderr
        self.time = time
    }

    public static func from(map: [String: Any]) -> Execution {
        return Execution(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [Any],
            functionId: map["functionId"] as! String,
            trigger: map["trigger"] as! String,
            status: map["status"] as! String,
            statusCode: map["statusCode"] as! Int,
            response: map["response"] as! String,
            stdout: map["stdout"] as! String,
            stderr: map["stderr"] as! String,
            time: map["time"] as! Double
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$permissions": permissions as Any,
            "functionId": functionId as Any,
            "trigger": trigger as Any,
            "status": status as Any,
            "statusCode": statusCode as Any,
            "response": response as Any,
            "stdout": stdout as Any,
            "stderr": stderr as Any,
            "time": time as Any
        ]
    }
                                                    
}