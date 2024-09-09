import Foundation
import JSONCodable

/// Document
public class Document<T : Codable> {

    /// Document ID.
    public let id: String

    /// Collection ID.
    public let collectionId: String

    /// Database ID.
    public let databaseId: String

    /// Document creation date in ISO 8601 format.
    public let createdAt: String

    /// Document update date in ISO 8601 format.
    public let updatedAt: String

    /// Document permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
    public let permissions: [Any]

    /// Additional properties
    public let data: T

    init(
        id: String,
        collectionId: String,
        databaseId: String,
        createdAt: String,
        updatedAt: String,
        permissions: [Any],
        data: T
    ) {
        self.id = id
        self.collectionId = collectionId
        self.databaseId = databaseId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.data = data
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$collectionId": collectionId as Any,
            "$databaseId": databaseId as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$permissions": permissions as Any,
            "data": try! JSONEncoder().encode(data)
        ]
    }

    public static func from(map: [String: Any] ) -> Document {
        return Document(
            id: map["$id"] as! String,
            collectionId: map["$collectionId"] as! String,
            databaseId: map["$databaseId"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [Any],
            data: try! JSONDecoder().decode(T.self, from: JSONSerialization.data(withJSONObject: map, options: []))
        )
    }
}
