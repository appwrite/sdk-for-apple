import Foundation
import JSONCodable

/// Continents List
open class ContinentList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case continents = "continents"
    }

    /// Total number of continents documents that matched your query.
    public let total: Int

    /// List of continents.
    public let continents: [Continent]


    init(
        total: Int,
        continents: [Continent]
    ) {
        self.total = total
        self.continents = continents
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.continents = try container.decode([Continent].self, forKey: .continents)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(continents, forKey: .continents)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "continents": continents.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ContinentList {
        return ContinentList(
            total: map["total"] as! Int,
            continents: (map["continents"] as! [[String: Any]]).map { Continent.from(map: $0) }
        )
    }
}
