import Foundation
import JSONCodable

/// Currencies List
public class CurrencyList {

    /// Total number of currencies documents that matched your query.
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
