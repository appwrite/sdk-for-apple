
/// Countries List
public class CountryList {

    /// Total sum of items in the list.
    public let sum: Int

    /// List of countries.
    public let countries: [Country]

    init(
        sum: Int,
        countries: [Country]
    ) {
        self.sum = sum
        self.countries = countries
    }

    public static func from(map: [String: Any]) -> CountryList {
        return CountryList(
            sum: map["sum"] as! Int,
            countries: (map["countries"] as! [[String: Any]]).map { Country.from(map: $0) } as! [Country]
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "countries": countries.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                        
}