import Foundation

public enum AuthenticatorType: String, CustomStringConvertible {
    case totp = "totp"

    public var description: String {
        return rawValue
    }
}
