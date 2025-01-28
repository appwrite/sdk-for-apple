import Foundation

public enum ImageFormat: String, CustomStringConvertible {
    case jpg = "jpg"
    case jpeg = "jpeg"
    case gif = "gif"
    case png = "png"
    case webp = "webp"
    case heic = "heic"
    case avif = "avif"

    public var description: String {
        return rawValue
    }
}
