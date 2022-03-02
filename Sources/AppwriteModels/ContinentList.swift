
/// Continents List
public class ContinentList {

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

    public static func from(map: [String: Any]) -> ContinentList {
        return ContinentList(
            total: map["total"] as! Int,
            continents: (map["continents"] as! [[String: Any]]).map { Continent.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "continents": continents.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                    
}