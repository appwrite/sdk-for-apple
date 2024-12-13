import Foundation

public enum AuthenticationFactor: String, CustomStringConvertible {
    case email = "email"
    case phone = "phone"
    case totp = "totp"
    case recoverycode = "recoverycode"

    public var description: String {
        return rawValue
    }
}
