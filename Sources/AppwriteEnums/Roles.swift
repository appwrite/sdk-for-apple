import Foundation

public enum Roles: String, CustomStringConvertible {
    case admin = "admin"
    case developer = "developer"
    case owner = "owner"

    public var description: String {
        return rawValue
    }
}
