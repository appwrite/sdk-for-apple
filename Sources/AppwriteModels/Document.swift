
/// Document
public class Document {

    /// Document ID.
    public let id: String

    /// Collection ID.
    public let collection: String

    /// Document read permissions.
    public let read: [Any]

    /// Document write permissions.
    public let write: [Any]

    let data: [String: Any]

    init(
        id: String,
        collection: String,
        read: [Any],
        write: [Any],
        data: [String: Any]
    ) {
        self.id = id
        self.collection = collection
        self.read = read
        self.write = write
        self.data = data
    }

    public static func from(map: [String: Any]) -> Document {
        return Document(
            id: map["$id"] as! String,
            collection: map["$collection"] as! String,
            read: map["$read"] as! [Any],
            write: map["$write"] as! [Any],
            data: map
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$collection": collection as Any,
            "$read": read as Any,
            "$write": write as Any,
            "data": data
        ]
    }

    public func convertTo<T>(fromJson: ([String: Any]) -> T) -> T {
        return fromJson(data)
    }
                        
}