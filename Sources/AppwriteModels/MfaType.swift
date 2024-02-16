import Foundation
import JSONCodable

/// MFAType
public class MfaType {

    /// Backup codes.
    public let backups: [Any]

    /// Secret token used for TOTP factor.
    public let secret: String

    /// URI for authenticator apps.
    public let uri: String


    init(
        backups: [Any],
        secret: String,
        uri: String
    ) {
        self.backups = backups
        self.secret = secret
        self.uri = uri
    }

    public func toMap() -> [String: Any] {
        return [
            "backups": backups as Any,
            "secret": secret as Any,
            "uri": uri as Any
        ]
    }

    public static func from(map: [String: Any] ) -> MfaType {
        return MfaType(
            backups: map["backups"] as! [Any],
            secret: map["secret"] as! String,
            uri: map["uri"] as! String
        )
    }
}
