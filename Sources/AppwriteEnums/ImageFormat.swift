import Foundation

public enum ImageFormat: String, Codable {
    case jpg = "jpg"
    case jpeg = "jpeg"
    case gif = "gif"
    case png = "png"
    case webp = "webp"
    case avif = "avif"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
