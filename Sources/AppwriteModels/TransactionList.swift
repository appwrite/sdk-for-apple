import Foundation
import JSONCodable

/// Transaction List
open class TransactionList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case transactions = "transactions"
    }

    /// Total number of transactions that matched your query.
    public let total: Int
    /// List of transactions.
    public let transactions: [Transaction]

    init(
        total: Int,
        transactions: [Transaction]
    ) {
        self.total = total
        self.transactions = transactions
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.transactions = try container.decode([Transaction].self, forKey: .transactions)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(transactions, forKey: .transactions)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "transactions": transactions.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> TransactionList {
        return TransactionList(
            total: map["total"] as! Int,
            transactions: (map["transactions"] as! [[String: Any]]).map { Transaction.from(map: $0) }
        )
    }
}
