import Foundation

public enum ImageGravity: String, Codable {
    case center = "center"
    case topLeft = "top-left"
    case top = "top"
    case topRight = "top-right"
    case `left` = "left"
    case `right` = "right"
    case bottomLeft = "bottom-left"
    case bottom = "bottom"
    case bottomRight = "bottom-right"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
