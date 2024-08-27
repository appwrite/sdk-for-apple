import Foundation
import JSONCodable

/// Subscriber
public class Subscriber {

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
