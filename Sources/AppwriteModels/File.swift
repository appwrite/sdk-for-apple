import Foundation
import JSONCodable

/// File
open class File: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case bucketId = "bucketId"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case permissions = "$permissions"
        case name = "name"
        case signature = "signature"
        case mimeType = "mimeType"
        case sizeOriginal = "sizeOriginal"
        case chunksTotal = "chunksTotal"
        case chunksUploaded = "chunksUploaded"
        case encryption = "encryption"
        case compression = "compression"
    }

    /// File ID.
    public let id: String
    /// Bucket ID.
    public let bucketId: String
    /// File creation date in ISO 8601 format.
    public let createdAt: String
    /// File update date in ISO 8601 format.
    public let updatedAt: String
    /// File permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
    public let permissions: [String]
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
    /// Whether file contents are encrypted at rest.
    public let encryption: Bool
    /// Compression algorithm used for the file. Will be one of none, [gzip](https://en.wikipedia.org/wiki/Gzip), or [zstd](https://en.wikipedia.org/wiki/Zstd).
    public let compression: String

    init(
        id: String,
        bucketId: String,
        createdAt: String,
        updatedAt: String,
        permissions: [String],
        name: String,
        signature: String,
        mimeType: String,
        sizeOriginal: Int,
        chunksTotal: Int,
        chunksUploaded: Int,
        encryption: Bool,
        compression: String
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
        self.encryption = encryption
        self.compression = compression
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.bucketId = try container.decode(String.self, forKey: .bucketId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.permissions = try container.decode([String].self, forKey: .permissions)
        self.name = try container.decode(String.self, forKey: .name)
        self.signature = try container.decode(String.self, forKey: .signature)
        self.mimeType = try container.decode(String.self, forKey: .mimeType)
        self.sizeOriginal = try container.decode(Int.self, forKey: .sizeOriginal)
        self.chunksTotal = try container.decode(Int.self, forKey: .chunksTotal)
        self.chunksUploaded = try container.decode(Int.self, forKey: .chunksUploaded)
        self.encryption = try container.decode(Bool.self, forKey: .encryption)
        self.compression = try container.decode(String.self, forKey: .compression)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(bucketId, forKey: .bucketId)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(permissions, forKey: .permissions)
        try container.encode(name, forKey: .name)
        try container.encode(signature, forKey: .signature)
        try container.encode(mimeType, forKey: .mimeType)
        try container.encode(sizeOriginal, forKey: .sizeOriginal)
        try container.encode(chunksTotal, forKey: .chunksTotal)
        try container.encode(chunksUploaded, forKey: .chunksUploaded)
        try container.encode(encryption, forKey: .encryption)
        try container.encode(compression, forKey: .compression)
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
            "chunksUploaded": chunksUploaded as Any,
            "encryption": encryption as Any,
            "compression": compression as Any
        ]
    }

    public static func from(map: [String: Any] ) -> File {
        return File(
            id: map["$id"] as! String,
            bucketId: map["bucketId"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [String],
            name: map["name"] as! String,
            signature: map["signature"] as! String,
            mimeType: map["mimeType"] as! String,
            sizeOriginal: map["sizeOriginal"] as! Int,
            chunksTotal: map["chunksTotal"] as! Int,
            chunksUploaded: map["chunksUploaded"] as! Int,
            encryption: map["encryption"] as! Bool,
            compression: map["compression"] as! String
        )
    }
}
