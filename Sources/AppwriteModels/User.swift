
/// User
public class User {

    /// User ID.
    public let id: String

    /// User creation date in Unix timestamp.
    public let createdAt: Int

    /// User update date in Unix timestamp.
    public let updatedAt: Int

    /// User name.
    public let name: String

    /// User registration date in Unix timestamp.
    public let registration: Int

    /// User status. Pass `true` for enabled and `false` for disabled.
    public let status: Bool

    /// Unix timestamp of the most recent password update
    public let passwordUpdate: Int

    /// User email address.
    public let email: String

    /// User phone number in E.164 format.
    public let phone: String

    /// Email verification status.
    public let emailVerification: Bool

    /// Phone verification status.
    public let phoneVerification: Bool

    /// User preferences as a key-value object
    public let prefs: Preferences

    init(
        id: String,
        createdAt: Int,
        updatedAt: Int,
        name: String,
        registration: Int,
        status: Bool,
        passwordUpdate: Int,
        email: String,
        phone: String,
        emailVerification: Bool,
        phoneVerification: Bool,
        prefs: Preferences
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

    public static func from(map: [String: Any]) -> User {
        return User(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! Int,
            updatedAt: map["$updatedAt"] as! Int,
            name: map["name"] as! String,
            registration: map["registration"] as! Int,
            status: map["status"] as! Bool,
            passwordUpdate: map["passwordUpdate"] as! Int,
            email: map["email"] as! String,
            phone: map["phone"] as! String,
            emailVerification: map["emailVerification"] as! Bool,
            phoneVerification: map["phoneVerification"] as! Bool,
            prefs: Preferences.from(map: map["prefs"] as! [String: Any])
        )
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
                                                                                                                                                                            
}