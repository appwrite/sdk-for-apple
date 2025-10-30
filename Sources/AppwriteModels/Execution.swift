import Foundation
import JSONCodable
import AppwriteEnums

/// Execution
open class Execution: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case permissions = "$permissions"
        case functionId = "functionId"
        case deploymentId = "deploymentId"
        case trigger = "trigger"
        case status = "status"
        case requestMethod = "requestMethod"
        case requestPath = "requestPath"
        case requestHeaders = "requestHeaders"
        case responseStatusCode = "responseStatusCode"
        case responseBody = "responseBody"
        case responseHeaders = "responseHeaders"
        case logs = "logs"
        case errors = "errors"
        case duration = "duration"
        case scheduledAt = "scheduledAt"
    }

    /// Execution ID.
    public let id: String

    /// Execution creation date in ISO 8601 format.
    public let createdAt: String

    /// Execution update date in ISO 8601 format.
    public let updatedAt: String

    /// Execution roles.
    public let permissions: [String]

    /// Function ID.
    public let functionId: String

    /// Function&#039;s deployment ID used to create the execution.
    public let deploymentId: String

    /// The trigger that caused the function to execute. Possible values can be: `http`, `schedule`, or `event`.
    public let trigger: AppwriteEnums.ExecutionTrigger

    /// The status of the function execution. Possible values can be: `waiting`, `processing`, `completed`, `failed`, or `scheduled`.
    public let status: AppwriteEnums.ExecutionStatus

    /// HTTP request method type.
    public let requestMethod: String

    /// HTTP request path and query.
    public let requestPath: String

    /// HTTP request headers as a key-value object. This will return only whitelisted headers. All headers are returned if execution is created as synchronous.
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

    /// Resource(function/site) execution duration in seconds.
    public let duration: Double

    /// The scheduled time for execution. If left empty, execution will be queued immediately.
    public let scheduledAt: String?


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        permissions: [String],
        functionId: String,
        deploymentId: String,
        trigger: AppwriteEnums.ExecutionTrigger,
        status: AppwriteEnums.ExecutionStatus,
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
        self.deploymentId = deploymentId
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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.permissions = try container.decode([String].self, forKey: .permissions)
        self.functionId = try container.decode(String.self, forKey: .functionId)
        self.deploymentId = try container.decode(String.self, forKey: .deploymentId)
        self.trigger = AppwriteEnums.ExecutionTrigger(rawValue: try container.decode(String.self, forKey: .trigger))!
        self.status = AppwriteEnums.ExecutionStatus(rawValue: try container.decode(String.self, forKey: .status))!
        self.requestMethod = try container.decode(String.self, forKey: .requestMethod)
        self.requestPath = try container.decode(String.self, forKey: .requestPath)
        self.requestHeaders = try container.decode([Headers].self, forKey: .requestHeaders)
        self.responseStatusCode = try container.decode(Int.self, forKey: .responseStatusCode)
        self.responseBody = try container.decode(String.self, forKey: .responseBody)
        self.responseHeaders = try container.decode([Headers].self, forKey: .responseHeaders)
        self.logs = try container.decode(String.self, forKey: .logs)
        self.errors = try container.decode(String.self, forKey: .errors)
        self.duration = try container.decode(Double.self, forKey: .duration)
        self.scheduledAt = try container.decodeIfPresent(String.self, forKey: .scheduledAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(permissions, forKey: .permissions)
        try container.encode(functionId, forKey: .functionId)
        try container.encode(deploymentId, forKey: .deploymentId)
        try container.encode(trigger.rawValue, forKey: .trigger)
        try container.encode(status.rawValue, forKey: .status)
        try container.encode(requestMethod, forKey: .requestMethod)
        try container.encode(requestPath, forKey: .requestPath)
        try container.encode(requestHeaders, forKey: .requestHeaders)
        try container.encode(responseStatusCode, forKey: .responseStatusCode)
        try container.encode(responseBody, forKey: .responseBody)
        try container.encode(responseHeaders, forKey: .responseHeaders)
        try container.encode(logs, forKey: .logs)
        try container.encode(errors, forKey: .errors)
        try container.encode(duration, forKey: .duration)
        try container.encodeIfPresent(scheduledAt, forKey: .scheduledAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$permissions": permissions as Any,
            "functionId": functionId as Any,
            "deploymentId": deploymentId as Any,
            "trigger": trigger.rawValue as Any,
            "status": status.rawValue as Any,
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
            deploymentId: map["deploymentId"] as! String,
            trigger: ExecutionTrigger(rawValue: map["trigger"] as! String)!,
            status: ExecutionStatus(rawValue: map["status"] as! String)!,
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
