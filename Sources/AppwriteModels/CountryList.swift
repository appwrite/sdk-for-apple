import Foundation

/// Countries List
public class CountryList {

    /// Total number of countries documents that matched your query.
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
