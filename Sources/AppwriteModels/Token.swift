import Foundation
import JSONCodable

/// Token
open class Token: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case userId = "userId"
        case secret = "secret"
        case expire = "expire"
        case phrase = "phrase"
    }

    /// Token ID.
    public let id: String
    /// Token creation date in ISO 8601 format.
    public let createdAt: String
    /// User ID.
    public let userId: String
    /// Token secret key. This will return an empty string unless the response is returned using an API key or as part of a webhook payload.
    public let secret: String
    /// Token expiration date in ISO 8601 format.
    public let expire: String
    /// Security phrase of a token. Empty if security phrase was not requested when creating a token. It includes randomly generated phrase which is also sent in the external resource such as email.
    public let phrase: String

    init(
        id: String,
        createdAt: String,
        userId: String,
        secret: String,
        expire: String,
        phrase: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.userId = userId
        self.secret = secret
        self.expire = expire
        self.phrase = phrase
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.secret = try container.decode(String.self, forKey: .secret)
        self.expire = try container.decode(String.self, forKey: .expire)
        self.phrase = try container.decode(String.self, forKey: .phrase)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(userId, forKey: .userId)
        try container.encode(secret, forKey: .secret)
        try container.encode(expire, forKey: .expire)
        try container.encode(phrase, forKey: .phrase)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "userId": userId as Any,
            "secret": secret as Any,
            "expire": expire as Any,
            "phrase": phrase as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Token {
        return Token(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            userId: map["userId"] as! String,
            secret: map["secret"] as! String,
            expire: map["expire"] as! String,
            phrase: map["phrase"] as! String
        )
    }
}
