import Foundation

public enum ExecutionTrigger: String, Codable, CustomStringConvertible {
    case http = "http"
    case schedule = "schedule"
    case event = "event"
    case email = "email"

    public var description: String {
        return rawValue
    }
}
