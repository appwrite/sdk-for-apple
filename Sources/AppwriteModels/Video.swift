import AppwriteEnums
import Foundation
import JSONCodable

/// Video
open class Video: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case permissions = "$permissions"
        case bucketId = "bucketId"
        case fileId = "fileId"
        case name = "name"
        case size = "size"
        case format = "format"
        case duration = "duration"
        case width = "width"
        case height = "height"
        case aspectRatio = "aspectRatio"
        case videoCodec = "videoCodec"
        case videoFormat = "videoFormat"
        case videoFormatProfile = "videoFormatProfile"
        case videoBitRate = "videoBitRate"
        case videoFrameRate = "videoFrameRate"
        case videoFrameRateMode = "videoFrameRateMode"
        case audioCodec = "audioCodec"
        case audioFormat = "audioFormat"
        case audioBitRate = "audioBitRate"
        case audioSampleRate = "audioSampleRate"
        case timelineStatus = "timelineStatus"
        case timelineError = "timelineError"
    }

    /// Video ID.
    public let id: String
    /// Video creation time in ISO 8601 format.
    public let createdAt: String
    /// Video update date in ISO 8601 format.
    public let updatedAt: String
    /// Video permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
    public let permissions: [String]
    /// Storage bucket ID holding the source file.
    public let bucketId: String
    /// Source file ID.
    public let fileId: String
    /// Video name.
    public let name: String
    /// Source file size in bytes.
    public let size: Int
    /// Container format.
    public let format: String
    /// Video duration in milliseconds.
    public let duration: Int
    /// Video width in pixels.
    public let width: Int
    /// Video height in pixels.
    public let height: Int
    /// Video aspect ratio.
    public let aspectRatio: String
    /// Video codec.
    public let videoCodec: String
    /// Video format.
    public let videoFormat: String
    /// Video format profile.
    public let videoFormatProfile: String
    /// Video bitrate in bits per second.
    public let videoBitRate: Int
    /// Video frame rate in frames per second.
    public let videoFrameRate: Double
    /// Video frame rate mode.
    public let videoFrameRateMode: String
    /// Audio codec.
    public let audioCodec: String
    /// Audio format.
    public let audioFormat: String
    /// Audio bitrate in bits per second.
    public let audioBitRate: Int
    /// Audio sample rate in hertz.
    public let audioSampleRate: Int
    /// Thumbnail timeline job status: one of `pending`, `started`, `ready`, `skipped` (source has no video track) or `error`.
    public let timelineStatus: AppwriteEnums.VideoTimelineStatus
    /// Why the timeline job failed. Empty unless `timelineStatus` is `error`.
    public let timelineError: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        permissions: [String],
        bucketId: String,
        fileId: String,
        name: String,
        size: Int,
        format: String,
        duration: Int,
        width: Int,
        height: Int,
        aspectRatio: String,
        videoCodec: String,
        videoFormat: String,
        videoFormatProfile: String,
        videoBitRate: Int,
        videoFrameRate: Double,
        videoFrameRateMode: String,
        audioCodec: String,
        audioFormat: String,
        audioBitRate: Int,
        audioSampleRate: Int,
        timelineStatus: AppwriteEnums.VideoTimelineStatus,
        timelineError: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.bucketId = bucketId
        self.fileId = fileId
        self.name = name
        self.size = size
        self.format = format
        self.duration = duration
        self.width = width
        self.height = height
        self.aspectRatio = aspectRatio
        self.videoCodec = videoCodec
        self.videoFormat = videoFormat
        self.videoFormatProfile = videoFormatProfile
        self.videoBitRate = videoBitRate
        self.videoFrameRate = videoFrameRate
        self.videoFrameRateMode = videoFrameRateMode
        self.audioCodec = audioCodec
        self.audioFormat = audioFormat
        self.audioBitRate = audioBitRate
        self.audioSampleRate = audioSampleRate
        self.timelineStatus = timelineStatus
        self.timelineError = timelineError
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.permissions = try container.contains(.permissions) ? container.decode([String].self, forKey: .permissions) : []
        self.bucketId = try container.contains(.bucketId) ? container.decode(String.self, forKey: .bucketId) : ""
        self.fileId = try container.contains(.fileId) ? container.decode(String.self, forKey: .fileId) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.size = try container.contains(.size) ? container.decode(Int.self, forKey: .size) : 0
        self.format = try container.contains(.format) ? container.decode(String.self, forKey: .format) : ""
        self.duration = try container.contains(.duration) ? container.decode(Int.self, forKey: .duration) : 0
        self.width = try container.contains(.width) ? container.decode(Int.self, forKey: .width) : 0
        self.height = try container.contains(.height) ? container.decode(Int.self, forKey: .height) : 0
        self.aspectRatio = try container.contains(.aspectRatio) ? container.decode(String.self, forKey: .aspectRatio) : ""
        self.videoCodec = try container.contains(.videoCodec) ? container.decode(String.self, forKey: .videoCodec) : ""
        self.videoFormat = try container.contains(.videoFormat) ? container.decode(String.self, forKey: .videoFormat) : ""
        self.videoFormatProfile = try container.contains(.videoFormatProfile) ? container.decode(String.self, forKey: .videoFormatProfile) : ""
        self.videoBitRate = try container.contains(.videoBitRate) ? container.decode(Int.self, forKey: .videoBitRate) : 0
        self.videoFrameRate = try container.contains(.videoFrameRate) ? container.decode(Double.self, forKey: .videoFrameRate) : 0
        self.videoFrameRateMode = try container.contains(.videoFrameRateMode) ? container.decode(String.self, forKey: .videoFrameRateMode) : ""
        self.audioCodec = try container.contains(.audioCodec) ? container.decode(String.self, forKey: .audioCodec) : ""
        self.audioFormat = try container.contains(.audioFormat) ? container.decode(String.self, forKey: .audioFormat) : ""
        self.audioBitRate = try container.contains(.audioBitRate) ? container.decode(Int.self, forKey: .audioBitRate) : 0
        self.audioSampleRate = try container.contains(.audioSampleRate) ? container.decode(Int.self, forKey: .audioSampleRate) : 0
        self.timelineStatus = AppwriteEnums.VideoTimelineStatus(rawValue: try container.contains(.timelineStatus) ? container.decode(String.self, forKey: .timelineStatus) : "pending")!
        self.timelineError = try container.contains(.timelineError) ? container.decode(String.self, forKey: .timelineError) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(permissions, forKey: .permissions)
        try container.encode(bucketId, forKey: .bucketId)
        try container.encode(fileId, forKey: .fileId)
        try container.encode(name, forKey: .name)
        try container.encode(size, forKey: .size)
        try container.encode(format, forKey: .format)
        try container.encode(duration, forKey: .duration)
        try container.encode(width, forKey: .width)
        try container.encode(height, forKey: .height)
        try container.encode(aspectRatio, forKey: .aspectRatio)
        try container.encode(videoCodec, forKey: .videoCodec)
        try container.encode(videoFormat, forKey: .videoFormat)
        try container.encode(videoFormatProfile, forKey: .videoFormatProfile)
        try container.encode(videoBitRate, forKey: .videoBitRate)
        try container.encode(videoFrameRate, forKey: .videoFrameRate)
        try container.encode(videoFrameRateMode, forKey: .videoFrameRateMode)
        try container.encode(audioCodec, forKey: .audioCodec)
        try container.encode(audioFormat, forKey: .audioFormat)
        try container.encode(audioBitRate, forKey: .audioBitRate)
        try container.encode(audioSampleRate, forKey: .audioSampleRate)
        try container.encode(timelineStatus.rawValue, forKey: .timelineStatus)
        try container.encode(timelineError, forKey: .timelineError)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$permissions": permissions as Any,
            "bucketId": bucketId as Any,
            "fileId": fileId as Any,
            "name": name as Any,
            "size": size as Any,
            "format": format as Any,
            "duration": duration as Any,
            "width": width as Any,
            "height": height as Any,
            "aspectRatio": aspectRatio as Any,
            "videoCodec": videoCodec as Any,
            "videoFormat": videoFormat as Any,
            "videoFormatProfile": videoFormatProfile as Any,
            "videoBitRate": videoBitRate as Any,
            "videoFrameRate": videoFrameRate as Any,
            "videoFrameRateMode": videoFrameRateMode as Any,
            "audioCodec": audioCodec as Any,
            "audioFormat": audioFormat as Any,
            "audioBitRate": audioBitRate as Any,
            "audioSampleRate": audioSampleRate as Any,
            "timelineStatus": timelineStatus.rawValue as Any,
            "timelineError": timelineError as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Video {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "$permissions": [Any](),
            "bucketId": "",
            "fileId": "",
            "name": "",
            "size": 0,
            "format": "",
            "duration": 0,
            "width": 0,
            "height": 0,
            "aspectRatio": "",
            "videoCodec": "",
            "videoFormat": "",
            "videoFormatProfile": "",
            "videoBitRate": 0,
            "videoFrameRate": 0.0,
            "videoFrameRateMode": "",
            "audioCodec": "",
            "audioFormat": "",
            "audioBitRate": 0,
            "audioSampleRate": 0,
            "timelineStatus": "pending",
            "timelineError": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return Video(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [String],
            bucketId: map["bucketId"] as! String,
            fileId: map["fileId"] as! String,
            name: map["name"] as! String,
            size: map["size"] as! Int,
            format: map["format"] as! String,
            duration: map["duration"] as! Int,
            width: map["width"] as! Int,
            height: map["height"] as! Int,
            aspectRatio: map["aspectRatio"] as! String,
            videoCodec: map["videoCodec"] as! String,
            videoFormat: map["videoFormat"] as! String,
            videoFormatProfile: map["videoFormatProfile"] as! String,
            videoBitRate: map["videoBitRate"] as! Int,
            videoFrameRate: map["videoFrameRate"] as! Double,
            videoFrameRateMode: map["videoFrameRateMode"] as! String,
            audioCodec: map["audioCodec"] as! String,
            audioFormat: map["audioFormat"] as! String,
            audioBitRate: map["audioBitRate"] as! Int,
            audioSampleRate: map["audioSampleRate"] as! Int,
            timelineStatus: AppwriteEnums.VideoTimelineStatus(rawValue: map["timelineStatus"] as! String)!,
            timelineError: map["timelineError"] as! String
        )
    }
}
