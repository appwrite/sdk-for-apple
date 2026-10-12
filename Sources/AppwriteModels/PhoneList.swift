import Foundation
import JSONCodable

/// Phones List
open class PhoneList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case phones = "phones"
    }

    /// Total number of phones that matched your query.
    public let total: Int
    /// List of phones.
    public let phones: [Phone]

    init(
        total: Int,
        phones: [Phone]
    ) {
        self.total = total
        self.phones = phones
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.phones = try container.decode([Phone].self, forKey: .phones)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(phones, forKey: .phones)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "phones": phones.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> PhoneList {
        let defaults: [String: Any] = [
            "total": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return PhoneList(
            total: map["total"] as! Int,
            phones: (map["phones"] as! [[String: Any]]).map { Phone.from(map: $0) }
        )
    }
}
