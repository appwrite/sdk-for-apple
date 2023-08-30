import Foundation
import JSONCodable

/// Identities List
public class IdentityList {

    /// Total number of identities documents that matched your query.
    public let total: Int

    /// List of identities.
    public let identities: [Identity]


    init(
        total: Int,
        identities: [Identity]
    ) {
        self.total = total
        self.identities = identities
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "identities": identities.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> IdentityList {
        return IdentityList(
            total: map["total"] as! Int,
            identities: (map["identities"] as! [[String: Any]]).map { Identity.from(map: $0) }
        )
    }
}
