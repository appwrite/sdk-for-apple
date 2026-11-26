import Foundation
import JSONCodable

/// Video Renditions List
open class VideoRenditionList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case renditions = "renditions"
    }

    /// Total number of renditions that matched your query.
    public let total: Int
    /// List of renditions.
    public let renditions: [VideoRendition]

    init(
        total: Int,
        renditions: [VideoRendition]
    ) {
        self.total = total
        self.renditions = renditions
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.renditions = try container.contains(.renditions) ? container.decode([VideoRendition].self, forKey: .renditions) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(renditions, forKey: .renditions)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "renditions": renditions.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> VideoRenditionList {
        let defaults: [String: Any] = [
            "total": 0,
            "renditions": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return VideoRenditionList(
            total: map["total"] as! Int,
            renditions: (map["renditions"] as! [[String: Any]]).map { VideoRendition.from(map: $0) }
        )
    }
}
