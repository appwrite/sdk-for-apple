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
    /// @param String databaseId
    /// @param String collectionId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [String] permissions
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [String] permissions
    /// @throws Exception
    /// @return array
    ///
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
    /// Create new Documents. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param [Any] documents
    /// @throws Exception
    /// @return array
    ///
    open func createDocuments<T>(
        databaseId: String,
        collectionId: String,
        documents: [Any],
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "documents": documents
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.DocumentList<T> = { response in
            return AppwriteModels.DocumentList.from(map: response as! [String: Any])
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
    /// Create new Documents. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param [Any] documents
    /// @throws Exception
    /// @return array
    ///
    open func createDocuments(
        databaseId: String,
        collectionId: String,
        documents: [Any]
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await createDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            documents: documents,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Get a document by its unique ID. This endpoint response returns a JSON
    /// object with the document data.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
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
    /// Update a document by its unique ID. Using the patch method you can pass
    /// only specific fields that will get updated.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [String] permissions
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [String] permissions
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
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


}