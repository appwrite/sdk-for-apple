import Foundation
import JSONCodable

/// MFA Challenge
public class MfaChallenge {

    /// Token ID.
    public let id: String


    /// Token creation date in ISO 8601 format.
    public let createdAt: String


    /// User ID.
    public let userId: String


    /// Token expiration date in ISO 8601 format.
    public let expire: String



    init(
        id: String,
        createdAt: String,
        userId: String,
        expire: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.userId = userId
        self.expire = expire
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "userId": userId as Any,
            "expire": expire as Any
        ]
    }

    public static func from(map: [String: Any] ) -> MfaChallenge {
        return MfaChallenge(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            userId: map["userId"] as! String,
            expire: map["expire"] as! String
        )
    }
}
