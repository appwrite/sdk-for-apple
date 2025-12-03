import Foundation

public enum Output: String, CustomStringConvertible {
    case jpg = "jpg"
    case jpeg = "jpeg"
    case png = "png"
    case webp = "webp"
    case heic = "heic"
    case avif = "avif"
    case gif = "gif"

    public var description: String {
        return rawValue
    }
}
