import Foundation
import JSONCodable

/// User
public class User<T : Codable> {

    /// User ID.
    public let id: String

    /// User creation date in ISO 8601 format.
    public let createdAt: String

    /// User update date in ISO 8601 format.
    public let updatedAt: String

    /// User name.
    public let name: String

    /// Hashed user password.
    public let password: String??

    /// Password hashing algorithm.
    public let hash: String??

    /// Password hashing algorithm configuration.
    public let hashOptions: Any??

    /// User registration date in ISO 8601 format.
    public let registration: String

    /// User status. Pass `true` for enabled and `false` for disabled.
    public let status: Bool

    /// Labels for the user.
    public let labels: [Any]

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

    /// Multi factor authentication status.
    public let mfa: Bool

    /// TOTP status.
    public let totp: Bool

    /// User preferences as a key-value object
    public let prefs: Preferences<T>

    /// A user-owned message receiver. A single user may have multiple e.g. emails, phones, and a browser. Each target is registered with a single provider.
    public let targets: [Target]

    /// Most recent access date in ISO 8601 format. This attribute is only updated again after 24 hours.
    public let accessedAt: String


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        password: String??,
        hash: String??,
        hashOptions: Any??,
        registration: String,
        status: Bool,
        labels: [Any],
        passwordUpdate: String,
        email: String,
        phone: String,
        emailVerification: Bool,
        phoneVerification: Bool,
        mfa: Bool,
        totp: Bool,
        prefs: Preferences<T>,
        targets: [Target],
        accessedAt: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.password = password
        self.hash = hash
        self.hashOptions = hashOptions
        self.registration = registration
        self.status = status
        self.labels = labels
        self.passwordUpdate = passwordUpdate
        self.email = email
        self.phone = phone
        self.emailVerification = emailVerification
        self.phoneVerification = phoneVerification
        self.mfa = mfa
        self.totp = totp
        self.prefs = prefs
        self.targets = targets
        self.accessedAt = accessedAt
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "password": password as Any,
            "hash": hash as Any,
            "hashOptions": hashOptions as Any,
            "registration": registration as Any,
            "status": status as Any,
            "labels": labels as Any,
            "passwordUpdate": passwordUpdate as Any,
            "email": email as Any,
            "phone": phone as Any,
            "emailVerification": emailVerification as Any,
            "phoneVerification": phoneVerification as Any,
            "mfa": mfa as Any,
            "totp": totp as Any,
            "prefs": prefs.toMap() as Any,
            "targets": targets.map { $0.toMap() } as Any,
            "accessedAt": accessedAt as Any
        ]
    }

    public static func from(map: [String: Any] ) -> User {
        return User(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            password: map["password"] as? String?,
            hash: map["hash"] as? String?,
            hashOptions: map["hashOptions"] as? Any?,
            registration: map["registration"] as! String,
            status: map["status"] as! Bool,
            labels: map["labels"] as! [Any],
            passwordUpdate: map["passwordUpdate"] as! String,
            email: map["email"] as! String,
            phone: map["phone"] as! String,
            emailVerification: map["emailVerification"] as! Bool,
            phoneVerification: map["phoneVerification"] as! Bool,
            mfa: map["mfa"] as! Bool,
            totp: map["totp"] as! Bool,
            prefs: Preferences.from(map: map["prefs"] as! [String: Any]),
            targets: (map["targets"] as! [[String: Any]]).map { Target.from(map: $0) },
            accessedAt: map["accessedAt"] as! String
        )
    }
}
