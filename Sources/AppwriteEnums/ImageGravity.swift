import Foundation

public enum ImageGravity: String, Codable {
    case center = "center"
    case topleft = "top-left"
    case top = "top"
    case topright = "top-right"
    case `left` = "left"
    case `right` = "right"
    case bottomleft = "bottom-left"
    case bottom = "bottom"
    case bottomright = "bottom-right"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
