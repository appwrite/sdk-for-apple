import Foundation
import JSONCodable

/// Account
public class Account<T : Codable> {

    /// User ID.
    public let id: String

    /// User creation date in ISO 8601 format.
    public let createdAt: String

    /// User update date in ISO 8601 format.
    public let updatedAt: String

    /// User name.
    public let name: String

    /// User registration date in ISO 8601 format.
    public let registration: String

    /// User status. Pass `true` for enabled and `false` for disabled.
    public let status: Bool

    /// Password update time in ISO 8601 format.
    public let passwordUpdate: String

    /// User email address.
    public let email: String

    /// User phone number in E.164 format.
    public let phone: String

    /// Email verification status.
    public let emailVerification: Bool

    /// Phone verification status.
    public let phoneVerification: Bool

    /// User preferences as a key-value object
    public let prefs: Preferences<T>


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        registration: String,
        status: Bool,
        passwordUpdate: String,
        email: String,
        phone: String,
        emailVerification: Bool,
        phoneVerification: Bool,
        prefs: Preferences<T>
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.registration = registration
        self.status = status
        self.passwordUpdate = passwordUpdate
        self.email = email
        self.phone = phone
        self.emailVerification = emailVerification
        self.phoneVerification = phoneVerification
        self.prefs = prefs
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "registration": registration as Any,
            "status": status as Any,
            "passwordUpdate": passwordUpdate as Any,
            "email": email as Any,
            "phone": phone as Any,
            "emailVerification": emailVerification as Any,
            "phoneVerification": phoneVerification as Any,
            "prefs": prefs.toMap() as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Account {
        return Account(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            registration: map["registration"] as! String,
            status: map["status"] as! Bool,
            passwordUpdate: map["passwordUpdate"] as! String,
            email: map["email"] as! String,
            phone: map["phone"] as! String,
            emailVerification: map["emailVerification"] as! Bool,
            phoneVerification: map["phoneVerification"] as! Bool,
            prefs: Preferences.from(map: map["prefs"] as! [String: Any])
        )
    }
}
