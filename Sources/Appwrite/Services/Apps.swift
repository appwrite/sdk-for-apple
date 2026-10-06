import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

/// The Apps service allows you to manage OAuth2 applications, their keys, secrets, scopes, and installations.
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
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
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
    ///   - description: String (optional)
    ///   - clientUri: String (optional)
    ///   - logoUri: String (optional)
    ///   - privacyPolicyUrl: String (optional)
    ///   - termsUrl: String (optional)
    ///   - contacts: [String] (optional)
    ///   - tagline: String (optional)
    ///   - tags: [String] (optional)
    ///   - images: [String] (optional)
    ///   - supportUrl: String (optional)
    ///   - dataDeletionUrl: String (optional)
    ///   - postLogoutRedirectUris: [String] (optional)
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
        description: String? = nil,
        clientUri: String? = nil,
        logoUri: String? = nil,
        privacyPolicyUrl: String? = nil,
        termsUrl: String? = nil,
        contacts: [String]? = nil,
        tagline: String? = nil,
        tags: [String]? = nil,
        images: [String]? = nil,
        supportUrl: String? = nil,
        dataDeletionUrl: String? = nil,
        postLogoutRedirectUris: [String]? = nil,
        enabled: Bool? = nil,
        type: String? = nil,
        deviceFlow: Bool? = nil,
        teamId: String? = nil
    ) async throws -> AppwriteModels.App {
        let apiPath: String = "/apps"

        let apiParams: [String: Any?] = [
            "appId": appId,
            "name": name,
            "description": description,
            "clientUri": clientUri,
            "logoUri": logoUri,
            "privacyPolicyUrl": privacyPolicyUrl,
            "termsUrl": termsUrl,
            "contacts": contacts,
            "tagline": tagline,
            "tags": tags,
            "images": images,
            "supportUrl": supportUrl,
            "dataDeletionUrl": dataDeletionUrl,
            "redirectUris": redirectUris,
            "postLogoutRedirectUris": postLogoutRedirectUris,
            "enabled": enabled,
            "type": type,
            "deviceFlow": deviceFlow,
            "teamId": teamId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
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
    /// List scopes an application can request when installed on a team.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppScopeList
    ///
    open func listInstallationScopes() async throws -> AppwriteModels.AppScopeList {
        let apiPath: String = "/apps/scopes/installations"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AppScopeList = { response in
            return AppwriteModels.AppScopeList.from(map: response as! [String: Any])
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
    /// List scopes an application can request during the OAuth2 flow.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppScopeList
    ///
    open func listOAuth2Scopes() async throws -> AppwriteModels.AppScopeList {
        let apiPath: String = "/apps/scopes/oauth2"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AppScopeList = { response in
            return AppwriteModels.AppScopeList.from(map: response as! [String: Any])
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
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }

        let apiPath: String = "/apps/{appId}"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
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
    ///   - description: String (optional)
    ///   - clientUri: String (optional)
    ///   - logoUri: String (optional)
    ///   - privacyPolicyUrl: String (optional)
    ///   - termsUrl: String (optional)
    ///   - contacts: [String] (optional)
    ///   - tagline: String (optional)
    ///   - tags: [String] (optional)
    ///   - images: [String] (optional)
    ///   - supportUrl: String (optional)
    ///   - dataDeletionUrl: String (optional)
    ///   - enabled: Bool (optional)
    ///   - redirectUris: [String] (optional)
    ///   - postLogoutRedirectUris: [String] (optional)
    ///   - type: String (optional)
    ///   - deviceFlow: Bool (optional)
    ///   - installationScopes: [String] (optional)
    ///   - installationRedirectUrl: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.App
    ///
    open func update(
        appId: String,
        name: String,
        description: String? = nil,
        clientUri: String? = nil,
        logoUri: String? = nil,
        privacyPolicyUrl: String? = nil,
        termsUrl: String? = nil,
        contacts: [String]? = nil,
        tagline: String? = nil,
        tags: [String]? = nil,
        images: [String]? = nil,
        supportUrl: String? = nil,
        dataDeletionUrl: String? = nil,
        enabled: Bool? = nil,
        redirectUris: [String]? = nil,
        postLogoutRedirectUris: [String]? = nil,
        type: String? = nil,
        deviceFlow: Bool? = nil,
        installationScopes: [String]? = nil,
        installationRedirectUrl: String? = nil
    ) async throws -> AppwriteModels.App {
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }

        let apiPath: String = "/apps/{appId}"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any?] = [
            "name": name,
            "description": description,
            "clientUri": clientUri,
            "logoUri": logoUri,
            "privacyPolicyUrl": privacyPolicyUrl,
            "termsUrl": termsUrl,
            "contacts": contacts,
            "tagline": tagline,
            "tags": tags,
            "images": images,
            "supportUrl": supportUrl,
            "dataDeletionUrl": dataDeletionUrl,
            "enabled": enabled,
            "redirectUris": redirectUris,
            "postLogoutRedirectUris": postLogoutRedirectUris,
            "type": type,
            "deviceFlow": deviceFlow,
            "installationScopes": installationScopes,
            "installationRedirectUrl": installationRedirectUrl,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
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
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }

        let apiPath: String = "/apps/{appId}"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// List installations of an application. Requires an app key sent in the
    /// `X-Appwrite-Key` header alongside the `X-Appwrite-App` header, or a caller
    /// with update access to the app.
    ///
    /// - Parameters:
    ///   - appId: String
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppInstallationList
    ///
    open func listInstallations(
        appId: String,
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.AppInstallationList {
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }

        let apiPath: String = "/apps/{appId}/installations"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AppInstallationList = { response in
            return AppwriteModels.AppInstallationList.from(map: response as! [String: Any])
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
    /// Get an installation of an application by its unique ID. Requires an app key
    /// sent in the `X-Appwrite-Key` header alongside the `X-Appwrite-App` header,
    /// or a caller with update access to the app.
    ///
    /// - Parameters:
    ///   - appId: String
    ///   - installationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppInstallation
    ///
    open func getInstallation(
        appId: String,
        installationId: String
    ) async throws -> AppwriteModels.AppInstallation {
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }
        if installationId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"installationId\"")
        }

        let apiPath: String = "/apps/{appId}/installations/{installationId}"
            .replacingOccurrences(of: "{appId}", with: appId)
            .replacingOccurrences(of: "{installationId}", with: installationId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AppInstallation = { response in
            return AppwriteModels.AppInstallation.from(map: response as! [String: Any])
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
    /// Delete an installation of an application by its unique ID. Requires a
    /// caller with update access to the app. Previously issued installation access
    /// tokens are revoked.
    ///
    /// - Parameters:
    ///   - appId: String
    ///   - installationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteInstallation(
        appId: String,
        installationId: String
    ) async throws -> Any {
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }
        if installationId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"installationId\"")
        }

        let apiPath: String = "/apps/{appId}/installations/{installationId}"
            .replacingOccurrences(of: "{appId}", with: appId)
            .replacingOccurrences(of: "{installationId}", with: installationId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Create a token for an installation of an application. Requires an app key
    /// sent in the `X-Appwrite-Key` header alongside the `X-Appwrite-App` header,
    /// or a caller with update access to the app. The returned token carries the
    /// scopes and authorization details granted to the installation, and can be
    /// used as an `Authorization: Bearer` header everywhere OAuth2 access tokens
    /// are accepted. Multiple tokens can be active for the same installation at
    /// once; each token stays valid until it expires or the installation is
    /// updated or deleted.
    ///
    /// - Parameters:
    ///   - appId: String
    ///   - installationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2Token
    ///
    open func createInstallationToken(
        appId: String,
        installationId: String
    ) async throws -> AppwriteModels.Oauth2Token {
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }
        if installationId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"installationId\"")
        }

        let apiPath: String = "/apps/{appId}/installations/{installationId}/tokens"
            .replacingOccurrences(of: "{appId}", with: appId)
            .replacingOccurrences(of: "{installationId}", with: installationId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Oauth2Token = { response in
            return AppwriteModels.Oauth2Token.from(map: response as! [String: Any])
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
    /// List app keys for an application.
    ///
    /// - Parameters:
    ///   - appId: String
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppKeyList
    ///
    open func listKeys(
        appId: String,
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.AppKeyList {
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }

        let apiPath: String = "/apps/{appId}/keys"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AppKeyList = { response in
            return AppwriteModels.AppKeyList.from(map: response as! [String: Any])
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
    /// Create a new app key for an application. App keys carry no scopes; send one
    /// in the `X-Appwrite-Key` header alongside the `X-Appwrite-App` header to
    /// list the application's installations and create installation access tokens.
    ///
    /// - Parameters:
    ///   - appId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppKey
    ///
    open func createKey(
        appId: String
    ) async throws -> AppwriteModels.AppKey {
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }

        let apiPath: String = "/apps/{appId}/keys"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AppKey = { response in
            return AppwriteModels.AppKey.from(map: response as! [String: Any])
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
    /// Get an app key by its unique ID.
    ///
    /// - Parameters:
    ///   - appId: String
    ///   - keyId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppKey
    ///
    open func getKey(
        appId: String,
        keyId: String
    ) async throws -> AppwriteModels.AppKey {
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }
        if keyId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"keyId\"")
        }

        let apiPath: String = "/apps/{appId}/keys/{keyId}"
            .replacingOccurrences(of: "{appId}", with: appId)
            .replacingOccurrences(of: "{keyId}", with: keyId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AppKey = { response in
            return AppwriteModels.AppKey.from(map: response as! [String: Any])
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
    /// Delete an app key by its unique ID.
    ///
    /// - Parameters:
    ///   - appId: String
    ///   - keyId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteKey(
        appId: String,
        keyId: String
    ) async throws -> Any {
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }
        if keyId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"keyId\"")
        }

        let apiPath: String = "/apps/{appId}/keys/{keyId}"
            .replacingOccurrences(of: "{appId}", with: appId)
            .replacingOccurrences(of: "{keyId}", with: keyId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
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
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }

        let apiPath: String = "/apps/{appId}/secrets"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
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
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }

        let apiPath: String = "/apps/{appId}/secrets"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
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
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }
        if secretId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"secretId\"")
        }

        let apiPath: String = "/apps/{appId}/secrets/{secretId}"
            .replacingOccurrences(of: "{appId}", with: appId)
            .replacingOccurrences(of: "{secretId}", with: secretId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
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
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }
        if secretId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"secretId\"")
        }

        let apiPath: String = "/apps/{appId}/secrets/{secretId}"
            .replacingOccurrences(of: "{appId}", with: appId)
            .replacingOccurrences(of: "{secretId}", with: secretId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
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
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }

        let apiPath: String = "/apps/{appId}/team"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any?] = [
            "teamId": teamId
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
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
        if appId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"appId\"")
        }

        let apiPath: String = "/apps/{appId}/tokens"
            .replacingOccurrences(of: "{appId}", with: appId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
}
