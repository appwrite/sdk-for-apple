import Foundation
import JSONCodable

/// Memberships List
public class MembershipList {

    /// Total number of memberships documents that matched your query.
    public let total: Int

    /// List of memberships.
    public let memberships: [Membership]


    init(
        total: Int,
        memberships: [Membership]
    ) {
        self.total = total
        self.memberships = memberships
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "memberships": memberships.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> MembershipList {
        return MembershipList(
            total: map["total"] as! Int,
            memberships: (map["memberships"] as! [[String: Any]]).map { Membership.from(map: $0) }
        )
    }
}
