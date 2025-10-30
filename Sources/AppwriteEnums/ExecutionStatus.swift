import Foundation

public enum ExecutionStatus: String, CustomStringConvertible {
    case waiting = "waiting"
    case processing = "processing"
    case completed = "completed"
    case failed = "failed"
    case scheduled = "scheduled"

    public var description: String {
        return rawValue
    }
}
