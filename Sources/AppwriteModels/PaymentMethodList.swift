import Foundation
import JSONCodable

/// Payment methods list
open class PaymentMethodList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case paymentMethods = "paymentMethods"
    }

    /// Total number of paymentMethods that matched your query.
    public let total: Int
    /// List of paymentMethods.
    public let paymentMethods: [PaymentMethod]

    init(
        total: Int,
        paymentMethods: [PaymentMethod]
    ) {
        self.total = total
        self.paymentMethods = paymentMethods
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.paymentMethods = try container.decode([PaymentMethod].self, forKey: .paymentMethods)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(paymentMethods, forKey: .paymentMethods)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "paymentMethods": paymentMethods.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> PaymentMethodList {
        return PaymentMethodList(
            total: map["total"] as! Int,
            paymentMethods: (map["paymentMethods"] as! [[String: Any]]).map { PaymentMethod.from(map: $0) }
        )
    }
}
