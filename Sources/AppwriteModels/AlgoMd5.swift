import Foundation
import JSONCodable

/// AlgoMD5
open class AlgoMd5: Codable {

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Algo type.
    public let type: String

    init(
        type: String
    ) {
        self.type = type
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.type = try container.contains(.type) ? container.decode(String.self, forKey: .type) : "md5"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
    }

    public func toMap() -> [String: Any] {
        return [
            "type": type as Any
        ]
    }

    public static func from(map: [String: Any]) -> AlgoMd5 {
        let defaults: [String: Any] = [
            "type": "md5",
        ]
        let map = defaults.merging(map) { _, new in new }

        return AlgoMd5(
            type: map["type"] as! String
        )
    }
}
