import AppwriteEnums
import Foundation
import JSONCodable

/// Video rendition
open class VideoRendition: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case videoId = "videoId"
        case profileId = "profileId"
        case name = "name"
        case startedAt = "startedAt"
        case endedAt = "endedAt"
        case width = "width"
        case height = "height"
        case videoBitRate = "videoBitRate"
        case audioBitRate = "audioBitRate"
        case targetDuration = "targetDuration"
        case status = "status"
        case error = "error"
        case progress = "progress"
        case output = "output"
        case codec = "codec"
        case size = "size"
    }

    /// Rendition ID.
    public let id: String
    /// Rendition creation time in ISO 8601 format.
    public let createdAt: String
    /// Rendition update date in ISO 8601 format.
    public let updatedAt: String
    /// Video ID.
    public let videoId: String
    /// Video profile ID this rendition was encoded against.
    public let profileId: String
    /// Rendition name, derived from its dimensions and bitrate.
    public let name: String
    /// Transcoding start time in ISO 8601 format.
    public let startedAt: String
    /// Transcoding end time in ISO 8601 format.
    public let endedAt: String
    /// Rendition width in pixels.
    public let width: Int
    /// Rendition height in pixels.
    public let height: Int
    /// Video bitrate in bits per second.
    public let videoBitRate: Int
    /// Audio bitrate in bits per second.
    public let audioBitRate: Int
    /// Longest segment duration in seconds.
    public let targetDuration: Double
    /// Transcoding status: one of `pending`, `started`, `ended`, `ready`, `error` or `aborted`.
    public let status: AppwriteEnums.VideoRenditionStatus
    /// Why the rendition failed or was aborted. Empty unless `status` is `error` or `aborted`.
    public let error: String
    /// Transcoding progress as a percentage, from 0 to 100.
    public let progress: Int
    /// Streaming output format: `hls`, `dash`, or `cmaf`.
    public let output: AppwriteEnums.VideoOutput
    /// Video encode codec snapshotted from the profile at create time: one of `h264`, `hevc`, or `vp9`.
    public let codec: AppwriteEnums.VideoCodecId
    /// Stored rendition size in bytes.
    public let size: Int

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        videoId: String,
        profileId: String,
        name: String,
        startedAt: String,
        endedAt: String,
        width: Int,
        height: Int,
        videoBitRate: Int,
        audioBitRate: Int,
        targetDuration: Double,
        status: AppwriteEnums.VideoRenditionStatus,
        error: String,
        progress: Int,
        output: AppwriteEnums.VideoOutput,
        codec: AppwriteEnums.VideoCodecId,
        size: Int
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.videoId = videoId
        self.profileId = profileId
        self.name = name
        self.startedAt = startedAt
        self.endedAt = endedAt
        self.width = width
        self.height = height
        self.videoBitRate = videoBitRate
        self.audioBitRate = audioBitRate
        self.targetDuration = targetDuration
        self.status = status
        self.error = error
        self.progress = progress
        self.output = output
        self.codec = codec
        self.size = size
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.videoId = try container.contains(.videoId) ? container.decode(String.self, forKey: .videoId) : ""
        self.profileId = try container.contains(.profileId) ? container.decode(String.self, forKey: .profileId) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.startedAt = try container.contains(.startedAt) ? container.decode(String.self, forKey: .startedAt) : ""
        self.endedAt = try container.contains(.endedAt) ? container.decode(String.self, forKey: .endedAt) : ""
        self.width = try container.contains(.width) ? container.decode(Int.self, forKey: .width) : 0
        self.height = try container.contains(.height) ? container.decode(Int.self, forKey: .height) : 0
        self.videoBitRate = try container.contains(.videoBitRate) ? container.decode(Int.self, forKey: .videoBitRate) : 0
        self.audioBitRate = try container.contains(.audioBitRate) ? container.decode(Int.self, forKey: .audioBitRate) : 0
        self.targetDuration = try container.contains(.targetDuration) ? container.decode(Double.self, forKey: .targetDuration) : 0
        self.status = AppwriteEnums.VideoRenditionStatus(rawValue: try container.contains(.status) ? container.decode(String.self, forKey: .status) : "pending")!
        self.error = try container.contains(.error) ? container.decode(String.self, forKey: .error) : ""
        self.progress = try container.contains(.progress) ? container.decode(Int.self, forKey: .progress) : 0
        self.output = AppwriteEnums.VideoOutput(rawValue: try container.contains(.output) ? container.decode(String.self, forKey: .output) : "hls")!
        self.codec = AppwriteEnums.VideoCodecId(rawValue: try container.contains(.codec) ? container.decode(String.self, forKey: .codec) : "h264")!
        self.size = try container.contains(.size) ? container.decode(Int.self, forKey: .size) : 0
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(videoId, forKey: .videoId)
        try container.encode(profileId, forKey: .profileId)
        try container.encode(name, forKey: .name)
        try container.encode(startedAt, forKey: .startedAt)
        try container.encode(endedAt, forKey: .endedAt)
        try container.encode(width, forKey: .width)
        try container.encode(height, forKey: .height)
        try container.encode(videoBitRate, forKey: .videoBitRate)
        try container.encode(audioBitRate, forKey: .audioBitRate)
        try container.encode(targetDuration, forKey: .targetDuration)
        try container.encode(status.rawValue, forKey: .status)
        try container.encode(error, forKey: .error)
        try container.encode(progress, forKey: .progress)
        try container.encode(output.rawValue, forKey: .output)
        try container.encode(codec.rawValue, forKey: .codec)
        try container.encode(size, forKey: .size)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "videoId": videoId as Any,
            "profileId": profileId as Any,
            "name": name as Any,
            "startedAt": startedAt as Any,
            "endedAt": endedAt as Any,
            "width": width as Any,
            "height": height as Any,
            "videoBitRate": videoBitRate as Any,
            "audioBitRate": audioBitRate as Any,
            "targetDuration": targetDuration as Any,
            "status": status.rawValue as Any,
            "error": error as Any,
            "progress": progress as Any,
            "output": output.rawValue as Any,
            "codec": codec.rawValue as Any,
            "size": size as Any,
        ]
    }

    public static func from(map: [String: Any]) -> VideoRendition {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "videoId": "",
            "profileId": "",
            "name": "",
            "startedAt": "",
            "endedAt": "",
            "width": 0,
            "height": 0,
            "videoBitRate": 0,
            "audioBitRate": 0,
            "targetDuration": 0.0,
            "status": "pending",
            "error": "",
            "progress": 0,
            "output": "hls",
            "codec": "h264",
            "size": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return VideoRendition(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            videoId: map["videoId"] as! String,
            profileId: map["profileId"] as! String,
            name: map["name"] as! String,
            startedAt: map["startedAt"] as! String,
            endedAt: map["endedAt"] as! String,
            width: map["width"] as! Int,
            height: map["height"] as! Int,
            videoBitRate: map["videoBitRate"] as! Int,
            audioBitRate: map["audioBitRate"] as! Int,
            targetDuration: map["targetDuration"] as! Double,
            status: AppwriteEnums.VideoRenditionStatus(rawValue: map["status"] as! String)!,
            error: map["error"] as! String,
            progress: map["progress"] as! Int,
            output: AppwriteEnums.VideoOutput(rawValue: map["output"] as! String)!,
            codec: AppwriteEnums.VideoCodecId(rawValue: map["codec"] as! String)!,
            size: map["size"] as! Int
        )
    }
}
