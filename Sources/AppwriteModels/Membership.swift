import Foundation
import JSONCodable

/// Membership
open class Membership: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case userId = "userId"
        case userName = "userName"
        case userEmail = "userEmail"
        case teamId = "teamId"
        case teamName = "teamName"
        case invited = "invited"
        case joined = "joined"
        case confirm = "confirm"
        case mfa = "mfa"
        case roles = "roles"
    }

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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.userName = try container.decode(String.self, forKey: .userName)
        self.userEmail = try container.decode(String.self, forKey: .userEmail)
        self.teamId = try container.decode(String.self, forKey: .teamId)
        self.teamName = try container.decode(String.self, forKey: .teamName)
        self.invited = try container.decode(String.self, forKey: .invited)
        self.joined = try container.decode(String.self, forKey: .joined)
        self.confirm = try container.decode(Bool.self, forKey: .confirm)
        self.mfa = try container.decode(Bool.self, forKey: .mfa)
        self.roles = try container.decode([String].self, forKey: .roles)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(userId, forKey: .userId)
        try container.encode(userName, forKey: .userName)
        try container.encode(userEmail, forKey: .userEmail)
        try container.encode(teamId, forKey: .teamId)
        try container.encode(teamName, forKey: .teamName)
        try container.encode(invited, forKey: .invited)
        try container.encode(joined, forKey: .joined)
        try container.encode(confirm, forKey: .confirm)
        try container.encode(mfa, forKey: .mfa)
        try container.encode(roles, forKey: .roles)
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
            id: map["$id"] as? String ?? "",
            createdAt: map["$createdAt"] as? String ?? "",
            updatedAt: map["$updatedAt"] as? String ?? "",
            userId: map["userId"] as? String ?? "",
            userName: map["userName"] as? String ?? "",
            userEmail: map["userEmail"] as? String ?? "",
            teamId: map["teamId"] as? String ?? "",
            teamName: map["teamName"] as? String ?? "",
            invited: map["invited"] as? String ?? "",
            joined: map["joined"] as? String ?? "",
            confirm: map["confirm"] as? Bool ?? false,
            mfa: map["mfa"] as? Bool ?? false,
            roles: map["roles"] as? [String] ?? []
        )
    }
}
