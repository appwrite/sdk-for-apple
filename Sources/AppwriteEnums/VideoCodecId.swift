import Foundation

public enum VideoCodecId: String, Codable, CustomStringConvertible {
    case h264 = "h264"
    case hevc = "hevc"
    case vp9 = "vp9"

    public var description: String {
        return rawValue
    }
}
