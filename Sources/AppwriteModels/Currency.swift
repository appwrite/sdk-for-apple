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

        self.symbol = try container.contains(.symbol) ? container.decode(String.self, forKey: .symbol) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.symbolNative = try container.contains(.symbolNative) ? container.decode(String.self, forKey: .symbolNative) : ""
        self.decimalDigits = try container.contains(.decimalDigits) ? container.decode(Int.self, forKey: .decimalDigits) : 0
        self.rounding = try container.contains(.rounding) ? container.decode(Double.self, forKey: .rounding) : 0
        self.code = try container.contains(.code) ? container.decode(String.self, forKey: .code) : ""
        self.namePlural = try container.contains(.namePlural) ? container.decode(String.self, forKey: .namePlural) : ""
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
            "namePlural": namePlural as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Currency {
        let defaults: [String: Any] = [
            "symbol": "",
            "name": "",
            "symbolNative": "",
            "decimalDigits": 0,
            "rounding": 0.0,
            "code": "",
            "namePlural": "",
        ]
        let map = defaults.merging(map) { _, new in new }

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
