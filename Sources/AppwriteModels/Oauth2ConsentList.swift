import Foundation
import JSONCodable

/// OAuth2 consents list
open class Oauth2ConsentList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case consents = "consents"
    }

    /// Total number of consents that matched your query.
    public let total: Int
    /// List of consents.
    public let consents: [Oauth2Consent]

    init(
        total: Int,
        consents: [Oauth2Consent]
    ) {
        self.total = total
        self.consents = consents
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.consents = try container.decode([Oauth2Consent].self, forKey: .consents)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(consents, forKey: .consents)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "consents": consents.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Oauth2ConsentList {
        return Oauth2ConsentList(
            total: map["total"] as! Int,
            consents: (map["consents"] as! [[String: Any]]).map { Oauth2Consent.from(map: $0) }
        )
    }
}
