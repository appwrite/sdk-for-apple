import Foundation
import JSONCodable

/// Identities List
open class IdentityList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case identities = "identities"
    }

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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.identities = try container.decode([Identity].self, forKey: .identities)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(identities, forKey: .identities)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "identities": identities.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> IdentityList {
        return IdentityList(
            total: map["total"] as? Int ?? 0,
            identities: (map["identities"] as? [[String: Any]] ?? []).map { Identity.from(map: $0) }
        )
    }
}
