import Foundation

public enum IdTokenProvider: String, Codable, CustomStringConvertible {
    case apple = "apple"
    case google = "google"

    public var description: String {
        return rawValue
    }
}
