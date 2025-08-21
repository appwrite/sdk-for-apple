import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Databases service allows you to create structured collections of documents, query and filter lists of documents
open class Databases: Service {

    ///
    /// Get a list of all the user's documents in a given collection. You can use
    /// the query params to filter your results.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.listRows` instead.")
    open func listDocuments<T>(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.DocumentList<T> = { response in
            return AppwriteModels.DocumentList.from(map: response as! [String: Any])
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
    /// Get a list of all the user's documents in a given collection. You can use
    /// the query params to filter your results.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.listRows` instead.")
    open func listDocuments(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await listDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            queries: queries,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create a new Document. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createRow` instead.")
    open func createDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any,
        permissions: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "documentId": documentId,
            "data": data,
            "permissions": permissions
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Document<T> = { response in
            return AppwriteModels.Document.from(map: response as! [String: Any])
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
    /// Create a new Document. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createRow` instead.")
    open func createDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await createDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            data: data,
            permissions: permissions,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Get a document by its unique ID. This endpoint response returns a JSON
    /// object with the document data.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.getRow` instead.")
    open func getDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        queries: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Document<T> = { response in
            return AppwriteModels.Document.from(map: response as! [String: Any])
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
    /// Get a document by its unique ID. This endpoint response returns a JSON
    /// object with the document data.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.getRow` instead.")
    open func getDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await getDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            queries: queries,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create or update a Document. Before using this route, you should create a
    /// new collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.upsertRow` instead.")
    open func upsertDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any,
        permissions: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

        let apiParams: [String: Any?] = [
            "data": data,
            "permissions": permissions
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Document<T> = { response in
            return AppwriteModels.Document.from(map: response as! [String: Any])
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
    /// Create or update a Document. Before using this route, you should create a
    /// new collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.upsertRow` instead.")
    open func upsertDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await upsertDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            data: data,
            permissions: permissions,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update a document by its unique ID. Using the patch method you can pass
    /// only specific fields that will get updated.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateRow` instead.")
    open func updateDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

        let apiParams: [String: Any?] = [
            "data": data,
            "permissions": permissions
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Document<T> = { response in
            return AppwriteModels.Document.from(map: response as! [String: Any])
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
    /// Update a document by its unique ID. Using the patch method you can pass
    /// only specific fields that will get updated.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateRow` instead.")
    open func updateDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await updateDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            data: data,
            permissions: permissions,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Delete a document by its unique ID.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.deleteRow` instead.")
    open func deleteDocument(
        databaseId: String,
        collectionId: String,
        documentId: String
    ) async throws -> Any {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

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
    /// Decrement a specific attribute of a document by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - attribute: String
    ///   - value: Double (optional)
    ///   - min: Double (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.decrementRowColumn` instead.")
    open func decrementDocumentAttribute<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        attribute: String,
        value: Double? = nil,
        min: Double? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}/{attribute}/decrement"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)
            .replacingOccurrences(of: "{attribute}", with: attribute)

        let apiParams: [String: Any?] = [
            "value": value,
            "min": min
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Document<T> = { response in
            return AppwriteModels.Document.from(map: response as! [String: Any])
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
    /// Decrement a specific attribute of a document by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - attribute: String
    ///   - value: Double (optional)
    ///   - min: Double (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.decrementRowColumn` instead.")
    open func decrementDocumentAttribute(
        databaseId: String,
        collectionId: String,
        documentId: String,
        attribute: String,
        value: Double? = nil,
        min: Double? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await decrementDocumentAttribute(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            attribute: attribute,
            value: value,
            min: min,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Increment a specific attribute of a document by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - attribute: String
    ///   - value: Double (optional)
    ///   - max: Double (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.incrementRowColumn` instead.")
    open func incrementDocumentAttribute<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        attribute: String,
        value: Double? = nil,
        max: Double? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}/{attribute}/increment"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)
            .replacingOccurrences(of: "{attribute}", with: attribute)

        let apiParams: [String: Any?] = [
            "value": value,
            "max": max
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Document<T> = { response in
            return AppwriteModels.Document.from(map: response as! [String: Any])
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
    /// Increment a specific attribute of a document by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - attribute: String
    ///   - value: Double (optional)
    ///   - max: Double (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.incrementRowColumn` instead.")
    open func incrementDocumentAttribute(
        databaseId: String,
        collectionId: String,
        documentId: String,
        attribute: String,
        value: Double? = nil,
        max: Double? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await incrementDocumentAttribute(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            attribute: attribute,
            value: value,
            max: max,
            nestedType: [String: AnyCodable].self
        )
    }


}