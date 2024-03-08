import Foundation
import JSONCodable

/// Token
public class Token {

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
