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
    /// - Returns: AppwriteModels.PresenceList<T>
    ///
    open func list<T>(
        queries: [String]? = nil,
        total: Bool? = nil,
        ttl: Int? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.PresenceList<T> {
        let apiPath: String = "/presences"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total,
            "ttl": ttl
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.PresenceList<T> = { response in
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
    /// List presence logs. Expired entries are filtered out automatically.
    /// 
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    ///   - ttl: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PresenceList<T>
    ///
    open func list(
        queries: [String]? = nil,
        total: Bool? = nil,
        ttl: Int? = nil
    ) async throws -> AppwriteModels.PresenceList<[String: AnyCodable]> {
        return try await list(
            queries: queries,
            total: total,
            ttl: ttl,
            nestedType: [String: AnyCodable].self
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
    /// - Returns: AppwriteModels.Presence<T>
    ///
    open func get<T>(
        presenceId: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Presence<T> {
        let apiPath: String = "/presences/{presenceId}"
            .replacingOccurrences(of: "{presenceId}", with: presenceId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.Presence<T> = { response in
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
    /// Get a presence log by its unique ID. Entries whose `expiresAt` is in the
    /// past are treated as not found.
    /// 
    ///
    /// - Parameters:
    ///   - presenceId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Presence<T>
    ///
    open func get(
        presenceId: String
    ) async throws -> AppwriteModels.Presence<[String: AnyCodable]> {
        return try await get(
            presenceId: presenceId,
            nestedType: [String: AnyCodable].self
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
    /// - Returns: AppwriteModels.Presence<T>
    ///
    open func upsert<T>(
        presenceId: String,
        status: String,
        permissions: [String]? = nil,
        expiresAt: String? = nil,
        metadata: Any? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Presence<T> {
        let apiPath: String = "/presences/{presenceId}"
            .replacingOccurrences(of: "{presenceId}", with: presenceId)

        let apiParams: [String: Any?] = [
            "status": status,
            "permissions": permissions,
            "expiresAt": expiresAt,
            "metadata": metadata
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Presence<T> = { response in
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
    /// - Returns: AppwriteModels.Presence<T>
    ///
    open func upsert(
        presenceId: String,
        status: String,
        permissions: [String]? = nil,
        expiresAt: String? = nil,
        metadata: Any? = nil
    ) async throws -> AppwriteModels.Presence<[String: AnyCodable]> {
        return try await upsert(
            presenceId: presenceId,
            status: status,
            permissions: permissions,
            expiresAt: expiresAt,
            metadata: metadata,
            nestedType: [String: AnyCodable].self
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
    /// - Returns: AppwriteModels.Presence<T>
    ///
    open func update<T>(
        presenceId: String,
        status: String? = nil,
        expiresAt: String? = nil,
        metadata: Any? = nil,
        permissions: [String]? = nil,
        purge: Bool? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Presence<T> {
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
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Presence<T> = { response in
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
    /// - Returns: AppwriteModels.Presence<T>
    ///
    open func update(
        presenceId: String,
        status: String? = nil,
        expiresAt: String? = nil,
        metadata: Any? = nil,
        permissions: [String]? = nil,
        purge: Bool? = nil
    ) async throws -> AppwriteModels.Presence<[String: AnyCodable]> {
        return try await update(
            presenceId: presenceId,
            status: status,
            expiresAt: expiresAt,
            metadata: metadata,
            permissions: permissions,
            purge: purge,
            nestedType: [String: AnyCodable].self
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
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }


}
