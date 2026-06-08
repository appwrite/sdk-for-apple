import Foundation
import JSONCodable

/// App secrets list
open class AppSecretList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case secrets = "secrets"
    }

    /// Total number of secrets that matched your query.
    public let total: Int
    /// List of secrets.
    public let secrets: [AppSecret]

    init(
        total: Int,
        secrets: [AppSecret]
    ) {
        self.total = total
        self.secrets = secrets
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.secrets = try container.decode([AppSecret].self, forKey: .secrets)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(secrets, forKey: .secrets)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "secrets": secrets.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AppSecretList {
        return AppSecretList(
            total: map["total"] as! Int,
            secrets: (map["secrets"] as! [[String: Any]]).map { AppSecret.from(map: $0) }
        )
    }
}
