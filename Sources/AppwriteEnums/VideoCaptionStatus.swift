import Foundation

public enum VideoCaptionStatus: String, Codable, CustomStringConvertible {
    case pending = "pending"
    case started = "started"
    case ready = "ready"
    case error = "error"
    case aborted = "aborted"

    public var description: String {
        return rawValue
    }
}
