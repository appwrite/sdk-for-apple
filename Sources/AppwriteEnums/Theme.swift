import Foundation

public enum Theme: String, CustomStringConvertible {
    case light = "light"
    case dark = "dark"

    public var description: String {
        return rawValue
    }
}
