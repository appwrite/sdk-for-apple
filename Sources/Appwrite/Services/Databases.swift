import AsyncHTTPClient
import Foundation
import NIO
import AppwriteModels

open class Databases: Service {
    var databaseId: String

    public init(_ client: Client, _ databaseId: String)
    {
        self.databaseId = databaseId
        super.init(client)
    }

    ///
    /// List Documents
    ///
    /// @param String databaseId
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
        var path: String = "/databases/{databaseId}/collections/{collectionId}/documents"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: self.databaseId
        )
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
        let converter: ([String: Any]) -> AppwriteModels.DocumentList = { dict in
            return AppwriteModels.DocumentList.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Document
    ///
    /// @param String databaseId
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
        var path: String = "/databases/{databaseId}/collections/{collectionId}/documents"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: self.databaseId
        )
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
        let converter: ([String: Any]) -> AppwriteModels.Document = { dict in
            return AppwriteModels.Document.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Document
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    open func getDocument(
        collectionId: String,
        documentId: String
    ) async throws -> AppwriteModels.Document {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: self.databaseId
        )
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
        let converter: ([String: Any]) -> AppwriteModels.Document = { dict in
            return AppwriteModels.Document.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Document
    ///
    /// @param String databaseId
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
        data: Any? = nil,
        read: [Any]? = nil,
        write: [Any]? = nil
    ) async throws -> AppwriteModels.Document {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: self.databaseId
        )
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
        let converter: ([String: Any]) -> AppwriteModels.Document = { dict in
            return AppwriteModels.Document.from(map: dict)
        }
        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Delete Document
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    open func deleteDocument(
        collectionId: String,
        documentId: String
    ) async throws -> Any {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: self.databaseId
        )
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
        data: Any? = nil,
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
