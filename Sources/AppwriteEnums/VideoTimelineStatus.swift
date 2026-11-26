import Foundation

public enum VideoTimelineStatus: String, Codable, CustomStringConvertible {
    case pending = "pending"
    case started = "started"
    case ready = "ready"
    case skipped = "skipped"
    case error = "error"

    public var description: String {
        return rawValue
    }
}
