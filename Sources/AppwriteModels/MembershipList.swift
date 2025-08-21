import Foundation
import JSONCodable

/// Memberships List
open class MembershipList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case memberships = "memberships"
    }

    /// Total number of memberships that matched your query.
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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.memberships = try container.decode([Membership].self, forKey: .memberships)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(memberships, forKey: .memberships)
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
