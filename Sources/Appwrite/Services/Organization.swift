import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

/// The Organization service allows you to manage organization-level projects.
open class Organization: Service {

    ///
    /// List app installations on the organization. Any organization member can
    /// read installations.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppInstallationList
    ///
    open func listInstallations(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.AppInstallationList {
        let apiPath: String = "/organization/installations"

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
    /// Install an app on the organization. Only organization members with the
    /// owner role can install apps. The installation is granted the scopes the app
    /// currently requests.
    ///
    /// - Parameters:
    ///   - appId: String
    ///   - authorizationDetails: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppInstallation
    ///
    open func createInstallation(
        appId: String,
        authorizationDetails: String? = nil
    ) async throws -> AppwriteModels.AppInstallation {
        let apiPath: String = "/organization/installations"

        let apiParams: [String: Any?] = [
            "appId": appId,
            "authorizationDetails": authorizationDetails,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AppInstallation = { response in
            return AppwriteModels.AppInstallation.from(map: response as! [String: Any])
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
    /// Get an app installation on the organization by its unique ID. Any
    /// organization member can read installations.
    ///
    /// - Parameters:
    ///   - installationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppInstallation
    ///
    open func getInstallation(
        installationId: String
    ) async throws -> AppwriteModels.AppInstallation {
        if installationId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"installationId\"")
        }

        let apiPath: String = "/organization/installations/{installationId}"
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
    /// Update an app installation on the organization. Only organization members
    /// with the owner role can update installations. The installation's granted
    /// scopes are refreshed to the scopes the app currently requests; previously
    /// issued installation access tokens are revoked.
    ///
    /// - Parameters:
    ///   - installationId: String
    ///   - authorizationDetails: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AppInstallation
    ///
    open func updateInstallation(
        installationId: String,
        authorizationDetails: String? = nil
    ) async throws -> AppwriteModels.AppInstallation {
        if installationId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"installationId\"")
        }

        let apiPath: String = "/organization/installations/{installationId}"
            .replacingOccurrences(of: "{installationId}", with: installationId)

        let apiParams: [String: Any?] = [
            "authorizationDetails": authorizationDetails
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.AppInstallation = { response in
            return AppwriteModels.AppInstallation.from(map: response as! [String: Any])
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
    /// Uninstall an app from the organization by its installation ID. Only
    /// organization members with the owner role can remove installations.
    /// Previously issued installation access tokens are revoked.
    ///
    /// - Parameters:
    ///   - installationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteInstallation(
        installationId: String
    ) async throws -> Any {
        if installationId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"installationId\"")
        }

        let apiPath: String = "/organization/installations/{installationId}"
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
}
