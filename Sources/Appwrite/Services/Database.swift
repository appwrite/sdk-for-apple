import AsyncHTTPClient
import Foundation
import NIO

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
    /// @param Array<Any>? filters
    /// @param Int limit
    /// @param Int offset
    /// @param String orderField
    /// @param String orderType
    /// @param String orderCast
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func listDocuments(collectionId: String, filters: Array<Any>? = nil, limit: Int = 25, offset: Int = 0, orderField: String = "", orderType: String = "ASC", orderCast: String = "string", search: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/database/collections/{collectionId}/documents"

        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )

        let params: [String: Any?] = [
            "filters": filters,
            "limit": limit,
            "offset": offset,
            "orderField": orderField,
            "orderType": orderType,
            "orderCast": orderCast,
            "search": search
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
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
    /// @param Any? data
    /// @param Array<Any>? read
    /// @param Array<Any>? write
    /// @param String parentDocument
    /// @param String parentProperty
    /// @param String parentPropertyType
    /// @throws Exception
    /// @return array
    ///
    open func createDocument(collectionId: String, data: Any?, read: Array<Any>? = [], write: Array<Any>? = [], parentDocument: String = "", parentProperty: String = "", parentPropertyType: String = "assign", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/database/collections/{collectionId}/documents"

        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )

        let params: [String: Any?] = [
            "data": data,
            "read": read,
            "write": write,
            "parentDocument": parentDocument,
            "parentProperty": parentProperty,
            "parentPropertyType": parentPropertyType
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "POST", path: path, headers: headers, params: params, completion: completion)
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
    open func getDocument(collectionId: String, documentId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update Document
    ///
    /// Update a document by its unique ID. Using the patch method you can pass
    /// only specific fields that will get updated.
    ///
    /// @param String collectionId
    /// @param String documentId
    /// @param Any? data
    /// @param Array<Any>? read
    /// @param Array<Any>? write
    /// @throws Exception
    /// @return array
    ///
    open func updateDocument(collectionId: String, documentId: String, data: Any?, read: Array<Any>? = [], write: Array<Any>? = [], completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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

        client.call(method: "PATCH", path: path, headers: headers, params: params, completion: completion)
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
    open func deleteDocument(collectionId: String, documentId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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

        client.call(method: "DELETE", path: path, headers: headers, params: params, completion: completion)
    }

}
