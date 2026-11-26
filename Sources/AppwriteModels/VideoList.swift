import Foundation
import JSONCodable

/// Videos List
open class VideoList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case videos = "videos"
    }

    /// Total number of videos that matched your query.
    public let total: Int
    /// List of videos.
    public let videos: [Video]

    init(
        total: Int,
        videos: [Video]
    ) {
        self.total = total
        self.videos = videos
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.videos = try container.contains(.videos) ? container.decode([Video].self, forKey: .videos) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(videos, forKey: .videos)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "videos": videos.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> VideoList {
        let defaults: [String: Any] = [
            "total": 0,
            "videos": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return VideoList(
            total: map["total"] as! Int,
            videos: (map["videos"] as! [[String: Any]]).map { Video.from(map: $0) }
        )
    }
}
