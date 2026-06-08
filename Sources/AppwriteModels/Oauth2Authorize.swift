import Foundation
import JSONCodable

/// OAuth2 Authorize
open class Oauth2Authorize: Codable {

    enum CodingKeys: String, CodingKey {
        case grantId = "grantId"
        case redirectUrl = "redirectUrl"
    }

    /// OAuth2 grant ID. Set when the user must give explicit consent; pass it to the approve or reject endpoint. Empty when a redirect URL is returned instead.
    public let grantId: String
    /// URL the end user should be redirected to when the flow can complete without consent. Empty when consent is still required.
    public let redirectUrl: String

    init(
        grantId: String,
        redirectUrl: String
    ) {
        self.grantId = grantId
        self.redirectUrl = redirectUrl
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.grantId = try container.decode(String.self, forKey: .grantId)
        self.redirectUrl = try container.decode(String.self, forKey: .redirectUrl)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(grantId, forKey: .grantId)
        try container.encode(redirectUrl, forKey: .redirectUrl)
    }

    public func toMap() -> [String: Any] {
        return [
            "grantId": grantId as Any,
            "redirectUrl": redirectUrl as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Oauth2Authorize {
        return Oauth2Authorize(
            grantId: map["grantId"] as! String,
            redirectUrl: map["redirectUrl"] as! String
        )
    }
}
