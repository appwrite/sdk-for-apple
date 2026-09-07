import Foundation
import JSONCodable

/// OAuth2 consent tokens list
open class Oauth2ConsentTokenList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case tokens = "tokens"
    }

    /// Total number of tokens that matched your query.
    public let total: Int
    /// List of tokens.
    public let tokens: [Oauth2ConsentToken]

    init(
        total: Int,
        tokens: [Oauth2ConsentToken]
    ) {
        self.total = total
        self.tokens = tokens
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.tokens = try container.decode([Oauth2ConsentToken].self, forKey: .tokens)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(tokens, forKey: .tokens)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "tokens": tokens.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Oauth2ConsentTokenList {
        return Oauth2ConsentTokenList(
            total: map["total"] as! Int,
            tokens: (map["tokens"] as! [[String: Any]]).map { Oauth2ConsentToken.from(map: $0) }
        )
    }
}
