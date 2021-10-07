
/// Continents List
public class ContinentList {

    /// Total sum of items in the list.
    public let sum: Int

    /// List of continents.
    public let continents: [Continent]

    init(
        sum: Int,
        continents: [Continent]
    ) {
        self.sum = sum
        self.continents = continents
    }

    public static func from(map: [String: Any]) -> ContinentList {
        return ContinentList(
            sum: map["sum"] as! Int,
            continents: (map["continents"] as! [[String: Any]]).map { Continent.from(map: $0) } as! [Continent]
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "continents": continents.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                        
}