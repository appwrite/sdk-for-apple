import Foundation
import JSONCodable

/// MFA Challenge
open class MfaChallenge: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case userId = "userId"
        case expire = "expire"
    }

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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.expire = try container.decode(String.self, forKey: .expire)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(userId, forKey: .userId)
        try container.encode(expire, forKey: .expire)
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
            id: map["$id"] as? String ?? "",
            createdAt: map["$createdAt"] as? String ?? "",
            userId: map["userId"] as? String ?? "",
            expire: map["expire"] as? String ?? ""
        )
    }
}
