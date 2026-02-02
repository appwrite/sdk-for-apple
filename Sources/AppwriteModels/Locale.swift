import Foundation
import JSONCodable

/// Locale
open class Locale: Codable {

    enum CodingKeys: String, CodingKey {
        case ip = "ip"
        case countryCode = "countryCode"
        case country = "country"
        case continentCode = "continentCode"
        case continent = "continent"
        case eu = "eu"
        case currency = "currency"
    }

    /// User IP address.
    public let ip: String
    /// Country code in [ISO 3166-1](http://en.wikipedia.org/wiki/ISO_3166-1) two-character format
    public let countryCode: String
    /// Country name. This field support localization.
    public let country: String
    /// Continent code. A two character continent code &quot;AF&quot; for Africa, &quot;AN&quot; for Antarctica, &quot;AS&quot; for Asia, &quot;EU&quot; for Europe, &quot;NA&quot; for North America, &quot;OC&quot; for Oceania, and &quot;SA&quot; for South America.
    public let continentCode: String
    /// Continent name. This field support localization.
    public let continent: String
    /// True if country is part of the European Union.
    public let eu: Bool
    /// Currency code in [ISO 4217-1](http://en.wikipedia.org/wiki/ISO_4217) three-character format
    public let currency: String

    init(
        ip: String,
        countryCode: String,
        country: String,
        continentCode: String,
        continent: String,
        eu: Bool,
        currency: String
    ) {
        self.ip = ip
        self.countryCode = countryCode
        self.country = country
        self.continentCode = continentCode
        self.continent = continent
        self.eu = eu
        self.currency = currency
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.ip = try container.decode(String.self, forKey: .ip)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.country = try container.decode(String.self, forKey: .country)
        self.continentCode = try container.decode(String.self, forKey: .continentCode)
        self.continent = try container.decode(String.self, forKey: .continent)
        self.eu = try container.decode(Bool.self, forKey: .eu)
        self.currency = try container.decode(String.self, forKey: .currency)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(ip, forKey: .ip)
        try container.encode(countryCode, forKey: .countryCode)
        try container.encode(country, forKey: .country)
        try container.encode(continentCode, forKey: .continentCode)
        try container.encode(continent, forKey: .continent)
        try container.encode(eu, forKey: .eu)
        try container.encode(currency, forKey: .currency)
    }

    public func toMap() -> [String: Any] {
        return [
            "ip": ip as Any,
            "countryCode": countryCode as Any,
            "country": country as Any,
            "continentCode": continentCode as Any,
            "continent": continent as Any,
            "eu": eu as Any,
            "currency": currency as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Locale {
        return Locale(
            ip: map["ip"] as! String,
            countryCode: map["countryCode"] as! String,
            country: map["country"] as! String,
            continentCode: map["continentCode"] as! String,
            continent: map["continent"] as! String,
            eu: map["eu"] as! Bool,
            currency: map["currency"] as! String
        )
    }
}
