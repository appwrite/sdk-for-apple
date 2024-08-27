import Foundation
import JSONCodable

/// File
public class File {

    /// File ID.
    public let id: String


    /// Bucket ID.
    public let bucketId: String


    /// File creation date in ISO 8601 format.
    public let createdAt: String


    /// File update date in ISO 8601 format.
    public let updatedAt: String


    /// File permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
    public let permissions: [Any]


    /// File name.
    public let name: String


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
        createdAt: String,
        updatedAt: String,
        permissions: [Any],
        name: String,
        signature: String,
        mimeType: String,
        sizeOriginal: Int,
        chunksTotal: Int,
        chunksUploaded: Int
    ) {
        self.id = id
        self.bucketId = bucketId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.name = name
        self.signature = signature
        self.mimeType = mimeType
        self.sizeOriginal = sizeOriginal
        self.chunksTotal = chunksTotal
        self.chunksUploaded = chunksUploaded
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "bucketId": bucketId as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$permissions": permissions as Any,
            "name": name as Any,
            "signature": signature as Any,
            "mimeType": mimeType as Any,
            "sizeOriginal": sizeOriginal as Any,
            "chunksTotal": chunksTotal as Any,
            "chunksUploaded": chunksUploaded as Any
        ]
    }

    public static func from(map: [String: Any] ) -> File {
        return File(
            id: map["$id"] as! String,
            bucketId: map["bucketId"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [Any],
            name: map["name"] as! String,
            signature: map["signature"] as! String,
            mimeType: map["mimeType"] as! String,
            sizeOriginal: map["sizeOriginal"] as! Int,
            chunksTotal: map["chunksTotal"] as! Int,
            chunksUploaded: map["chunksUploaded"] as! Int
        )
    }
}
