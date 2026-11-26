import Foundation
import JSONCodable

/// Video Captions List
open class VideoCaptionList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case captions = "captions"
    }

    /// Total number of captions that matched your query.
    public let total: Int
    /// List of captions.
    public let captions: [VideoCaption]

    init(
        total: Int,
        captions: [VideoCaption]
    ) {
        self.total = total
        self.captions = captions
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.captions = try container.contains(.captions) ? container.decode([VideoCaption].self, forKey: .captions) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(captions, forKey: .captions)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "captions": captions.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> VideoCaptionList {
        let defaults: [String: Any] = [
            "total": 0,
            "captions": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return VideoCaptionList(
            total: map["total"] as! Int,
            captions: (map["captions"] as! [[String: Any]]).map { VideoCaption.from(map: $0) }
        )
    }
}
