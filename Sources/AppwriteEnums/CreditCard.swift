import Foundation

public enum CreditCard: String, CustomStringConvertible {
    case americanExpress = "amex"
    case argencard = "argencard"
    case cabal = "cabal"
    case cencosud = "cencosud"
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
    case rupay = "rupay"

    public var description: String {
        return rawValue
    }
}
