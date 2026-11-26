import Foundation
import JSONCodable

/// Video Codecs List
open class VideoCodecList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case codecs = "codecs"
    }

    /// Total number of codecs that matched your query.
    public let total: Int
    /// List of codecs.
    public let codecs: [VideoCodec]

    init(
        total: Int,
        codecs: [VideoCodec]
    ) {
        self.total = total
        self.codecs = codecs
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.codecs = try container.contains(.codecs) ? container.decode([VideoCodec].self, forKey: .codecs) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(codecs, forKey: .codecs)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "codecs": codecs.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> VideoCodecList {
        let defaults: [String: Any] = [
            "total": 0,
            "codecs": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return VideoCodecList(
            total: map["total"] as! Int,
            codecs: (map["codecs"] as! [[String: Any]]).map { VideoCodec.from(map: $0) }
        )
    }
}
