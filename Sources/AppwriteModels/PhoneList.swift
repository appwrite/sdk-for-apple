import Foundation

/// Phones List
public class PhoneList {

    /// Total number of phones documents that matched your query.
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

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "phones": phones.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> PhoneList {
        return PhoneList(
            total: map["total"] as! Int,
            phones: (map["phones"] as! [[String: Any]]).map { Phone.from(map: $0) }
        )
    }
}
