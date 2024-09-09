import Foundation
import JSONCodable

/// Identity
public class Identity {

    /// Identity ID.
    public let id: String


    /// Identity creation date in ISO 8601 format.
    public let createdAt: String


    /// Identity update date in ISO 8601 format.
    public let updatedAt: String


    /// User ID.
    public let userId: String


    /// Identity Provider.
    public let provider: String


    /// ID of the User in the Identity Provider.
    public let providerUid: String


    /// Email of the User in the Identity Provider.
    public let providerEmail: String


    /// Identity Provider Access Token.
    public let providerAccessToken: String


    /// The date of when the access token expires in ISO 8601 format.
    public let providerAccessTokenExpiry: String


    /// Identity Provider Refresh Token.
    public let providerRefreshToken: String



    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        userId: String,
        provider: String,
        providerUid: String,
        providerEmail: String,
        providerAccessToken: String,
        providerAccessTokenExpiry: String,
        providerRefreshToken: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userId = userId
        self.provider = provider
        self.providerUid = providerUid
        self.providerEmail = providerEmail
        self.providerAccessToken = providerAccessToken
        self.providerAccessTokenExpiry = providerAccessTokenExpiry
        self.providerRefreshToken = providerRefreshToken
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "userId": userId as Any,
            "provider": provider as Any,
            "providerUid": providerUid as Any,
            "providerEmail": providerEmail as Any,
            "providerAccessToken": providerAccessToken as Any,
            "providerAccessTokenExpiry": providerAccessTokenExpiry as Any,
            "providerRefreshToken": providerRefreshToken as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Identity {
        return Identity(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            userId: map["userId"] as! String,
            provider: map["provider"] as! String,
            providerUid: map["providerUid"] as! String,
            providerEmail: map["providerEmail"] as! String,
            providerAccessToken: map["providerAccessToken"] as! String,
            providerAccessTokenExpiry: map["providerAccessTokenExpiry"] as! String,
            providerRefreshToken: map["providerRefreshToken"] as! String
        )
    }
}
