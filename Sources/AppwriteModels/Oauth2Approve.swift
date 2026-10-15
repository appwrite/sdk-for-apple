import Foundation
import JSONCodable

/// OAuth2 Approve
open class Oauth2Approve: Codable {

    enum CodingKeys: String, CodingKey {
        case redirectUrl = "redirectUrl"
    }

    /// URL the end user should be redirected to after the grant is approved, carrying the authorization `code` and/or `id_token` along with the original `state`.
    public let redirectUrl: String

    init(
        redirectUrl: String
    ) {
        self.redirectUrl = redirectUrl
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.redirectUrl = try container.contains(.redirectUrl) ? container.decode(String.self, forKey: .redirectUrl) : ""
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

    public static func from(map: [String: Any]) -> Oauth2Approve {
        let defaults: [String: Any] = ["redirectUrl": ""]
        let map = defaults.merging(map) { _, new in new }

        return Oauth2Approve(
            redirectUrl: map["redirectUrl"] as! String
        )
    }
}
