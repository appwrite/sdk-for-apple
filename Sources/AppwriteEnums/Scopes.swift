import Foundation

public enum Scopes: String, CustomStringConvertible {
    case account = "account"
    case teamsRead = "teams.read"
    case teamsWrite = "teams.write"

    public var description: String {
        return rawValue
    }
}
