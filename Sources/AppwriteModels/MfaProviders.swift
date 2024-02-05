import Foundation
import JSONCodable

/// MFAProviders
public class MfaProviders {

    /// TOTP
    public let totp: Bool

    /// Phone
    public let phone: Bool

    /// Email
    public let email: Bool


    init(
        totp: Bool,
        phone: Bool,
        email: Bool
    ) {
        self.totp = totp
        self.phone = phone
        self.email = email
    }

    public func toMap() -> [String: Any] {
        return [
            "totp": totp as Any,
            "phone": phone as Any,
            "email": email as Any
        ]
    }

    public static func from(map: [String: Any] ) -> MfaProviders {
        return MfaProviders(
            totp: map["totp"] as! Bool,
            phone: map["phone"] as! Bool,
            email: map["email"] as! Bool
        )
    }
}
