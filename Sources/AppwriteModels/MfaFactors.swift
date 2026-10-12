import Foundation
import JSONCodable

/// MFAFactors
open class MfaFactors: Codable {

    enum CodingKeys: String, CodingKey {
        case totp = "totp"
        case phone = "phone"
        case email = "email"
        case recoveryCode = "recoveryCode"
        case custom = "custom"
    }

    /// Can TOTP be used for MFA challenge for this account.
    public let totp: Bool
    /// Can phone (SMS) be used for MFA challenge for this account.
    public let phone: Bool
    /// Can email be used for MFA challenge for this account.
    public let email: Bool
    /// Can recovery code be used for MFA challenge for this account.
    public let recoveryCode: Bool
    /// Can custom factor be used for MFA challenge for this account.
    public let custom: Bool

    init(
        totp: Bool,
        phone: Bool,
        email: Bool,
        recoveryCode: Bool,
        custom: Bool
    ) {
        self.totp = totp
        self.phone = phone
        self.email = email
        self.recoveryCode = recoveryCode
        self.custom = custom
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.totp = try container.contains(.totp) ? container.decode(Bool.self, forKey: .totp) : false
        self.phone = try container.contains(.phone) ? container.decode(Bool.self, forKey: .phone) : false
        self.email = try container.contains(.email) ? container.decode(Bool.self, forKey: .email) : false
        self.recoveryCode = try container.contains(.recoveryCode) ? container.decode(Bool.self, forKey: .recoveryCode) : false
        self.custom = try container.contains(.custom) ? container.decode(Bool.self, forKey: .custom) : false
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(totp, forKey: .totp)
        try container.encode(phone, forKey: .phone)
        try container.encode(email, forKey: .email)
        try container.encode(recoveryCode, forKey: .recoveryCode)
        try container.encode(custom, forKey: .custom)
    }

    public func toMap() -> [String: Any] {
        return [
            "totp": totp as Any,
            "phone": phone as Any,
            "email": email as Any,
            "recoveryCode": recoveryCode as Any,
            "custom": custom as Any,
        ]
    }

    public static func from(map: [String: Any]) -> MfaFactors {
        let defaults: [String: Any] = [
            "totp": false,
            "phone": false,
            "email": false,
            "recoveryCode": false,
            "custom": false,
        ]
        let map = defaults.merging(map) { _, new in new }

        return MfaFactors(
            totp: map["totp"] as! Bool,
            phone: map["phone"] as! Bool,
            email: map["email"] as! Bool,
            recoveryCode: map["recoveryCode"] as! Bool,
            custom: map["custom"] as! Bool
        )
    }
}
