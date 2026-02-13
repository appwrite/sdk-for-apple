import Foundation
import JSONCodable

/// Downgrade Feedback
open class DowngradeFeedback: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case title = "title"
        case message = "message"
        case fromPlanId = "fromPlanId"
        case toPlanId = "toPlanId"
        case teamId = "teamId"
        case userId = "userId"
        case version = "version"
    }

    /// Feedback ID.
    public let id: String
    /// Feedback creation date in ISO 8601 format.
    public let createdAt: String
    /// Feedback update date in ISO 8601 format.
    public let updatedAt: String
    /// Feedback reason
    public let title: String
    /// Feedback message
    public let message: String
    /// Plan ID downgrading from
    public let fromPlanId: String
    /// Plan ID downgrading to
    public let toPlanId: String
    /// Organization ID
    public let teamId: String
    /// User ID who submitted feedback
    public let userId: String
    /// Console version
    public let version: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        title: String,
        message: String,
        fromPlanId: String,
        toPlanId: String,
        teamId: String,
        userId: String,
        version: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.title = title
        self.message = message
        self.fromPlanId = fromPlanId
        self.toPlanId = toPlanId
        self.teamId = teamId
        self.userId = userId
        self.version = version
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.title = try container.decode(String.self, forKey: .title)
        self.message = try container.decode(String.self, forKey: .message)
        self.fromPlanId = try container.decode(String.self, forKey: .fromPlanId)
        self.toPlanId = try container.decode(String.self, forKey: .toPlanId)
        self.teamId = try container.decode(String.self, forKey: .teamId)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.version = try container.decode(String.self, forKey: .version)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(title, forKey: .title)
        try container.encode(message, forKey: .message)
        try container.encode(fromPlanId, forKey: .fromPlanId)
        try container.encode(toPlanId, forKey: .toPlanId)
        try container.encode(teamId, forKey: .teamId)
        try container.encode(userId, forKey: .userId)
        try container.encode(version, forKey: .version)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "title": title as Any,
            "message": message as Any,
            "fromPlanId": fromPlanId as Any,
            "toPlanId": toPlanId as Any,
            "teamId": teamId as Any,
            "userId": userId as Any,
            "version": version as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DowngradeFeedback {
        return DowngradeFeedback(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            title: map["title"] as! String,
            message: map["message"] as! String,
            fromPlanId: map["fromPlanId"] as! String,
            toPlanId: map["toPlanId"] as! String,
            teamId: map["teamId"] as! String,
            userId: map["userId"] as! String,
            version: map["version"] as! String
        )
    }
}
