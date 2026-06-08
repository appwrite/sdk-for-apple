import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class Presences: Service {

    ///
    /// List presence logs. Expired entries are filtered out automatically.
    /// 
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    ///   - ttl: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PresenceList
    ///
    open func list(
        queries: [String]? = nil,
        total: Bool? = nil,
        ttl: Int? = nil
    ) async throws -> AppwriteModels.PresenceList {
        let apiPath: String = "/presences"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total,
            "ttl": ttl
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.PresenceList = { response in
            return AppwriteModels.PresenceList.from(map: response as! [String: Any])
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
    /// Get a presence log by its unique ID. Entries whose `expiresAt` is in the
    /// past are treated as not found.
    /// 
    ///
    /// - Parameters:
    ///   - presenceId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Presence
    ///
    open func get(
        presenceId: String
    ) async throws -> AppwriteModels.Presence {
        let apiPath: String = "/presences/{presenceId}"
            .replacingOccurrences(of: "{presenceId}", with: presenceId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Presence = { response in
            return AppwriteModels.Presence.from(map: response as! [String: Any])
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
    /// Create or update a presence log by its user ID.
    /// 
    ///
    /// - Parameters:
    ///   - presenceId: String
    ///   - status: String
    ///   - permissions: [String] (optional)
    ///   - expiresAt: String (optional)
    ///   - metadata: Any (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Presence
    ///
    open func upsert(
        presenceId: String,
        status: String,
        permissions: [String]? = nil,
        expiresAt: String? = nil,
        metadata: Any? = nil
    ) async throws -> AppwriteModels.Presence {
        let apiPath: String = "/presences/{presenceId}"
            .replacingOccurrences(of: "{presenceId}", with: presenceId)

        let apiParams: [String: Any?] = [
            "status": status,
            "permissions": permissions,
            "expiresAt": expiresAt,
            "metadata": metadata
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Presence = { response in
            return AppwriteModels.Presence.from(map: response as! [String: Any])
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
    /// Update a presence log by its unique ID. Using the patch method you can pass
    /// only specific fields that will get updated.
    /// 
    ///
    /// - Parameters:
    ///   - presenceId: String
    ///   - status: String (optional)
    ///   - expiresAt: String (optional)
    ///   - metadata: Any (optional)
    ///   - permissions: [String] (optional)
    ///   - purge: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Presence
    ///
    open func update(
        presenceId: String,
        status: String? = nil,
        expiresAt: String? = nil,
        metadata: Any? = nil,
        permissions: [String]? = nil,
        purge: Bool? = nil
    ) async throws -> AppwriteModels.Presence {
        let apiPath: String = "/presences/{presenceId}"
            .replacingOccurrences(of: "{presenceId}", with: presenceId)

        let apiParams: [String: Any?] = [
            "status": status,
            "expiresAt": expiresAt,
            "metadata": metadata,
            "permissions": permissions,
            "purge": purge
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Presence = { response in
            return AppwriteModels.Presence.from(map: response as! [String: Any])
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
    /// Delete a presence log by its unique ID.
    /// 
    ///
    /// - Parameters:
    ///   - presenceId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        presenceId: String
    ) async throws -> Any {
        let apiPath: String = "/presences/{presenceId}"
            .replacingOccurrences(of: "{presenceId}", with: presenceId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }


}
