import Foundation
import JSONCodable

/// OAuth2 Organization
open class Oauth2Organization: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
    }

    /// Organization ID.
    public let id: String

    init(
        id: String
    ) {
        self.id = id
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any
        ]
    }

    public static func from(map: [String: Any]) -> Oauth2Organization {
        return Oauth2Organization(
            id: map["$id"] as! String
        )
    }
}
