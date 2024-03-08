import Foundation

public enum Browser: String, Codable {
    case avantBrowser = "aa"
    case androidWebViewBeta = "an"
    case googleChrome = "ch"
    case googleChromeIOS = "ci"
    case googleChromeMobile = "cm"
    case chromium = "cr"
    case mozillaFirefox = "ff"
    case safari = "sf"
    case mobileSafari = "mf"
    case microsoftEdge = "ps"
    case microsoftEdgeIOS = "oi"
    case operaMini = "om"
    case opera = "op"
    case operaNext = "on"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
