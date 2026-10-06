import Foundation
import JSONCodable

/// OAuth2 Token
open class Oauth2Token: Codable {

    enum CodingKeys: String, CodingKey {
        case access_token = "access_token"
        case token_type = "token_type"
        case expires_in = "expires_in"
        case refresh_token = "refresh_token"
        case scope = "scope"
        case authorization_details = "authorization_details"
        case id_token = "id_token"
    }

    /// OAuth2 access token.
    public let access_token: String
    /// OAuth2 token type.
    public let token_type: String
    /// Access token lifetime in seconds.
    public let expires_in: Int
    /// OAuth2 refresh token.
    public let refresh_token: String
    /// Space-separated scopes granted to the access token.
    public let scope: String
    /// Granted RFC 9396 authorization details as a JSON string.
    public let authorization_details: String?
    /// OpenID Connect ID token. Returned when the `openid` scope is granted.
    public let id_token: String?

    init(
        access_token: String,
        token_type: String,
        expires_in: Int,
        refresh_token: String,
        scope: String,
        authorization_details: String?,
        id_token: String?
    ) {
        self.access_token = access_token
        self.token_type = token_type
        self.expires_in = expires_in
        self.refresh_token = refresh_token
        self.scope = scope
        self.authorization_details = authorization_details
        self.id_token = id_token
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.access_token = try container.decode(String.self, forKey: .access_token)
        self.token_type = try container.decode(String.self, forKey: .token_type)
        self.expires_in = try container.decode(Int.self, forKey: .expires_in)
        self.refresh_token = try container.decode(String.self, forKey: .refresh_token)
        self.scope = try container.decode(String.self, forKey: .scope)
        self.authorization_details = try container.decodeIfPresent(String.self, forKey: .authorization_details)
        self.id_token = try container.decodeIfPresent(String.self, forKey: .id_token)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(access_token, forKey: .access_token)
        try container.encode(token_type, forKey: .token_type)
        try container.encode(expires_in, forKey: .expires_in)
        try container.encode(refresh_token, forKey: .refresh_token)
        try container.encode(scope, forKey: .scope)
        try container.encodeIfPresent(authorization_details, forKey: .authorization_details)
        try container.encodeIfPresent(id_token, forKey: .id_token)
    }

    public func toMap() -> [String: Any] {
        return [
            "access_token": access_token as Any,
            "token_type": token_type as Any,
            "expires_in": expires_in as Any,
            "refresh_token": refresh_token as Any,
            "scope": scope as Any,
            "authorization_details": authorization_details as Any,
            "id_token": id_token as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Oauth2Token {
        return Oauth2Token(
            access_token: map["access_token"] as! String,
            token_type: map["token_type"] as! String,
            expires_in: map["expires_in"] as! Int,
            refresh_token: map["refresh_token"] as! String,
            scope: map["scope"] as! String,
            authorization_details: map["authorization_details"] as? String,
            id_token: map["id_token"] as? String
        )
    }
}
