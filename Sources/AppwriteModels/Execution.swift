import Foundation
import JSONCodable

/// Execution
public class Execution {

    /// Execution ID.
    public let id: String

    /// Execution creation date in ISO 8601 format.
    public let createdAt: String

    /// Execution upate date in ISO 8601 format.
    public let updatedAt: String

    /// Execution roles.
    public let permissions: [String]

    /// Function ID.
    public let functionId: String

    /// The trigger that caused the function to execute. Possible values can be: `http`, `schedule`, or `event`.
    public let trigger: String

    /// The status of the function execution. Possible values can be: `waiting`, `processing`, `completed`, or `failed`.
    public let status: String

    /// HTTP request method type.
    public let requestMethod: String

    /// HTTP request path and query.
    public let requestPath: String

    /// HTTP response headers as a key-value object. This will return only whitelisted headers. All headers are returned if execution is created as synchronous.
    public let requestHeaders: [Headers]

    /// HTTP response status code.
    public let responseStatusCode: Int

    /// HTTP response body. This will return empty unless execution is created as synchronous.
    public let responseBody: String

    /// HTTP response headers as a key-value object. This will return only whitelisted headers. All headers are returned if execution is created as synchronous.
    public let responseHeaders: [Headers]

    /// Function logs. Includes the last 4,000 characters. This will return an empty string unless the response is returned using an API key or as part of a webhook payload.
    public let logs: String

    /// Function errors. Includes the last 4,000 characters. This will return an empty string unless the response is returned using an API key or as part of a webhook payload.
    public let errors: String

    /// Function execution duration in seconds.
    public let duration: Double

    /// The scheduled time for execution. If left empty, execution will be queued immediately.
    public let scheduledAt: String?


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        permissions: [String],
        functionId: String,
        trigger: String,
        status: String,
        requestMethod: String,
        requestPath: String,
        requestHeaders: [Headers],
        responseStatusCode: Int,
        responseBody: String,
        responseHeaders: [Headers],
        logs: String,
        errors: String,
        duration: Double,
        scheduledAt: String?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.functionId = functionId
        self.trigger = trigger
        self.status = status
        self.requestMethod = requestMethod
        self.requestPath = requestPath
        self.requestHeaders = requestHeaders
        self.responseStatusCode = responseStatusCode
        self.responseBody = responseBody
        self.responseHeaders = responseHeaders
        self.logs = logs
        self.errors = errors
        self.duration = duration
        self.scheduledAt = scheduledAt
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
            "requestMethod": requestMethod as Any,
            "requestPath": requestPath as Any,
            "requestHeaders": requestHeaders.map { $0.toMap() } as Any,
            "responseStatusCode": responseStatusCode as Any,
            "responseBody": responseBody as Any,
            "responseHeaders": responseHeaders.map { $0.toMap() } as Any,
            "logs": logs as Any,
            "errors": errors as Any,
            "duration": duration as Any,
            "scheduledAt": scheduledAt as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Execution {
        return Execution(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [String],
            functionId: map["functionId"] as! String,
            trigger: map["trigger"] as! String,
            status: map["status"] as! String,
            requestMethod: map["requestMethod"] as! String,
            requestPath: map["requestPath"] as! String,
            requestHeaders: (map["requestHeaders"] as! [[String: Any]]).map { Headers.from(map: $0) },
            responseStatusCode: map["responseStatusCode"] as! Int,
            responseBody: map["responseBody"] as! String,
            responseHeaders: (map["responseHeaders"] as! [[String: Any]]).map { Headers.from(map: $0) },
            logs: map["logs"] as! String,
            errors: map["errors"] as! String,
            duration: map["duration"] as! Double,
            scheduledAt: map["scheduledAt"] as? String
        )
    }
}
