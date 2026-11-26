import AppwriteEnums
import Foundation
import JSONCodable

/// Video caption
open class VideoCaption: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case videoId = "videoId"
        case bucketId = "bucketId"
        case fileId = "fileId"
        case name = "name"
        case language = "language"
        case `default` = "default"
        case embedded = "embedded"
        case targetDuration = "targetDuration"
        case status = "status"
        case error = "error"
        case size = "size"
    }

    /// Caption ID.
    public let id: String
    /// Caption creation time in ISO 8601 format.
    public let createdAt: String
    /// Caption update date in ISO 8601 format.
    public let updatedAt: String
    /// Video ID.
    public let videoId: String
    /// Storage bucket ID holding the caption file.
    public let bucketId: String
    /// Caption file ID.
    public let fileId: String
    /// Caption display name.
    public let name: String
    /// Caption ISO 639-2 language code.
    public let language: String
    /// Is this the default caption track?
    public let `default`: Bool
    /// Was this track auto-extracted from the source container? Extracted tracks have no backing file; extraction runs once per video, so a deleted extracted track is not re-created.
    public let embedded: Bool
    /// Longest segment duration in seconds.
    public let targetDuration: Double
    /// Packaging status: one of `pending`, `started`, `ready`, `error` or `aborted`.
    public let status: AppwriteEnums.VideoCaptionStatus
    /// Why the caption failed or was aborted. Empty unless `status` is `error` or `aborted`.
    public let error: String
    /// Stored caption size in bytes.
    public let size: Int

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        videoId: String,
        bucketId: String,
        fileId: String,
        name: String,
        language: String,
        `default`: Bool,
        embedded: Bool,
        targetDuration: Double,
        status: AppwriteEnums.VideoCaptionStatus,
        error: String,
        size: Int
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.videoId = videoId
        self.bucketId = bucketId
        self.fileId = fileId
        self.name = name
        self.language = language
        self.`default` = `default`
        self.embedded = embedded
        self.targetDuration = targetDuration
        self.status = status
        self.error = error
        self.size = size
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.videoId = try container.contains(.videoId) ? container.decode(String.self, forKey: .videoId) : ""
        self.bucketId = try container.contains(.bucketId) ? container.decode(String.self, forKey: .bucketId) : ""
        self.fileId = try container.contains(.fileId) ? container.decode(String.self, forKey: .fileId) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.language = try container.contains(.language) ? container.decode(String.self, forKey: .language) : ""
        self.`default` = try container.contains(.`default`) ? container.decode(Bool.self, forKey: .`default`) : false
        self.embedded = try container.contains(.embedded) ? container.decode(Bool.self, forKey: .embedded) : false
        self.targetDuration = try container.contains(.targetDuration) ? container.decode(Double.self, forKey: .targetDuration) : 0
        self.status = AppwriteEnums.VideoCaptionStatus(rawValue: try container.contains(.status) ? container.decode(String.self, forKey: .status) : "pending")!
        self.error = try container.contains(.error) ? container.decode(String.self, forKey: .error) : ""
        self.size = try container.contains(.size) ? container.decode(Int.self, forKey: .size) : 0
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(videoId, forKey: .videoId)
        try container.encode(bucketId, forKey: .bucketId)
        try container.encode(fileId, forKey: .fileId)
        try container.encode(name, forKey: .name)
        try container.encode(language, forKey: .language)
        try container.encode(`default`, forKey: .`default`)
        try container.encode(embedded, forKey: .embedded)
        try container.encode(targetDuration, forKey: .targetDuration)
        try container.encode(status.rawValue, forKey: .status)
        try container.encode(error, forKey: .error)
        try container.encode(size, forKey: .size)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "videoId": videoId as Any,
            "bucketId": bucketId as Any,
            "fileId": fileId as Any,
            "name": name as Any,
            "language": language as Any,
            "default": `default` as Any,
            "embedded": embedded as Any,
            "targetDuration": targetDuration as Any,
            "status": status.rawValue as Any,
            "error": error as Any,
            "size": size as Any,
        ]
    }

    public static func from(map: [String: Any]) -> VideoCaption {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "videoId": "",
            "bucketId": "",
            "fileId": "",
            "name": "",
            "language": "",
            "default": false,
            "embedded": false,
            "targetDuration": 0.0,
            "status": "pending",
            "error": "",
            "size": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return VideoCaption(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            videoId: map["videoId"] as! String,
            bucketId: map["bucketId"] as! String,
            fileId: map["fileId"] as! String,
            name: map["name"] as! String,
            language: map["language"] as! String,
            `default`: map["default"] as! Bool,
            embedded: map["embedded"] as! Bool,
            targetDuration: map["targetDuration"] as! Double,
            status: AppwriteEnums.VideoCaptionStatus(rawValue: map["status"] as! String)!,
            error: map["error"] as! String,
            size: map["size"] as! Int
        )
    }
}
