import Foundation

public enum ImageGravity: String, CustomStringConvertible {
    case center = "center"
    case topLeft = "top-left"
    case top = "top"
    case topRight = "top-right"
    case `left` = "left"
    case `right` = "right"
    case bottomLeft = "bottom-left"
    case bottom = "bottom"
    case bottomRight = "bottom-right"

    public var description: String {
        return rawValue
    }
}
