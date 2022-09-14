
/// Document
public class Document {

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

    /// Document permissions. [Learn more about permissions](/docs/permissions).
    public let permissions: [Any]

    let data: [String: Any]

    init(
        id: String,
        collectionId: String,
        databaseId: String,
        createdAt: String,
        updatedAt: String,
        permissions: [Any],
        data: [String: Any]
    ) {
        self.id = id
        self.collectionId = collectionId
        self.databaseId = databaseId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.data = data
    }

    public static func from(map: [String: Any]) -> Document {
        return Document(
            id: map["$id"] as! String,
            collectionId: map["$collectionId"] as! String,
            databaseId: map["$databaseId"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [Any],
            data: map
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$collectionId": collectionId as Any,
            "$databaseId": databaseId as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$permissions": permissions as Any,
            "data": data
        ]
    }

    public func convertTo<T>(fromJson: ([String: Any]) -> T) -> T {
        return fromJson(data)
    }
                                
}
