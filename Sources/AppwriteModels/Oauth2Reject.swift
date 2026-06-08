import Foundation
import JSONCodable

/// OAuth2 Reject
open class Oauth2Reject: Codable {

    enum CodingKeys: String, CodingKey {
        case redirectUrl = "redirectUrl"
    }

    /// URL the end user should be redirected to after the grant is rejected, carrying an `access_denied` error.
    public let redirectUrl: String

    init(
        redirectUrl: String
    ) {
        self.redirectUrl = redirectUrl
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.redirectUrl = try container.decode(String.self, forKey: .redirectUrl)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(redirectUrl, forKey: .redirectUrl)
    }

    public func toMap() -> [String: Any] {
        return [
            "redirectUrl": redirectUrl as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Oauth2Reject {
        return Oauth2Reject(
            redirectUrl: map["redirectUrl"] as! String
        )
    }
}
