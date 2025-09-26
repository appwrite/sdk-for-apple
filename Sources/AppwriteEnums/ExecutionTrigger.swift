import Foundation

public enum ExecutionTrigger: String, CustomStringConvertible {
    case http = "http"
    case schedule = "schedule"
    case event = "event"

    public var description: String {
        return rawValue
    }
}
