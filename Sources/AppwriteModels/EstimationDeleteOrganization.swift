import Foundation
import JSONCodable

/// EstimationDeleteOrganization
open class EstimationDeleteOrganization: Codable {

    enum CodingKeys: String, CodingKey {
        case unpaidInvoices = "unpaidInvoices"
    }

    /// List of unpaid invoices
    public let unpaidInvoices: [Invoice]

    init(
        unpaidInvoices: [Invoice]
    ) {
        self.unpaidInvoices = unpaidInvoices
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.unpaidInvoices = try container.decode([Invoice].self, forKey: .unpaidInvoices)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(unpaidInvoices, forKey: .unpaidInvoices)
    }

    public func toMap() -> [String: Any] {
        return [
            "unpaidInvoices": unpaidInvoices.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> EstimationDeleteOrganization {
        return EstimationDeleteOrganization(
            unpaidInvoices: (map["unpaidInvoices"] as! [[String: Any]]).map { Invoice.from(map: $0) }
        )
    }
}
