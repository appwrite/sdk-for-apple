import Foundation
import JSONCodable

/// Currency
open class Currency: Codable {

    enum CodingKeys: String, CodingKey {
        case symbol = "symbol"
        case name = "name"
        case symbolNative = "symbolNative"
        case decimalDigits = "decimalDigits"
        case rounding = "rounding"
        case code = "code"
        case namePlural = "namePlural"
    }

    /// Currency symbol.
    public let symbol: String
    /// Currency name.
    public let name: String
    /// Currency native symbol.
    public let symbolNative: String
    /// Number of decimal digits.
    public let decimalDigits: Int
    /// Currency digit rounding.
    public let rounding: Double
    /// Currency code in [ISO 4217-1](http://en.wikipedia.org/wiki/ISO_4217) three-character format.
    public let code: String
    /// Currency plural name
    public let namePlural: String

    init(
        symbol: String,
        name: String,
        symbolNative: String,
        decimalDigits: Int,
        rounding: Double,
        code: String,
        namePlural: String
    ) {
        self.symbol = symbol
        self.name = name
        self.symbolNative = symbolNative
        self.decimalDigits = decimalDigits
        self.rounding = rounding
        self.code = code
        self.namePlural = namePlural
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.name = try container.decode(String.self, forKey: .name)
        self.symbolNative = try container.decode(String.self, forKey: .symbolNative)
        self.decimalDigits = try container.decode(Int.self, forKey: .decimalDigits)
        self.rounding = try container.decode(Double.self, forKey: .rounding)
        self.code = try container.decode(String.self, forKey: .code)
        self.namePlural = try container.decode(String.self, forKey: .namePlural)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(symbol, forKey: .symbol)
        try container.encode(name, forKey: .name)
        try container.encode(symbolNative, forKey: .symbolNative)
        try container.encode(decimalDigits, forKey: .decimalDigits)
        try container.encode(rounding, forKey: .rounding)
        try container.encode(code, forKey: .code)
        try container.encode(namePlural, forKey: .namePlural)
    }

    public func toMap() -> [String: Any] {
        return [
            "symbol": symbol as Any,
            "name": name as Any,
            "symbolNative": symbolNative as Any,
            "decimalDigits": decimalDigits as Any,
            "rounding": rounding as Any,
            "code": code as Any,
            "namePlural": namePlural as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Currency {
        return Currency(
            symbol: map["symbol"] as! String,
            name: map["name"] as! String,
            symbolNative: map["symbolNative"] as! String,
            decimalDigits: map["decimalDigits"] as! Int,
            rounding: map["rounding"] as! Double,
            code: map["code"] as! String,
            namePlural: map["namePlural"] as! String
        )
    }
}
