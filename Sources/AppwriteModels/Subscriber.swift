import Foundation
import JSONCodable

/// Subscriber
open class Subscriber: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case targetId = "targetId"
        case target = "target"
        case userId = "userId"
        case userName = "userName"
        case topicId = "topicId"
        case providerType = "providerType"
    }

    /// Subscriber ID.
    public let id: String

    /// Subscriber creation time in ISO 8601 format.
    public let createdAt: String

    /// Subscriber update date in ISO 8601 format.
    public let updatedAt: String

    /// Target ID.
    public let targetId: String

    /// Target.
    public let target: Target

    /// Topic ID.
    public let userId: String

    /// User Name.
    public let userName: String

    /// Topic ID.
    public let topicId: String

    /// The target provider type. Can be one of the following: `email`, `sms` or `push`.
    public let providerType: String


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        targetId: String,
        target: Target,
        userId: String,
        userName: String,
        topicId: String,
        providerType: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.targetId = targetId
        self.target = target
        self.userId = userId
        self.userName = userName
        self.topicId = topicId
        self.providerType = providerType
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.targetId = try container.decode(String.self, forKey: .targetId)
        self.target = try container.decode(Target.self, forKey: .target)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.userName = try container.decode(String.self, forKey: .userName)
        self.topicId = try container.decode(String.self, forKey: .topicId)
        self.providerType = try container.decode(String.self, forKey: .providerType)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(targetId, forKey: .targetId)
        try container.encode(target, forKey: .target)
        try container.encode(userId, forKey: .userId)
        try container.encode(userName, forKey: .userName)
        try container.encode(topicId, forKey: .topicId)
        try container.encode(providerType, forKey: .providerType)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "targetId": targetId as Any,
            "target": target.toMap() as Any,
            "userId": userId as Any,
            "userName": userName as Any,
            "topicId": topicId as Any,
            "providerType": providerType as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Subscriber {
        return Subscriber(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            targetId: map["targetId"] as! String,
            target: Target.from(map: map["target"] as! [String: Any]),
            userId: map["userId"] as! String,
            userName: map["userName"] as! String,
            topicId: map["topicId"] as! String,
            providerType: map["providerType"] as! String
        )
    }
}
