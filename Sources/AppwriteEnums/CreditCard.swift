import Foundation

public enum CreditCard: String, Codable {
    case americanExpress = "amex"
    case argencard = "argencard"
    case cabal = "cabal"
    case consosud = "censosud"
    case dinersClub = "diners"
    case discover = "discover"
    case elo = "elo"
    case hipercard = "hipercard"
    case jCB = "jcb"
    case mastercard = "mastercard"
    case naranja = "naranja"
    case tarjetaShopping = "targeta-shopping"
    case unionChinaPay = "union-china-pay"
    case visa = "visa"
    case mIR = "mir"
    case maestro = "maestro"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
