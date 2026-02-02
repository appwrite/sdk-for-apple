import Foundation
import JSONCodable

/// User
open class User<T : Codable>: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case password = "password"
        case hash = "hash"
        case hashOptions = "hashOptions"
        case registration = "registration"
        case status = "status"
        case labels = "labels"
        case passwordUpdate = "passwordUpdate"
        case email = "email"
        case phone = "phone"
        case emailVerification = "emailVerification"
        case phoneVerification = "phoneVerification"
        case mfa = "mfa"
        case prefs = "prefs"
        case targets = "targets"
        case accessedAt = "accessedAt"
    }

    /// User ID.
    public let id: String
    /// User creation date in ISO 8601 format.
    public let createdAt: String
    /// User update date in ISO 8601 format.
    public let updatedAt: String
    /// User name.
    public let name: String
    /// Hashed user password.
    public let password: String?
    /// Password hashing algorithm.
    public let hash: String?
    /// Password hashing algorithm configuration.
    public let hashOptions: [String: AnyCodable]?
    /// User registration date in ISO 8601 format.
    public let registration: String
    /// User status. Pass `true` for enabled and `false` for disabled.
    public let status: Bool
    /// Labels for the user.
    public let labels: [String]
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
        password: String?,
        hash: String?,
        hashOptions: [String: AnyCodable]?,
        registration: String,
        status: Bool,
        labels: [String],
        passwordUpdate: String,
        email: String,
        phone: String,
        emailVerification: Bool,
        phoneVerification: Bool,
        mfa: Bool,
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
        self.prefs = prefs
        self.targets = targets
        self.accessedAt = accessedAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.password = try container.decodeIfPresent(String.self, forKey: .password)
        self.hash = try container.decodeIfPresent(String.self, forKey: .hash)
        self.hashOptions = try container.decodeIfPresent([String: AnyCodable].self, forKey: .hashOptions)
        self.registration = try container.decode(String.self, forKey: .registration)
        self.status = try container.decode(Bool.self, forKey: .status)
        self.labels = try container.decode([String].self, forKey: .labels)
        self.passwordUpdate = try container.decode(String.self, forKey: .passwordUpdate)
        self.email = try container.decode(String.self, forKey: .email)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.emailVerification = try container.decode(Bool.self, forKey: .emailVerification)
        self.phoneVerification = try container.decode(Bool.self, forKey: .phoneVerification)
        self.mfa = try container.decode(Bool.self, forKey: .mfa)
        self.prefs = try container.decode(Preferences<T>.self, forKey: .prefs)
        self.targets = try container.decode([Target].self, forKey: .targets)
        self.accessedAt = try container.decode(String.self, forKey: .accessedAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(password, forKey: .password)
        try container.encodeIfPresent(hash, forKey: .hash)
        try container.encodeIfPresent(hashOptions, forKey: .hashOptions)
        try container.encode(registration, forKey: .registration)
        try container.encode(status, forKey: .status)
        try container.encode(labels, forKey: .labels)
        try container.encode(passwordUpdate, forKey: .passwordUpdate)
        try container.encode(email, forKey: .email)
        try container.encode(phone, forKey: .phone)
        try container.encode(emailVerification, forKey: .emailVerification)
        try container.encode(phoneVerification, forKey: .phoneVerification)
        try container.encode(mfa, forKey: .mfa)
        try container.encode(prefs, forKey: .prefs)
        try container.encode(targets, forKey: .targets)
        try container.encode(accessedAt, forKey: .accessedAt)
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
            password: map["password"] as? String,
            hash: map["hash"] as? String,
            hashOptions: map["hashOptions"] as? [String: AnyCodable],
            registration: map["registration"] as! String,
            status: map["status"] as! Bool,
            labels: map["labels"] as! [String],
            passwordUpdate: map["passwordUpdate"] as! String,
            email: map["email"] as! String,
            phone: map["phone"] as! String,
            emailVerification: map["emailVerification"] as! Bool,
            phoneVerification: map["phoneVerification"] as! Bool,
            mfa: map["mfa"] as! Bool,
            prefs: Preferences.from(map: map["prefs"] as! [String: Any]),
            targets: (map["targets"] as! [[String: Any]]).map { Target.from(map: $0) },
            accessedAt: map["accessedAt"] as! String
        )
    }
}
