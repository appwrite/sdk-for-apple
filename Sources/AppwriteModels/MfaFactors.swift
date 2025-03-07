import Foundation
import JSONCodable

/// MFAFactors
open class MfaFactors: Codable {

    enum CodingKeys: String, CodingKey {
        case totp = "totp"
        case phone = "phone"
        case email = "email"
        case recoveryCode = "recoveryCode"
    }

    /// Can TOTP be used for MFA challenge for this account.
    public let totp: Bool

    /// Can phone (SMS) be used for MFA challenge for this account.
    public let phone: Bool

    /// Can email be used for MFA challenge for this account.
    public let email: Bool

    /// Can recovery code be used for MFA challenge for this account.
    public let recoveryCode: Bool


    init(
        totp: Bool,
        phone: Bool,
        email: Bool,
        recoveryCode: Bool
    ) {
        self.totp = totp
        self.phone = phone
        self.email = email
        self.recoveryCode = recoveryCode
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.totp = try container.decode(Bool.self, forKey: .totp)
        self.phone = try container.decode(Bool.self, forKey: .phone)
        self.email = try container.decode(Bool.self, forKey: .email)
        self.recoveryCode = try container.decode(Bool.self, forKey: .recoveryCode)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(totp, forKey: .totp)
        try container.encode(phone, forKey: .phone)
        try container.encode(email, forKey: .email)
        try container.encode(recoveryCode, forKey: .recoveryCode)
    }

    public func toMap() -> [String: Any] {
        return [
            "totp": totp as Any,
            "phone": phone as Any,
            "email": email as Any,
            "recoveryCode": recoveryCode as Any
        ]
    }

    public static func from(map: [String: Any] ) -> MfaFactors {
        return MfaFactors(
            totp: map["totp"] as! Bool,
            phone: map["phone"] as! Bool,
            email: map["email"] as! Bool,
            recoveryCode: map["recoveryCode"] as! Bool
        )
    }
}
