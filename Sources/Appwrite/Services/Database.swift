import AsyncHTTPClient
import Foundation
import NIO
import AppwriteModels

open class Database: Service {
    ///
    /// List Documents
    ///
    /// Get a list of all the user documents. You can use the query params to
    /// filter your results. On admin mode, this endpoint will return a list of all
    /// of the project's documents. [Learn more about different API
    /// modes](/docs/admin).
    ///
    /// @param String collectionId
    /// @param [Any] queries
    /// @param Int limit
    /// @param Int offset
    /// @param String cursor
    /// @param String cursorDirection
    /// @param [Any] orderAttributes
    /// @param [Any] orderTypes
    /// @throws Exception
    /// @return array
    ///
    open func listDocuments(
        collectionId: String,
        queries: [Any]? = nil,
        limit: Int? = nil,
        offset: Int? = nil,
        cursor: String? = nil,
        cursorDirection: String? = nil,
        orderAttributes: [Any]? = nil,
        orderTypes: [Any]? = nil
    ) async throws -> AppwriteModels.DocumentList {
        var path: String = "/database/collections/{collectionId}/documents"

        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )

        let params: [String: Any?] = [
            "queries": queries,
            "limit": limit,
            "offset": offset,
            "cursor": cursor,
            "cursorDirection": cursorDirection,
            "orderAttributes": orderAttributes,
            "orderTypes": orderTypes
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let convert: ([String: Any]) -> AppwriteModels.DocumentList = { dict in
            return AppwriteModels.DocumentList.from(map: dict)
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            convert: convert
        )
    }

    ///
    /// Create Document
    ///
    /// Create a new Document. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](/docs/server/database#databaseCreateCollection) API or
    /// directly from your database console.
    ///
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [Any] read
    /// @param [Any] write
    /// @throws Exception
    /// @return array
    ///
    open func createDocument(
        collectionId: String,
        documentId: String,
        data: Any,
        read: [Any]? = nil,
        write: [Any]? = nil
    ) async throws -> AppwriteModels.Document {
        var path: String = "/database/collections/{collectionId}/documents"

        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )

        let params: [String: Any?] = [
            "documentId": documentId,
            "data": data,
            "read": read,
            "write": write
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let convert: ([String: Any]) -> AppwriteModels.Document = { dict in
            return AppwriteModels.Document.from(map: dict)
        }

        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            convert: convert
        )
    }

    ///
    /// Get Document
    ///
    /// Get a document by its unique ID. This endpoint response returns a JSON
    /// object with the document data.
    ///
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    open func getDocument(
        collectionId: String,
        documentId: String
    ) async throws -> AppwriteModels.Document {
        var path: String = "/database/collections/{collectionId}/documents/{documentId}"

        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )

        path = path.replacingOccurrences(
          of: "{documentId}",
          with: documentId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let convert: ([String: Any]) -> AppwriteModels.Document = { dict in
            return AppwriteModels.Document.from(map: dict)
        }

        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            convert: convert
        )
    }

    ///
    /// Update Document
    ///
    /// Update a document by its unique ID. Using the patch method you can pass
    /// only specific fields that will get updated.
    ///
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [Any] read
    /// @param [Any] write
    /// @throws Exception
    /// @return array
    ///
    open func updateDocument(
        collectionId: String,
        documentId: String,
        data: Any,
        read: [Any]? = nil,
        write: [Any]? = nil
    ) async throws -> AppwriteModels.Document {
        var path: String = "/database/collections/{collectionId}/documents/{documentId}"

        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )

        path = path.replacingOccurrences(
          of: "{documentId}",
          with: documentId
        )

        let params: [String: Any?] = [
            "data": data,
            "read": read,
            "write": write
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let convert: ([String: Any]) -> AppwriteModels.Document = { dict in
            return AppwriteModels.Document.from(map: dict)
        }

        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            convert: convert
        )
    }

    ///
    /// Delete Document
    ///
    /// Delete a document by its unique ID. This endpoint deletes only the parent
    /// documents, its attributes and relations to other documents. Child documents
    /// **will not** be deleted.
    ///
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    open func deleteDocument(
        collectionId: String,
        documentId: String
    ) async throws -> Any {
        var path: String = "/database/collections/{collectionId}/documents/{documentId}"

        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )

        path = path.replacingOccurrences(
          of: "{documentId}",
          with: documentId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params        )
    }


    ///
    /// List Documents
    ///
    /// Get a list of all the user documents. You can use the query params to
    /// filter your results. On admin mode, this endpoint will return a list of all
    /// of the project's documents. [Learn more about different API
    /// modes](/docs/admin).
    ///
    /// @param String collectionId
    /// @param [Any] queries
    /// @param Int limit
    /// @param Int offset
    /// @param String cursor
    /// @param String cursorDirection
    /// @param [Any] orderAttributes
    /// @param [Any] orderTypes
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func listDocuments(
        collectionId: String,
        queries: [Any]? = nil,
        limit: Int? = nil,
        offset: Int? = nil,
        cursor: String? = nil,
        cursorDirection: String? = nil,
        orderAttributes: [Any]? = nil,
        orderTypes: [Any]? = nil,
        completion: ((Result<AppwriteModels.DocumentList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listDocuments(
                    collectionId: collectionId,
                    queries: queries,
                    limit: limit,
                    offset: offset,
                    cursor: cursor,
                    cursorDirection: cursorDirection,
                    orderAttributes: orderAttributes,
                    orderTypes: orderTypes
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Document
    ///
    /// Create a new Document. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](/docs/server/database#databaseCreateCollection) API or
    /// directly from your database console.
    ///
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [Any] read
    /// @param [Any] write
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createDocument(
        collectionId: String,
        documentId: String,
        data: Any,
        read: [Any]? = nil,
        write: [Any]? = nil,
        completion: ((Result<AppwriteModels.Document, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createDocument(
                    collectionId: collectionId,
                    documentId: documentId,
                    data: data,
                    read: read,
                    write: write
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Document
    ///
    /// Get a document by its unique ID. This endpoint response returns a JSON
    /// object with the document data.
    ///
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getDocument(
        collectionId: String,
        documentId: String,
        completion: ((Result<AppwriteModels.Document, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getDocument(
                    collectionId: collectionId,
                    documentId: documentId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Update Document
    ///
    /// Update a document by its unique ID. Using the patch method you can pass
    /// only specific fields that will get updated.
    ///
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [Any] read
    /// @param [Any] write
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateDocument(
        collectionId: String,
        documentId: String,
        data: Any,
        read: [Any]? = nil,
        write: [Any]? = nil,
        completion: ((Result<AppwriteModels.Document, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateDocument(
                    collectionId: collectionId,
                    documentId: documentId,
                    data: data,
                    read: read,
                    write: write
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Delete Document
    ///
    /// Delete a document by its unique ID. This endpoint deletes only the parent
    /// documents, its attributes and relations to other documents. Child documents
    /// **will not** be deleted.
    ///
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func deleteDocument(
        collectionId: String,
        documentId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await deleteDocument(
                    collectionId: collectionId,
                    documentId: documentId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

}
