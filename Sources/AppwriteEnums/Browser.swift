import Foundation

public enum Browser: String, CustomStringConvertible {
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

    public var description: String {
        return rawValue
    }
}
