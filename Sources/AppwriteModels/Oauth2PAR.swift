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

        self.request_uri = try container.decode(String.self, forKey: .request_uri)
        self.expires_in = try container.decode(Int.self, forKey: .expires_in)
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
        return Oauth2PAR(
            request_uri: map["request_uri"] as! String,
            expires_in: map["expires_in"] as! Int
        )
    }
}
