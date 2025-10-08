import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class TablesDB: Service {

    ///
    /// Get a list of all the user's rows in a given table. You can use the query
    /// params to filter your results.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.RowList<T>
    ///
    open func listRows<T>(
        databaseId: String,
        tableId: String,
        queries: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.RowList<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.RowList<T> = { response in
            return AppwriteModels.RowList.from(map: response as! [String: Any])
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
    /// Get a list of all the user's rows in a given table. You can use the query
    /// params to filter your results.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.RowList<T>
    ///
    open func listRows(
        databaseId: String,
        tableId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.RowList<[String: AnyCodable]> {
        return try await listRows(
            databaseId: databaseId,
            tableId: tableId,
            queries: queries,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create a new Row. Before using this route, you should create a new table
    /// resource using either a [server
    /// integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - data: Any
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func createRow<T>(
        databaseId: String,
        tableId: String,
        rowId: String,
        data: Any,
        permissions: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Row<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "rowId": rowId,
            "data": data,
            "permissions": permissions
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Row<T> = { response in
            return AppwriteModels.Row.from(map: response as! [String: Any])
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
    /// Create a new Row. Before using this route, you should create a new table
    /// resource using either a [server
    /// integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - data: Any
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func createRow(
        databaseId: String,
        tableId: String,
        rowId: String,
        data: Any,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.Row<[String: AnyCodable]> {
        return try await createRow(
            databaseId: databaseId,
            tableId: tableId,
            rowId: rowId,
            data: data,
            permissions: permissions,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Get a row by its unique ID. This endpoint response returns a JSON object
    /// with the row data.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func getRow<T>(
        databaseId: String,
        tableId: String,
        rowId: String,
        queries: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Row<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{rowId}", with: rowId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Row<T> = { response in
            return AppwriteModels.Row.from(map: response as! [String: Any])
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
    /// Get a row by its unique ID. This endpoint response returns a JSON object
    /// with the row data.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func getRow(
        databaseId: String,
        tableId: String,
        rowId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.Row<[String: AnyCodable]> {
        return try await getRow(
            databaseId: databaseId,
            tableId: tableId,
            rowId: rowId,
            queries: queries,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create or update a Row. Before using this route, you should create a new
    /// table resource using either a [server
    /// integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func upsertRow<T>(
        databaseId: String,
        tableId: String,
        rowId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Row<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{rowId}", with: rowId)

        let apiParams: [String: Any?] = [
            "data": data,
            "permissions": permissions
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Row<T> = { response in
            return AppwriteModels.Row.from(map: response as! [String: Any])
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
    /// Create or update a Row. Before using this route, you should create a new
    /// table resource using either a [server
    /// integration](https://appwrite.io/docs/references/cloud/server-dart/tablesDB#createTable)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func upsertRow(
        databaseId: String,
        tableId: String,
        rowId: String,
        data: Any? = nil,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.Row<[String: AnyCodable]> {
        return try await upsertRow(
            databaseId: databaseId,
            tableId: tableId,
            rowId: rowId,
            data: data,
            permissions: permissions,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update a row by its unique ID. Using the patch method you can pass only
    /// specific fields that will get updated.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func updateRow<T>(
        databaseId: String,
        tableId: String,
        rowId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Row<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{rowId}", with: rowId)

        let apiParams: [String: Any?] = [
            "data": data,
            "permissions": permissions
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Row<T> = { response in
            return AppwriteModels.Row.from(map: response as! [String: Any])
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
    /// Update a row by its unique ID. Using the patch method you can pass only
    /// specific fields that will get updated.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func updateRow(
        databaseId: String,
        tableId: String,
        rowId: String,
        data: Any? = nil,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.Row<[String: AnyCodable]> {
        return try await updateRow(
            databaseId: databaseId,
            tableId: tableId,
            rowId: rowId,
            data: data,
            permissions: permissions,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Delete a row by its unique ID.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteRow(
        databaseId: String,
        tableId: String,
        rowId: String
    ) async throws -> Any {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{rowId}", with: rowId)

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

    ///
    /// Decrement a specific column of a row by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - column: String
    ///   - value: Double (optional)
    ///   - min: Double (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func decrementRowColumn<T>(
        databaseId: String,
        tableId: String,
        rowId: String,
        column: String,
        value: Double? = nil,
        min: Double? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Row<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}/{column}/decrement"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{rowId}", with: rowId)
            .replacingOccurrences(of: "{column}", with: column)

        let apiParams: [String: Any?] = [
            "value": value,
            "min": min
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Row<T> = { response in
            return AppwriteModels.Row.from(map: response as! [String: Any])
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
    /// Decrement a specific column of a row by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - column: String
    ///   - value: Double (optional)
    ///   - min: Double (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func decrementRowColumn(
        databaseId: String,
        tableId: String,
        rowId: String,
        column: String,
        value: Double? = nil,
        min: Double? = nil
    ) async throws -> AppwriteModels.Row<[String: AnyCodable]> {
        return try await decrementRowColumn(
            databaseId: databaseId,
            tableId: tableId,
            rowId: rowId,
            column: column,
            value: value,
            min: min,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Increment a specific column of a row by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - column: String
    ///   - value: Double (optional)
    ///   - max: Double (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func incrementRowColumn<T>(
        databaseId: String,
        tableId: String,
        rowId: String,
        column: String,
        value: Double? = nil,
        max: Double? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Row<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}/{column}/increment"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{rowId}", with: rowId)
            .replacingOccurrences(of: "{column}", with: column)

        let apiParams: [String: Any?] = [
            "value": value,
            "max": max
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Row<T> = { response in
            return AppwriteModels.Row.from(map: response as! [String: Any])
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
    /// Increment a specific column of a row by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - column: String
    ///   - value: Double (optional)
    ///   - max: Double (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func incrementRowColumn(
        databaseId: String,
        tableId: String,
        rowId: String,
        column: String,
        value: Double? = nil,
        max: Double? = nil
    ) async throws -> AppwriteModels.Row<[String: AnyCodable]> {
        return try await incrementRowColumn(
            databaseId: databaseId,
            tableId: tableId,
            rowId: rowId,
            column: column,
            value: value,
            max: max,
            nestedType: [String: AnyCodable].self
        )
    }


}