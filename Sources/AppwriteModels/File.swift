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
        case folder = "folder"
        case key = "key"
        case signature = "signature"
        case mimeType = "mimeType"
        case sizeOriginal = "sizeOriginal"
        case sizeActual = "sizeActual"
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
    /// Virtual folder containing the file, with a trailing slash. Empty for the bucket root.
    public let folder: String
    /// Full virtual path of the file: the folder followed by the file name.
    public let key: String
    /// File MD5 signature.
    public let signature: String
    /// File mime type.
    public let mimeType: String
    /// File original size in bytes.
    public let sizeOriginal: Int
    /// File actual stored size in bytes after compression and/or encryption.
    public let sizeActual: Int
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
        folder: String,
        key: String,
        signature: String,
        mimeType: String,
        sizeOriginal: Int,
        sizeActual: Int,
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
        self.folder = folder
        self.key = key
        self.signature = signature
        self.mimeType = mimeType
        self.sizeOriginal = sizeOriginal
        self.sizeActual = sizeActual
        self.chunksTotal = chunksTotal
        self.chunksUploaded = chunksUploaded
        self.encryption = encryption
        self.compression = compression
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.bucketId = try container.contains(.bucketId) ? container.decode(String.self, forKey: .bucketId) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.permissions = try container.contains(.permissions) ? container.decode([String].self, forKey: .permissions) : []
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.folder = try container.contains(.folder) ? container.decode(String.self, forKey: .folder) : ""
        self.key = try container.contains(.key) ? container.decode(String.self, forKey: .key) : ""
        self.signature = try container.contains(.signature) ? container.decode(String.self, forKey: .signature) : ""
        self.mimeType = try container.contains(.mimeType) ? container.decode(String.self, forKey: .mimeType) : ""
        self.sizeOriginal = try container.contains(.sizeOriginal) ? container.decode(Int.self, forKey: .sizeOriginal) : 0
        self.sizeActual = try container.contains(.sizeActual) ? container.decode(Int.self, forKey: .sizeActual) : 0
        self.chunksTotal = try container.contains(.chunksTotal) ? container.decode(Int.self, forKey: .chunksTotal) : 0
        self.chunksUploaded = try container.contains(.chunksUploaded) ? container.decode(Int.self, forKey: .chunksUploaded) : 0
        self.encryption = try container.contains(.encryption) ? container.decode(Bool.self, forKey: .encryption) : false
        self.compression = try container.contains(.compression) ? container.decode(String.self, forKey: .compression) : "none"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(bucketId, forKey: .bucketId)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(permissions, forKey: .permissions)
        try container.encode(name, forKey: .name)
        try container.encode(folder, forKey: .folder)
        try container.encode(key, forKey: .key)
        try container.encode(signature, forKey: .signature)
        try container.encode(mimeType, forKey: .mimeType)
        try container.encode(sizeOriginal, forKey: .sizeOriginal)
        try container.encode(sizeActual, forKey: .sizeActual)
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
            "folder": folder as Any,
            "key": key as Any,
            "signature": signature as Any,
            "mimeType": mimeType as Any,
            "sizeOriginal": sizeOriginal as Any,
            "sizeActual": sizeActual as Any,
            "chunksTotal": chunksTotal as Any,
            "chunksUploaded": chunksUploaded as Any,
            "encryption": encryption as Any,
            "compression": compression as Any,
        ]
    }

    public static func from(map: [String: Any]) -> File {
        let defaults: [String: Any] = [
            "$id": "",
            "bucketId": "",
            "$createdAt": "",
            "$updatedAt": "",
            "$permissions": [Any](),
            "name": "",
            "folder": "",
            "key": "",
            "signature": "",
            "mimeType": "",
            "sizeOriginal": 0,
            "sizeActual": 0,
            "chunksTotal": 0,
            "chunksUploaded": 0,
            "encryption": false,
            "compression": "none",
        ]
        let map = defaults.merging(map) { _, new in new }

        return File(
            id: map["$id"] as! String,
            bucketId: map["bucketId"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [String],
            name: map["name"] as! String,
            folder: map["folder"] as! String,
            key: map["key"] as! String,
            signature: map["signature"] as! String,
            mimeType: map["mimeType"] as! String,
            sizeOriginal: map["sizeOriginal"] as! Int,
            sizeActual: map["sizeActual"] as! Int,
            chunksTotal: map["chunksTotal"] as! Int,
            chunksUploaded: map["chunksUploaded"] as! Int,
            encryption: map["encryption"] as! Bool,
            compression: map["compression"] as! String
        )
    }
}
