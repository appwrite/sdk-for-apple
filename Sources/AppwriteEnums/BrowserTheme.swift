import Foundation

public enum BrowserTheme: String, Codable, CustomStringConvertible {
    case light = "light"
    case dark = "dark"

    public var description: String {
        return rawValue
    }
}
