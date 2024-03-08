import Foundation
import JSONCodable

/// MFAType
public class MfaType {

    /// Secret token used for TOTP factor.
    public let secret: String

    /// URI for authenticator apps.
    public let uri: String


    init(
        secret: String,
        uri: String
    ) {
        self.secret = secret
        self.uri = uri
    }

    public func toMap() -> [String: Any] {
        return [
            "secret": secret as Any,
            "uri": uri as Any
        ]
    }

    public static func from(map: [String: Any] ) -> MfaType {
        return MfaType(
            secret: map["secret"] as! String,
            uri: map["uri"] as! String
        )
    }
}
