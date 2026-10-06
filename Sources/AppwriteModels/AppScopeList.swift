import Foundation
import JSONCodable

/// App scopes list
open class AppScopeList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case scopes = "scopes"
    }

    /// Total number of scopes that matched your query.
    public let total: Int
    /// List of scopes.
    public let scopes: [AppScope]

    init(
        total: Int,
        scopes: [AppScope]
    ) {
        self.total = total
        self.scopes = scopes
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.scopes = try container.decode([AppScope].self, forKey: .scopes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(scopes, forKey: .scopes)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "scopes": scopes.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> AppScopeList {
        return AppScopeList(
            total: map["total"] as! Int,
            scopes: (map["scopes"] as! [[String: Any]]).map { AppScope.from(map: $0) }
        )
    }
}
