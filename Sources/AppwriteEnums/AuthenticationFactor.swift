import Foundation

public enum AuthenticationFactor: String, Codable, CustomStringConvertible {
    case email = "email"
    case phone = "phone"
    case totp = "totp"
    case recoverycode = "recoverycode"
    case custom = "custom"

    public var description: String {
        return rawValue
    }
}
