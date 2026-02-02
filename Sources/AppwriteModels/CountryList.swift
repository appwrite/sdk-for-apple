import Foundation
import JSONCodable

/// Countries List
open class CountryList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case countries = "countries"
    }

    /// Total number of countries that matched your query.
    public let total: Int
    /// List of countries.
    public let countries: [Country]

    init(
        total: Int,
        countries: [Country]
    ) {
        self.total = total
        self.countries = countries
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.countries = try container.decode([Country].self, forKey: .countries)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(countries, forKey: .countries)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "countries": countries.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> CountryList {
        return CountryList(
            total: map["total"] as! Int,
            countries: (map["countries"] as! [[String: Any]]).map { Country.from(map: $0) }
        )
    }
}
