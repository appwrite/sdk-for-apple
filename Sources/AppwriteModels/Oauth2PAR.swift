import Foundation
import JSONCodable

/// OAuth2 PAR
open class Oauth2PAR: Codable {

    enum CodingKeys: String, CodingKey {
        case request_uri = "request_uri"
        case expires_in = "expires_in"
    }

    /// Authorization request handle to pass to the authorize endpoint.
    public let request_uri: String
    /// Lifetime of the authorization request handle in seconds.
    public let expires_in: Int

    init(
        request_uri: String,
        expires_in: Int
    ) {
        self.request_uri = request_uri
        self.expires_in = expires_in
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.request_uri = try container.contains(.request_uri) ? container.decode(String.self, forKey: .request_uri) : ""
        self.expires_in = try container.contains(.expires_in) ? container.decode(Int.self, forKey: .expires_in) : 0
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(request_uri, forKey: .request_uri)
        try container.encode(expires_in, forKey: .expires_in)
    }

    public func toMap() -> [String: Any] {
        return [
            "request_uri": request_uri as Any,
            "expires_in": expires_in as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Oauth2PAR {
        let defaults: [String: Any] = [
            "request_uri": "",
            "expires_in": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return Oauth2PAR(
            request_uri: map["request_uri"] as! String,
            expires_in: map["expires_in"] as! Int
        )
    }
}
