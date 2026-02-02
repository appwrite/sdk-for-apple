import Foundation
import JSONCodable

/// MFAType
open class MfaType: Codable {

    enum CodingKeys: String, CodingKey {
        case secret = "secret"
        case uri = "uri"
    }

    /// Secret token used for TOTP factor.
    public let secret: String
    /// URI for authenticator apps.
    public let uri: String

    init(
        secret: String,
        uri: String
    ) {
        self.secret = secret
        self.uri = uri
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.secret = try container.decode(String.self, forKey: .secret)
        self.uri = try container.decode(String.self, forKey: .uri)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(secret, forKey: .secret)
        try container.encode(uri, forKey: .uri)
    }

    public func toMap() -> [String: Any] {
        return [
            "secret": secret as Any,
            "uri": uri as Any
        ]
    }

    public static func from(map: [String: Any] ) -> MfaType {
        return MfaType(
            secret: map["secret"] as! String,
            uri: map["uri"] as! String
        )
    }
}
