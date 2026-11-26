import Foundation

public enum VideoOutput: String, Codable, CustomStringConvertible {
    case hls = "hls"
    case dash = "dash"
    case cmaf = "cmaf"

    public var description: String {
        return rawValue
    }
}
