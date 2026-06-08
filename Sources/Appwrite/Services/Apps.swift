import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class Apps: Service {

    ///
    /// List applications.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppsList
    ///
    open func list(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.AppsList {
        let apiPath: String = "/apps"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.AppsList = { response in
            return AppwriteModels.AppsList.from(map: response as! [String: Any])
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
    /// Create a new application.
    ///
    /// - Parameters:
    ///   - appId: String
    ///   - name: String
    ///   - redirectUris: [String]
    ///   - enabled: Bool (optional)
    ///   - type: String (optional)
    ///   - deviceFlow: Bool (optional)
    ///   - teamId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.App
    ///
    open func create(
        appId: String,
        name: String,
        redirectUris: [String],
        enabled: Bool? = nil,
        type: String? = nil,
        deviceFlow: Bool? = nil,
        teamId: String? = nil
    ) async throws -> AppwriteModels.App {
        let apiPath: String = "/apps"

        let apiParams: [String: Any?] = [
            "appId": appId,
            "name": name,
            "redirectUris": redirectUris,
            "enabled": enabled,
            "type": type,
            "deviceFlow": deviceFlow,
            "teamId": teamId
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.App = { response in
            return AppwriteModels.App.from(map: response as! [String: Any])
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
    /// Get an application by its unique ID.
    ///
    /// - Parameters:
    ///   - appId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.App
    ///
    open func get(
        appId: String
    ) async throws -> AppwriteModels.App {
        let apiPath: String = "/apps/{appId}"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.App = { response in
            return AppwriteModels.App.from(map: response as! [String: Any])
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
    /// Update an application by its unique ID.
    ///
    /// - Parameters:
    ///   - appId: String
    ///   - name: String
    ///   - enabled: Bool (optional)
    ///   - redirectUris: [String] (optional)
    ///   - type: String (optional)
    ///   - deviceFlow: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.App
    ///
    open func update(
        appId: String,
        name: String,
        enabled: Bool? = nil,
        redirectUris: [String]? = nil,
        type: String? = nil,
        deviceFlow: Bool? = nil
    ) async throws -> AppwriteModels.App {
        let apiPath: String = "/apps/{appId}"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any?] = [
            "name": name,
            "enabled": enabled,
            "redirectUris": redirectUris,
            "type": type,
            "deviceFlow": deviceFlow
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.App = { response in
            return AppwriteModels.App.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Delete an application by its unique ID.
    ///
    /// - Parameters:
    ///   - appId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        appId: String
    ) async throws -> Any {
        let apiPath: String = "/apps/{appId}"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// List client secrets for an application.
    ///
    /// - Parameters:
    ///   - appId: String
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppSecretList
    ///
    open func listSecrets(
        appId: String,
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.AppSecretList {
        let apiPath: String = "/apps/{appId}/secrets"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.AppSecretList = { response in
            return AppwriteModels.AppSecretList.from(map: response as! [String: Any])
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
    /// Create a new client secret for an application.
    ///
    /// - Parameters:
    ///   - appId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppSecretPlaintext
    ///
    open func createSecret(
        appId: String
    ) async throws -> AppwriteModels.AppSecretPlaintext {
        let apiPath: String = "/apps/{appId}/secrets"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.AppSecretPlaintext = { response in
            return AppwriteModels.AppSecretPlaintext.from(map: response as! [String: Any])
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
    /// Get an application client secret by its unique ID.
    ///
    /// - Parameters:
    ///   - appId: String
    ///   - secretId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppSecret
    ///
    open func getSecret(
        appId: String,
        secretId: String
    ) async throws -> AppwriteModels.AppSecret {
        let apiPath: String = "/apps/{appId}/secrets/{secretId}"
            .replacingOccurrences(of: "{appId}", with: appId)
            .replacingOccurrences(of: "{secretId}", with: secretId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.AppSecret = { response in
            return AppwriteModels.AppSecret.from(map: response as! [String: Any])
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
    /// Delete an application client secret by its unique ID.
    ///
    /// - Parameters:
    ///   - appId: String
    ///   - secretId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteSecret(
        appId: String,
        secretId: String
    ) async throws -> Any {
        let apiPath: String = "/apps/{appId}/secrets/{secretId}"
            .replacingOccurrences(of: "{appId}", with: appId)
            .replacingOccurrences(of: "{secretId}", with: secretId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Transfer an application to another team by its unique ID.
    ///
    /// - Parameters:
    ///   - appId: String
    ///   - teamId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.App
    ///
    open func updateTeam(
        appId: String,
        teamId: String
    ) async throws -> AppwriteModels.App {
        let apiPath: String = "/apps/{appId}/team"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any?] = [
            "teamId": teamId
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.App = { response in
            return AppwriteModels.App.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Revoke all tokens for an application by its unique ID.
    ///
    /// - Parameters:
    ///   - appId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteTokens(
        appId: String
    ) async throws -> Any {
        let apiPath: String = "/apps/{appId}/tokens"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }


}
