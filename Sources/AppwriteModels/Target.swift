import Foundation
import JSONCodable

/// Target
public class Target {

    /// Target ID.
    public let id: String

    /// Target creation time in ISO 8601 format.
    public let createdAt: String

    /// Target update date in ISO 8601 format.
    public let updatedAt: String

    /// Target Name.
    public let name: String

    /// User ID.
    public let userId: String

    /// Provider ID.
    public let providerId: String?

    /// The target provider type. Can be one of the following: `email`, `sms` or `push`.
    public let providerType: String

    /// The target identifier.
    public let identifier: String

    /// Is the target expired.
    public let expired: Bool


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        userId: String,
        providerId: String?,
        providerType: String,
        identifier: String,
        expired: Bool
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.userId = userId
        self.providerId = providerId
        self.providerType = providerType
        self.identifier = identifier
        self.expired = expired
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "userId": userId as Any,
            "providerId": providerId as Any,
            "providerType": providerType as Any,
            "identifier": identifier as Any,
            "expired": expired as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Target {
        return Target(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            userId: map["userId"] as! String,
            providerId: map["providerId"] as? String,
            providerType: map["providerType"] as! String,
            identifier: map["identifier"] as! String,
            expired: map["expired"] as! Bool
        )
    }
}
