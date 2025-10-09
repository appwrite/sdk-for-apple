import Foundation
import JSONCodable

/// Transaction
open class Transaction: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case status = "status"
        case operations = "operations"
        case expiresAt = "expiresAt"
    }

    /// Transaction ID.
    public let id: String

    /// Transaction creation time in ISO 8601 format.
    public let createdAt: String

    /// Transaction update date in ISO 8601 format.
    public let updatedAt: String

    /// Current status of the transaction. One of: pending, committing, committed, rolled_back, failed.
    public let status: String

    /// Number of operations in the transaction.
    public let operations: Int

    /// Expiration time in ISO 8601 format.
    public let expiresAt: String


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        status: String,
        operations: Int,
        expiresAt: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.status = status
        self.operations = operations
        self.expiresAt = expiresAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.status = try container.decode(String.self, forKey: .status)
        self.operations = try container.decode(Int.self, forKey: .operations)
        self.expiresAt = try container.decode(String.self, forKey: .expiresAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(status, forKey: .status)
        try container.encode(operations, forKey: .operations)
        try container.encode(expiresAt, forKey: .expiresAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "status": status as Any,
            "operations": operations as Any,
            "expiresAt": expiresAt as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Transaction {
        return Transaction(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            status: map["status"] as! String,
            operations: map["operations"] as! Int,
            expiresAt: map["expiresAt"] as! String
        )
    }
}
