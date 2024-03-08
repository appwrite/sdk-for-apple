import Foundation

public enum AuthenticationFactor: String, Codable {
    case email = "email"
    case phone = "phone"
    case totp = "totp"
    case recoverycode = "recoverycode"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
