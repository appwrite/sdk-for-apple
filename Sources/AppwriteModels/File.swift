
/// File
public class File {

    /// File ID.
    public let id: String

    /// Bucket ID.
    public let bucketId: String

    /// File read permissions.
    public let read: [Any]

    /// File write permissions.
    public let write: [Any]

    /// File name.
    public let name: String

    /// File creation date in Unix timestamp.
    public let dateCreated: Int

    /// File MD5 signature.
    public let signature: String

    /// File mime type.
    public let mimeType: String

    /// File original size in bytes.
    public let sizeOriginal: Int

    /// Total number of chunks available
    public let chunksTotal: Int

    /// Total number of chunks uploaded
    public let chunksUploaded: Int

    init(
        id: String,
        bucketId: String,
        read: [Any],
        write: [Any],
        name: String,
        dateCreated: Int,
        signature: String,
        mimeType: String,
        sizeOriginal: Int,
        chunksTotal: Int,
        chunksUploaded: Int
    ) {
        self.id = id
        self.bucketId = bucketId
        self.read = read
        self.write = write
        self.name = name
        self.dateCreated = dateCreated
        self.signature = signature
        self.mimeType = mimeType
        self.sizeOriginal = sizeOriginal
        self.chunksTotal = chunksTotal
        self.chunksUploaded = chunksUploaded
    }

    public static func from(map: [String: Any]) -> File {
        return File(
            id: map["$id"] as! String,
            bucketId: map["bucketId"] as! String,
            read: map["$read"] as! [Any],
            write: map["$write"] as! [Any],
            name: map["name"] as! String,
            dateCreated: map["dateCreated"] as! Int,
            signature: map["signature"] as! String,
            mimeType: map["mimeType"] as! String,
            sizeOriginal: map["sizeOriginal"] as! Int,
            chunksTotal: map["chunksTotal"] as! Int,
            chunksUploaded: map["chunksUploaded"] as! Int
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "bucketId": bucketId as Any,
            "$read": read as Any,
            "$write": write as Any,
            "name": name as Any,
            "dateCreated": dateCreated as Any,
            "signature": signature as Any,
            "mimeType": mimeType as Any,
            "sizeOriginal": sizeOriginal as Any,
            "chunksTotal": chunksTotal as Any,
            "chunksUploaded": chunksUploaded as Any
        ]
    }
                                                
}