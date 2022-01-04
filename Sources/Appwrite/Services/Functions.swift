import AsyncHTTPClient
import Foundation
import NIO
import AppwriteModels

open class Functions: Service {
    ///
    /// List Executions
    ///
    /// Get a list of all the current user function execution logs. You can use the
    /// query params to filter your results. On admin mode, this endpoint will
    /// return a list of all of the project's executions. [Learn more about
    /// different API modes](/docs/admin).
    ///
    /// @param String functionId
    /// @param Int limit
    /// @param Int offset
    /// @param String search
    /// @param String cursor
    /// @param String cursorDirection
    /// @throws Exception
    /// @return array
    ///
    open func listExecutions(
        functionId: String,
        limit: Int? = nil,
        offset: Int? = nil,
        search: String? = nil,
        cursor: String? = nil,
        cursorDirection: String? = nil,
        completion: ((Result<AppwriteModels.ExecutionList, AppwriteError>) -> Void)? = nil
    ) {
        var path: String = "/functions/{functionId}/executions"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId        )

        let params: [String: Any?] = [
            "limit": limit,
            "offset": offset,
            "search": search,
            "cursor": cursor,
            "cursorDirection": cursorDirection
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let convert: ([String: Any]) -> AppwriteModels.ExecutionList = { dict in
            return AppwriteModels.ExecutionList.from(map: dict)
        }

        client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
        )
    }

    ///
    /// Create Execution
    ///
    /// Trigger a function execution. The returned object will return you the
    /// current execution status. You can ping the `Get Execution` endpoint to get
    /// updates on the current execution status. Once this endpoint is called, your
    /// function execution process will start asynchronously.
    ///
    /// @param String functionId
    /// @param String data
    /// @throws Exception
    /// @return array
    ///
    open func createExecution(
        functionId: String,
        data: String? = nil,
        completion: ((Result<AppwriteModels.Execution, AppwriteError>) -> Void)? = nil
    ) {
        var path: String = "/functions/{functionId}/executions"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId        )

        let params: [String: Any?] = [
            "data": data
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let convert: ([String: Any]) -> AppwriteModels.Execution = { dict in
            return AppwriteModels.Execution.from(map: dict)
        }

        client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
        )
    }

    ///
    /// Get Execution
    ///
    /// Get a function execution log by its unique ID.
    ///
    /// @param String functionId
    /// @param String executionId
    /// @throws Exception
    /// @return array
    ///
    open func getExecution(
        functionId: String,
        executionId: String,
        completion: ((Result<AppwriteModels.Execution, AppwriteError>) -> Void)? = nil
    ) {
        var path: String = "/functions/{functionId}/executions/{executionId}"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId        )

        path = path.replacingOccurrences(
          of: "{executionId}",
          with: executionId        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let convert: ([String: Any]) -> AppwriteModels.Execution = { dict in
            return AppwriteModels.Execution.from(map: dict)
        }

        client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
        )
    }

}
