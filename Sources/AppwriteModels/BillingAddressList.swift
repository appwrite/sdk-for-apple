import Foundation
import JSONCodable

/// Billing address list
open class BillingAddressList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case billingAddresses = "billingAddresses"
    }

    /// Total number of billingAddresses that matched your query.
    public let total: Int
    /// List of billingAddresses.
    public let billingAddresses: [BillingAddress]

    init(
        total: Int,
        billingAddresses: [BillingAddress]
    ) {
        self.total = total
        self.billingAddresses = billingAddresses
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.billingAddresses = try container.decode([BillingAddress].self, forKey: .billingAddresses)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(billingAddresses, forKey: .billingAddresses)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "billingAddresses": billingAddresses.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> BillingAddressList {
        return BillingAddressList(
            total: map["total"] as! Int,
            billingAddresses: (map["billingAddresses"] as! [[String: Any]]).map { BillingAddress.from(map: $0) }
        )
    }
}
