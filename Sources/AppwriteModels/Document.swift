
/// Document
public class Document {

    /// Document ID.
    public let id: String

    /// Collection ID.
    public let collection: String

    /// Document creation date in Unix timestamp.
    public let createdAt: Int

    /// Document update date in Unix timestamp.
    public let updatedAt: Int

    /// Document read permissions.
    public let read: [Any]

    /// Document write permissions.
    public let write: [Any]

    let data: [String: Any]

    init(
        id: String,
        collection: String,
        createdAt: Int,
        updatedAt: Int,
        read: [Any],
        write: [Any],
        data: [String: Any]
    ) {
        self.id = id
        self.collection = collection
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.read = read
        self.write = write
        self.data = data
    }

    public static func from(map: [String: Any]) -> Document {
        return Document(
            id: map["$id"] as! String,
            collection: map["$collection"] as! String,
            createdAt: map["$createdAt"] as! Int,
            updatedAt: map["$updatedAt"] as! Int,
            read: map["$read"] as! [Any],
            write: map["$write"] as! [Any],
            data: map
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$collection": collection as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$read": read as Any,
            "$write": write as Any,
            "data": data
        ]
    }

    public func convertTo<T>(fromJson: ([String: Any]) -> T) -> T {
        return fromJson(data)
    }
                                
}