import Foundation
import JSONCodable

/// JWT
open class Jwt: Codable {

    enum CodingKeys: String, CodingKey {
        case jwt = "jwt"
    }

    /// JWT encoded string.
    public let jwt: String


    init(
        jwt: String
    ) {
        self.jwt = jwt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.jwt = try container.decode(String.self, forKey: .jwt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(jwt, forKey: .jwt)
    }

    public func toMap() -> [String: Any] {
        return [
            "jwt": jwt as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Jwt {
        return Jwt(
            jwt: map["jwt"] as? String ?? ""
        )
    }
}
