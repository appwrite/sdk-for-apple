import Foundation
import JSONCodable

/// MFAFactors
public class MfaFactors {

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
