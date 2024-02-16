import Foundation

public enum Type: String, Codable {
    case totp = "totp"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
