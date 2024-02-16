import Foundation

public enum ExecutionMethod: String, Codable {
    case gET = "GET"
    case pOST = "POST"
    case pUT = "PUT"
    case pATCH = "PATCH"
    case dELETE = "DELETE"
    case oPTIONS = "OPTIONS"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
