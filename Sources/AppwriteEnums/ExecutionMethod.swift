import Foundation

public enum ExecutionMethod: String, CustomStringConvertible {
    case gET = "GET"
    case pOST = "POST"
    case pUT = "PUT"
    case pATCH = "PATCH"
    case dELETE = "DELETE"
    case oPTIONS = "OPTIONS"

    public var description: String {
        return rawValue
    }
}
