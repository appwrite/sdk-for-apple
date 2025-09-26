import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Functions Service allows you view, create and manage your Cloud Functions.
open class Functions: Service {

    ///
    /// Get a list of all the current user function execution logs. You can use the
    /// query params to filter your results.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ExecutionList
    ///
    open func listExecutions(
        functionId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.ExecutionList {
        let apiPath: String = "/functions/{functionId}/executions"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.ExecutionList = { response in
            return AppwriteModels.ExecutionList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Trigger a function execution. The returned object will return you the
    /// current execution status. You can ping the `Get Execution` endpoint to get
    /// updates on the current execution status. Once this endpoint is called, your
    /// function execution process will start asynchronously.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - body: String (optional)
    ///   - async: Bool (optional)
    ///   - path: String (optional)
    ///   - method: ExecutionMethod (optional)
    ///   - headers: Any (optional)
    ///   - scheduledAt: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Execution
    ///
    open func createExecution(
        functionId: String,
        body: String? = nil,
        async: Bool? = nil,
        path: String? = nil,
        method: ExecutionMethod? = nil,
        headers: Any? = nil,
        scheduledAt: String? = nil
    ) async throws -> AppwriteModels.Execution {
        let apiPath: String = "/functions/{functionId}/executions"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let apiParams: [String: Any?] = [
            "body": body,
            "async": async,
            "path": path,
            "method": method,
            "headers": headers,
            "scheduledAt": scheduledAt
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Execution = { response in
            return AppwriteModels.Execution.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get a function execution log by its unique ID.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - executionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Execution
    ///
    open func getExecution(
        functionId: String,
        executionId: String
    ) async throws -> AppwriteModels.Execution {
        let apiPath: String = "/functions/{functionId}/executions/{executionId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{executionId}", with: executionId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Execution = { response in
            return AppwriteModels.Execution.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }


}