import Foundation

public enum VideoRenditionStatus: String, Codable, CustomStringConvertible {
    case pending = "pending"
    case started = "started"
    case ended = "ended"
    case ready = "ready"
    case error = "error"
    case aborted = "aborted"

    public var description: String {
        return rawValue
    }
}
