import Foundation

public enum AuthenticatorProvider: String, Codable {
    case totp = "totp"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
