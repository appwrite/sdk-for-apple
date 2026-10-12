import Foundation
import JSONCodable

/// Passkey Challenge
open class PasskeyChallenge: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case passkeyId = "passkeyId"
        case expire = "expire"
        case publicKey = "publicKey"
    }

    /// Challenge ID. When signing in, pass it back with the credential to receive a token.
    public let id: String
    /// Challenge creation date in ISO 8601 format.
    public let createdAt: String
    /// ID of the passkey being registered. Empty for sign-in challenges.
    public let passkeyId: String
    /// Challenge expiration date in ISO 8601 format.
    public let expire: String
    /// WebAuthn options in JSON form. Pass them to `PublicKeyCredential.parseCreationOptionsFromJSON()` when registering, or `PublicKeyCredential.parseRequestOptionsFromJSON()` when signing in.
    public let publicKey: [String: AnyCodable]

    init(
        id: String,
        createdAt: String,
        passkeyId: String,
        expire: String,
        publicKey: [String: AnyCodable]
    ) {
        self.id = id
        self.createdAt = createdAt
        self.passkeyId = passkeyId
        self.expire = expire
        self.publicKey = publicKey
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.passkeyId = try container.decode(String.self, forKey: .passkeyId)
        self.expire = try container.decode(String.self, forKey: .expire)
        self.publicKey = try container.decode([String: AnyCodable].self, forKey: .publicKey)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(passkeyId, forKey: .passkeyId)
        try container.encode(expire, forKey: .expire)
        try container.encode(publicKey, forKey: .publicKey)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "passkeyId": passkeyId as Any,
            "expire": expire as Any,
            "publicKey": publicKey as Any,
        ]
    }

    public static func from(map: [String: Any]) -> PasskeyChallenge {
        return PasskeyChallenge(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            passkeyId: map["passkeyId"] as! String,
            expire: map["expire"] as! String,
            publicKey: (map["publicKey"] as! [String: Any]).mapValues { AnyCodable($0) }
        )
    }
}
