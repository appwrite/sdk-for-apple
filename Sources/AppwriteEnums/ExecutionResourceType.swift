import Foundation

public enum ExecutionResourceType: String, Codable, CustomStringConvertible {
    case functions = "functions"
    case sites = "sites"

    public var description: String {
        return rawValue
    }
}
