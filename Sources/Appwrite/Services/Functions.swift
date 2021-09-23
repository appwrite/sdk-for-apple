import AsyncHTTPClient
import Foundation
import NIO

open class Functions: Service {
    ///
    /// List Functions
    ///
    /// Get a list of all the project's functions. You can use the query params to
    /// filter your results.
    ///
    /// @param String search
    /// @param Int limit
    /// @param Int offset
    /// @param String orderType
    /// @throws Exception
    /// @return array
    ///
    open func list(_ search: String = "", _ limit: Int = 25, _ offset: Int = 0, _ orderType: String = "ASC", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        let path: String = "/functions"

        let params: [String: Any?] = [
            "search": search,
            "limit": limit,
            "offset": offset,
            "orderType": orderType
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Create Function
    ///
    /// Create a new function. You can pass a list of
    /// [permissions](/docs/permissions) to allow different project users or team
    /// with access to execute the function using the client API.
    ///
    /// @param String name
    /// @param Array<Any>? execute
    /// @param String env
    /// @param Any? vars
    /// @param Array<Any>? events
    /// @param String schedule
    /// @param Int timeout
    /// @throws Exception
    /// @return array
    ///
    open func create(_ name: String, _ execute: Array<Any>?, _ env: String, _ vars: Any? = nil, _ events: Array<Any>? = nil, _ schedule: String = "", _ timeout: Int = 15, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        let path: String = "/functions"

        let params: [String: Any?] = [
            "name": name,
            "execute": execute,
            "env": env,
            "vars": vars,
            "events": events,
            "schedule": schedule,
            "timeout": timeout
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "POST", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get Function
    ///
    /// Get a function by its unique ID.
    ///
    /// @param String functionId
    /// @throws Exception
    /// @return array
    ///
    open func get(_ functionId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/functions/{functionId}"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update Function
    ///
    /// Update function by its unique ID.
    ///
    /// @param String functionId
    /// @param String name
    /// @param Array<Any>? execute
    /// @param Any? vars
    /// @param Array<Any>? events
    /// @param String schedule
    /// @param Int timeout
    /// @throws Exception
    /// @return array
    ///
    open func update(_ functionId: String, _ name: String, _ execute: Array<Any>?, _ vars: Any? = nil, _ events: Array<Any>? = nil, _ schedule: String = "", _ timeout: Int = 15, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/functions/{functionId}"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

        let params: [String: Any?] = [
            "name": name,
            "execute": execute,
            "vars": vars,
            "events": events,
            "schedule": schedule,
            "timeout": timeout
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "PUT", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Delete Function
    ///
    /// Delete a function by its unique ID.
    ///
    /// @param String functionId
    /// @throws Exception
    /// @return array
    ///
    open func delete(_ functionId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/functions/{functionId}"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "DELETE", path: path, headers: headers, params: params, completion: completion)
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
    /// @param String search
    /// @param Int limit
    /// @param Int offset
    /// @param String orderType
    /// @throws Exception
    /// @return array
    ///
    open func listExecutions(_ functionId: String, _ search: String = "", _ limit: Int = 25, _ offset: Int = 0, _ orderType: String = "ASC", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/functions/{functionId}/executions"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

        let params: [String: Any?] = [
            "search": search,
            "limit": limit,
            "offset": offset,
            "orderType": orderType
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
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
    open func createExecution(_ functionId: String, _ data: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/functions/{functionId}/executions"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

        let params: [String: Any?] = [
            "data": data
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "POST", path: path, headers: headers, params: params, completion: completion)
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
    open func getExecution(_ functionId: String, _ executionId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update Function Tag
    ///
    /// Update the function code tag ID using the unique function ID. Use this
    /// endpoint to switch the code tag that should be executed by the execution
    /// endpoint.
    ///
    /// @param String functionId
    /// @param String tag
    /// @throws Exception
    /// @return array
    ///
    open func updateTag(_ functionId: String, _ tag: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/functions/{functionId}/tag"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

        let params: [String: Any?] = [
            "tag": tag
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "PATCH", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// List Tags
    ///
    /// Get a list of all the project's code tags. You can use the query params to
    /// filter your results.
    ///
    /// @param String functionId
    /// @param String search
    /// @param Int limit
    /// @param Int offset
    /// @param String orderType
    /// @throws Exception
    /// @return array
    ///
    open func listTags(_ functionId: String, _ search: String = "", _ limit: Int = 25, _ offset: Int = 0, _ orderType: String = "ASC", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/functions/{functionId}/tags"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

        let params: [String: Any?] = [
            "search": search,
            "limit": limit,
            "offset": offset,
            "orderType": orderType
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Create Tag
    ///
    /// Create a new function code tag. Use this endpoint to upload a new version
    /// of your code function. To execute your newly uploaded code, you'll need to
    /// update the function's tag to use your new tag UID.
    /// 
    /// This endpoint accepts a tar.gz file compressed with your code. Make sure to
    /// include any dependencies your code has within the compressed file. You can
    /// learn more about code packaging in the [Appwrite Cloud Functions
    /// tutorial](/docs/functions).
    /// 
    /// Use the "command" param to set the entry point used to execute your code.
    ///
    /// @param String functionId
    /// @param String command
    /// @param File code
    /// @throws Exception
    /// @return array
    ///
    open func createTag(_ functionId: String, _ command: String, _ code: File, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/functions/{functionId}/tags"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

        let params: [String: Any?] = [
            "command": command,
            "code": code
        ]

        let headers: [String: String] = [
            "content-type": "multipart/form-data"
        ]

        client.call(method: "POST", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get Tag
    ///
    /// Get a code tag by its unique ID.
    ///
    /// @param String functionId
    /// @param String tagId
    /// @throws Exception
    /// @return array
    ///
    open func getTag(_ functionId: String, _ tagId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/functions/{functionId}/tags/{tagId}"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

        path = path.replacingOccurrences(
          of: "{tagId}",
          with: tagId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Delete Tag
    ///
    /// Delete a code tag by its unique ID.
    ///
    /// @param String functionId
    /// @param String tagId
    /// @throws Exception
    /// @return array
    ///
    open func deleteTag(_ functionId: String, _ tagId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/functions/{functionId}/tags/{tagId}"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

        path = path.replacingOccurrences(
          of: "{tagId}",
          with: tagId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "DELETE", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get Function Usage
    ///
    /// @param String functionId
    /// @param String range
    /// @throws Exception
    /// @return array
    ///
    open func getUsage(_ functionId: String, _ range: String = "30d", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/functions/{functionId}/usage"

        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )

        let params: [String: Any?] = [
            "range": range
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

}
