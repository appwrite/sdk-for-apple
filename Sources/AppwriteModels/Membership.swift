import Foundation
import JSONCodable

/// Membership
public class Membership {

    /// Membership ID.
    public let id: String

    /// Membership creation date in ISO 8601 format.
    public let createdAt: String

    /// Membership update date in ISO 8601 format.
    public let updatedAt: String

    /// User ID.
    public let userId: String

    /// User name. Hide this attribute by toggling membership privacy in the Console.
    public let userName: String

    /// User email address. Hide this attribute by toggling membership privacy in the Console.
    public let userEmail: String

    /// Team ID.
    public let teamId: String

    /// Team name.
    public let teamName: String

    /// Date, the user has been invited to join the team in ISO 8601 format.
    public let invited: String

    /// Date, the user has accepted the invitation to join the team in ISO 8601 format.
    public let joined: String

    /// User confirmation status, true if the user has joined the team or false otherwise.
    public let confirm: Bool

    /// Multi factor authentication status, true if the user has MFA enabled or false otherwise. Hide this attribute by toggling membership privacy in the Console.
    public let mfa: Bool

    /// User list of roles
    public let roles: [String]


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        userId: String,
        userName: String,
        userEmail: String,
        teamId: String,
        teamName: String,
        invited: String,
        joined: String,
        confirm: Bool,
        mfa: Bool,
        roles: [String]
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userId = userId
        self.userName = userName
        self.userEmail = userEmail
        self.teamId = teamId
        self.teamName = teamName
        self.invited = invited
        self.joined = joined
        self.confirm = confirm
        self.mfa = mfa
        self.roles = roles
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "userId": userId as Any,
            "userName": userName as Any,
            "userEmail": userEmail as Any,
            "teamId": teamId as Any,
            "teamName": teamName as Any,
            "invited": invited as Any,
            "joined": joined as Any,
            "confirm": confirm as Any,
            "mfa": mfa as Any,
            "roles": roles as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Membership {
        return Membership(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            userId: map["userId"] as! String,
            userName: map["userName"] as! String,
            userEmail: map["userEmail"] as! String,
            teamId: map["teamId"] as! String,
            teamName: map["teamName"] as! String,
            invited: map["invited"] as! String,
            joined: map["joined"] as! String,
            confirm: map["confirm"] as! Bool,
            mfa: map["mfa"] as! Bool,
            roles: map["roles"] as! [String]
        )
    }
}
