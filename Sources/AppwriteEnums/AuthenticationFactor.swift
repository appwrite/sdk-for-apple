import Foundation

public enum AuthenticationFactor: String, Codable {
    case totp = "totp"
    case phone = "phone"
    case email = "email"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
