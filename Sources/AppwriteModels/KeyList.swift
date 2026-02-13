import Foundation
import JSONCodable

/// API Keys List
open class KeyList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case keys = "keys"
    }

    /// Total number of keys that matched your query.
    public let total: Int
    /// List of keys.
    public let keys: [Key]

    init(
        total: Int,
        keys: [Key]
    ) {
        self.total = total
        self.keys = keys
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.keys = try container.decode([Key].self, forKey: .keys)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(keys, forKey: .keys)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "keys": keys.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> KeyList {
        return KeyList(
            total: map["total"] as! Int,
            keys: (map["keys"] as! [[String: Any]]).map { Key.from(map: $0) }
        )
    }
}
