import Foundation
import JSONCodable

/// MFA Recovery Codes
public class MfaRecoveryCodes {

    /// Recovery codes.
    public let recoveryCodes: [Any]



    init(
        recoveryCodes: [Any]
    ) {
        self.recoveryCodes = recoveryCodes
    }

    public func toMap() -> [String: Any] {
        return [
            "recoveryCodes": recoveryCodes as Any
        ]
    }

    public static func from(map: [String: Any] ) -> MfaRecoveryCodes {
        return MfaRecoveryCodes(
            recoveryCodes: map["recoveryCodes"] as! [Any]
        )
    }
}
