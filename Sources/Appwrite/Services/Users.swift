import AsyncHTTPClient
import Foundation
import NIO

open class Users: Service {
    ///
    /// List Users
    ///
    /// Get a list of all the project's users. You can use the query params to
    /// filter your results.
    ///
    /// @param String search
    /// @param Int limit
    /// @param Int offset
    /// @param String orderType
    /// @throws Exception
    /// @return array
    ///
    open func list(search: String = "", limit: Int = 25, offset: Int = 0, orderType: String = "ASC", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        let path: String = "/users"

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
    /// Create User
    ///
    /// Create a new user.
    ///
    /// @param String email
    /// @param String password
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func create(email: String, password: String, name: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        let path: String = "/users"

        let params: [String: Any?] = [
            "email": email,
            "password": password,
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "POST", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get User
    ///
    /// Get a user by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func get(userId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/users/{userId}"

        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Delete User
    ///
    /// Delete a user by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func delete(userId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/users/{userId}"

        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "DELETE", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get User Logs
    ///
    /// Get a user activity logs list by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func getLogs(userId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/users/{userId}/logs"

        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get User Preferences
    ///
    /// Get the user preferences by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func getPrefs(userId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/users/{userId}/prefs"

        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update User Preferences
    ///
    /// Update the user preferences by its unique ID. You can pass only the
    /// specific settings you wish to update.
    ///
    /// @param String userId
    /// @param Any? prefs
    /// @throws Exception
    /// @return array
    ///
    open func updatePrefs(userId: String, prefs: Any?, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/users/{userId}/prefs"

        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId
        )

        let params: [String: Any?] = [
            "prefs": prefs
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "PATCH", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get User Sessions
    ///
    /// Get the user sessions list by its unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func getSessions(userId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/users/{userId}/sessions"

        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Delete User Sessions
    ///
    /// Delete all user's sessions by using the user's unique ID.
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func deleteSessions(userId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/users/{userId}/sessions"

        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "DELETE", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Delete User Session
    ///
    /// Delete a user sessions by its unique ID.
    ///
    /// @param String userId
    /// @param String sessionId
    /// @throws Exception
    /// @return array
    ///
    open func deleteSession(userId: String, sessionId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/users/{userId}/sessions/{sessionId}"

        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId
        )

        path = path.replacingOccurrences(
          of: "{sessionId}",
          with: sessionId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "DELETE", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update User Status
    ///
    /// Update the user status by its unique ID.
    ///
    /// @param String userId
    /// @param Int status
    /// @throws Exception
    /// @return array
    ///
    open func updateStatus(userId: String, status: Int, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/users/{userId}/status"

        path = path.replacingOccurrences(
          of: "{userId}",
          with: userId
        )

        let params: [String: Any?] = [
            "status": status
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "PATCH", path: path, headers: headers, params: params, completion: completion)
    }

}
