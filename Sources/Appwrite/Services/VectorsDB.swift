import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

///
open class VectorsDB: Service {

    ///
    /// List transactions across all databases.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.TransactionList
    ///
    open func listTransactions(
        queries: [String]? = nil
    ) async throws -> AppwriteModels.TransactionList {
        let apiPath: String = "/vectorsdb/transactions"

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.TransactionList = { response in
            return AppwriteModels.TransactionList.from(map: response as! [String: Any])
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
    /// Create a new transaction.
    ///
    /// - Parameters:
    ///   - ttl: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Transaction
    ///
    open func createTransaction(
        ttl: Int? = nil
    ) async throws -> AppwriteModels.Transaction {
        let apiPath: String = "/vectorsdb/transactions"

        let apiParams: [String: Any?] = [
            "ttl": ttl
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Transaction = { response in
            return AppwriteModels.Transaction.from(map: response as! [String: Any])
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
    /// Get a transaction by its unique ID.
    ///
    /// - Parameters:
    ///   - transactionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Transaction
    ///
    open func getTransaction(
        transactionId: String
    ) async throws -> AppwriteModels.Transaction {
        if transactionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"transactionId\"")
        }

        let apiPath: String = "/vectorsdb/transactions/{transactionId}"
            .replacingOccurrences(of: "{transactionId}", with: transactionId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Transaction = { response in
            return AppwriteModels.Transaction.from(map: response as! [String: Any])
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
    /// Update a transaction, to either commit or roll back its operations.
    ///
    /// - Parameters:
    ///   - transactionId: String
    ///   - commit: Bool (optional)
    ///   - rollback: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Transaction
    ///
    open func updateTransaction(
        transactionId: String,
        commit: Bool? = nil,
        rollback: Bool? = nil
    ) async throws -> AppwriteModels.Transaction {
        if transactionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"transactionId\"")
        }

        let apiPath: String = "/vectorsdb/transactions/{transactionId}"
            .replacingOccurrences(of: "{transactionId}", with: transactionId)

        let apiParams: [String: Any?] = [
            "commit": commit,
            "rollback": rollback,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Transaction = { response in
            return AppwriteModels.Transaction.from(map: response as! [String: Any])
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
    /// Delete a transaction by its unique ID.
    ///
    /// - Parameters:
    ///   - transactionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteTransaction(
        transactionId: String
    ) async throws -> Any {
        if transactionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"transactionId\"")
        }

        let apiPath: String = "/vectorsdb/transactions/{transactionId}"
            .replacingOccurrences(of: "{transactionId}", with: transactionId)

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
    /// Create multiple operations in a single transaction.
    ///
    /// - Parameters:
    ///   - transactionId: String
    ///   - operations: [AnyCodable] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Transaction
    ///
    open func createOperations(
        transactionId: String,
        operations: [AnyCodable]? = nil
    ) async throws -> AppwriteModels.Transaction {
        if transactionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"transactionId\"")
        }

        let apiPath: String = "/vectorsdb/transactions/{transactionId}/operations"
            .replacingOccurrences(of: "{transactionId}", with: transactionId)

        let apiParams: [String: Any?] = [
            "operations": operations
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Transaction = { response in
            return AppwriteModels.Transaction.from(map: response as! [String: Any])
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
    /// Get a list of all the user's documents in a given collection. You can use
    /// the query params to filter your results.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - queries: [String] (optional)
    ///   - transactionId: String (optional)
    ///   - total: Bool (optional)
    ///   - ttl: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func listDocuments<T>(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        total: Bool? = nil,
        ttl: Int? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        if databaseId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"databaseId\"")
        }
        if collectionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"collectionId\"")
        }

        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "transactionId": transactionId,
            "total": total,
            "ttl": ttl,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DocumentList<T> = { response in
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
    ///   - transactionId: String (optional)
    ///   - total: Bool (optional)
    ///   - ttl: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func listDocuments(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        total: Bool? = nil,
        ttl: Int? = nil
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await listDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            queries: queries,
            transactionId: transactionId,
            total: total,
            ttl: ttl,
            nestedType: [String: AnyCodable].self
        )
    }
    ///
    /// Create a new Document. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any
    ///   - permissions: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func createDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any,
        permissions: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        if databaseId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"databaseId\"")
        }
        if collectionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"collectionId\"")
        }

        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "documentId": documentId,
            "data": data,
            "permissions": permissions,
            "transactionId": transactionId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Document<T> = { response in
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
    /// integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any
    ///   - permissions: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func createDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any,
        permissions: [String]? = nil,
        transactionId: String? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await createDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            data: data,
            permissions: permissions,
            transactionId: transactionId,
            nestedType: [String: AnyCodable].self
        )
    }
    ///
    /// Get a list of all the user's documents in a given collection using a POST
    /// request. This behaves identically to the list documents endpoint but
    /// accepts the queries in the request body, allowing much larger `queries`
    /// arrays than can fit in a URL query string.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - queries: [String] (optional)
    ///   - transactionId: String (optional)
    ///   - total: Bool (optional)
    ///   - ttl: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func createQuery<T>(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        total: Bool? = nil,
        ttl: Int? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        if databaseId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"databaseId\"")
        }
        if collectionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"collectionId\"")
        }

        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents/query"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "transactionId": transactionId,
            "total": total,
            "ttl": ttl,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DocumentList<T> = { response in
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
    /// Get a list of all the user's documents in a given collection using a POST
    /// request. This behaves identically to the list documents endpoint but
    /// accepts the queries in the request body, allowing much larger `queries`
    /// arrays than can fit in a URL query string.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - queries: [String] (optional)
    ///   - transactionId: String (optional)
    ///   - total: Bool (optional)
    ///   - ttl: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func createQuery(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        total: Bool? = nil,
        ttl: Int? = nil
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await createQuery(
            databaseId: databaseId,
            collectionId: collectionId,
            queries: queries,
            transactionId: transactionId,
            total: total,
            ttl: ttl,
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
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func getDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        if databaseId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"databaseId\"")
        }
        if collectionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"collectionId\"")
        }
        if documentId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"documentId\"")
        }

        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "transactionId": transactionId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Document<T> = { response in
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
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func getDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        queries: [String]? = nil,
        transactionId: String? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await getDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            queries: queries,
            transactionId: transactionId,
            nestedType: [String: AnyCodable].self
        )
    }
    ///
    /// Create or update a Document. Before using this route, you should create a
    /// new collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func upsertDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        if databaseId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"databaseId\"")
        }
        if collectionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"collectionId\"")
        }
        if documentId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"documentId\"")
        }

        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

        let apiParams: [String: Any?] = [
            "data": data,
            "permissions": permissions,
            "transactionId": transactionId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Document<T> = { response in
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
    /// integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func upsertDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        transactionId: String? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await upsertDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            data: data,
            permissions: permissions,
            transactionId: transactionId,
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
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func updateDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        if databaseId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"databaseId\"")
        }
        if collectionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"collectionId\"")
        }
        if documentId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"documentId\"")
        }

        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

        let apiParams: [String: Any?] = [
            "data": data,
            "permissions": permissions,
            "transactionId": transactionId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Document<T> = { response in
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
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func updateDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        transactionId: String? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await updateDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            data: data,
            permissions: permissions,
            transactionId: transactionId,
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
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        transactionId: String? = nil
    ) async throws -> Any {
        if databaseId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"databaseId\"")
        }
        if collectionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"collectionId\"")
        }
        if documentId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"documentId\"")
        }

        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

        let apiParams: [String: Any?] = [
            "transactionId": transactionId
        ]

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
