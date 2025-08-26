import Foundation
import JSONCodable

/// Currencies List
open class CurrencyList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case currencies = "currencies"
    }

    /// Total number of currencies that matched your query.
    public let total: Int

    /// List of currencies.
    public let currencies: [Currency]


    init(
        total: Int,
        currencies: [Currency]
    ) {
        self.total = total
        self.currencies = currencies
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.currencies = try container.decode([Currency].self, forKey: .currencies)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(currencies, forKey: .currencies)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "currencies": currencies.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> CurrencyList {
        return CurrencyList(
            total: map["total"] as! Int,
            currencies: (map["currencies"] as! [[String: Any]]).map { Currency.from(map: $0) }
        )
    }
}
