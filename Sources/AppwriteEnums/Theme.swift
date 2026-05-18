import Foundation

public enum Theme: String, Codable, CustomStringConvertible {
    case light = "light"
    case dark = "dark"

    public var description: String {
        return rawValue
    }
}
