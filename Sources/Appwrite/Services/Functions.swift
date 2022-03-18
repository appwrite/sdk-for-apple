import AsyncHTTPClient
import Foundation
import NIO
import AppwriteModels

open class Functions: Service {
    ///
    /// Retry Build
    ///
    /// @param String functionId
    /// @param String deploymentId
    /// @param String buildId
    /// @throws Exception
    /// @return array
    ///
    open func retryBuild(
        functionId: String,
        deploymentId: String,
        buildId: String
    ) async throws -> Any {
        var path: String = "/functions/{functionId}/deployments/{deploymentId}/builds/{buildId}"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

        path = path.replacingOccurrences(
          of: "{deploymentId}",
          with: deploymentId
        )

        path = path.replacingOccurrences(
          of: "{buildId}",
          with: buildId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params        )
    }

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
        cursorDirection: String? = nil
    ) async throws -> AppwriteModels.ExecutionList {
        var path: String = "/functions/{functionId}/executions"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

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

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            convert: convert
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
    /// @param Bool async
    /// @throws Exception
    /// @return array
    ///
    open func createExecution(
        functionId: String,
        data: String? = nil,
        async: Bool? = nil
    ) async throws -> AppwriteModels.Execution {
        var path: String = "/functions/{functionId}/executions"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

        let params: [String: Any?] = [
            "data": data,
            "async": async
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let convert: ([String: Any]) -> AppwriteModels.Execution = { dict in
            return AppwriteModels.Execution.from(map: dict)
        }

        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            convert: convert
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
        executionId: String
    ) async throws -> AppwriteModels.Execution {
        var path: String = "/functions/{functionId}/executions/{executionId}"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

        path = path.replacingOccurrences(
          of: "{executionId}",
          with: executionId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let convert: ([String: Any]) -> AppwriteModels.Execution = { dict in
            return AppwriteModels.Execution.from(map: dict)
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            convert: convert
        )
    }


    ///
    /// Retry Build
    ///
    /// @param String functionId
    /// @param String deploymentId
    /// @param String buildId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func retryBuild(
        functionId: String,
        deploymentId: String,
        buildId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await retryBuild(
                    functionId: functionId,
                    deploymentId: deploymentId,
                    buildId: buildId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

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
    @available(*, deprecated, message: "Use the async overload instead")
    open func listExecutions(
        functionId: String,
        limit: Int? = nil,
        offset: Int? = nil,
        search: String? = nil,
        cursor: String? = nil,
        cursorDirection: String? = nil,
        completion: ((Result<AppwriteModels.ExecutionList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listExecutions(
                    functionId: functionId,
                    limit: limit,
                    offset: offset,
                    search: search,
                    cursor: cursor,
                    cursorDirection: cursorDirection
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    /// @param Bool async
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createExecution(
        functionId: String,
        data: String? = nil,
        async: Bool? = nil,
        completion: ((Result<AppwriteModels.Execution, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createExecution(
                    functionId: functionId,
                    data: data,
                    async: async
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func getExecution(
        functionId: String,
        executionId: String,
        completion: ((Result<AppwriteModels.Execution, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getExecution(
                    functionId: functionId,
                    executionId: executionId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

}
