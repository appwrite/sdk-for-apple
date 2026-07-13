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
        case city = "city"
        case timeZone = "timeZone"
        case postalCode = "postalCode"
        case latitude = "latitude"
        case longitude = "longitude"
        case autonomousSystemNumber = "autonomousSystemNumber"
        case autonomousSystemOrganization = "autonomousSystemOrganization"
        case isp = "isp"
        case connectionType = "connectionType"
        case connectionUsageType = "connectionUsageType"
        case connectionOrganization = "connectionOrganization"
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
    /// City
    public let city: String?
    /// Name of timezone
    public let timeZone: String?
    /// Postal code
    public let postalCode: String?
    /// Latitude
    public let latitude: Double?
    /// Longitude
    public let longitude: Double?
    /// Autonomous System Number (ASN) of the IP
    public let autonomousSystemNumber: String?
    /// Organization that owns the ASN
    public let autonomousSystemOrganization: String?
    /// Internet service provider of the IP
    public let isp: String?
    /// Connection type of the IP (e.g. cable, cellular, corporate)
    public let connectionType: String?
    /// User type classification of the IP (e.g. residential, business, hosting)
    public let connectionUsageType: String?
    /// Registered organization of the IP
    public let connectionOrganization: String?

    init(
        ip: String,
        countryCode: String,
        country: String,
        continentCode: String,
        continent: String,
        eu: Bool,
        currency: String,
        city: String?,
        timeZone: String?,
        postalCode: String?,
        latitude: Double?,
        longitude: Double?,
        autonomousSystemNumber: String?,
        autonomousSystemOrganization: String?,
        isp: String?,
        connectionType: String?,
        connectionUsageType: String?,
        connectionOrganization: String?
    ) {
        self.ip = ip
        self.countryCode = countryCode
        self.country = country
        self.continentCode = continentCode
        self.continent = continent
        self.eu = eu
        self.currency = currency
        self.city = city
        self.timeZone = timeZone
        self.postalCode = postalCode
        self.latitude = latitude
        self.longitude = longitude
        self.autonomousSystemNumber = autonomousSystemNumber
        self.autonomousSystemOrganization = autonomousSystemOrganization
        self.isp = isp
        self.connectionType = connectionType
        self.connectionUsageType = connectionUsageType
        self.connectionOrganization = connectionOrganization
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
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.timeZone = try container.decodeIfPresent(String.self, forKey: .timeZone)
        self.postalCode = try container.decodeIfPresent(String.self, forKey: .postalCode)
        self.latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        self.longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)
        self.autonomousSystemNumber = try container.decodeIfPresent(String.self, forKey: .autonomousSystemNumber)
        self.autonomousSystemOrganization = try container.decodeIfPresent(String.self, forKey: .autonomousSystemOrganization)
        self.isp = try container.decodeIfPresent(String.self, forKey: .isp)
        self.connectionType = try container.decodeIfPresent(String.self, forKey: .connectionType)
        self.connectionUsageType = try container.decodeIfPresent(String.self, forKey: .connectionUsageType)
        self.connectionOrganization = try container.decodeIfPresent(String.self, forKey: .connectionOrganization)
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
        try container.encodeIfPresent(city, forKey: .city)
        try container.encodeIfPresent(timeZone, forKey: .timeZone)
        try container.encodeIfPresent(postalCode, forKey: .postalCode)
        try container.encodeIfPresent(latitude, forKey: .latitude)
        try container.encodeIfPresent(longitude, forKey: .longitude)
        try container.encodeIfPresent(autonomousSystemNumber, forKey: .autonomousSystemNumber)
        try container.encodeIfPresent(autonomousSystemOrganization, forKey: .autonomousSystemOrganization)
        try container.encodeIfPresent(isp, forKey: .isp)
        try container.encodeIfPresent(connectionType, forKey: .connectionType)
        try container.encodeIfPresent(connectionUsageType, forKey: .connectionUsageType)
        try container.encodeIfPresent(connectionOrganization, forKey: .connectionOrganization)
    }

    public func toMap() -> [String: Any] {
        return [
            "ip": ip as Any,
            "countryCode": countryCode as Any,
            "country": country as Any,
            "continentCode": continentCode as Any,
            "continent": continent as Any,
            "eu": eu as Any,
            "currency": currency as Any,
            "city": city as Any,
            "timeZone": timeZone as Any,
            "postalCode": postalCode as Any,
            "latitude": latitude as Any,
            "longitude": longitude as Any,
            "autonomousSystemNumber": autonomousSystemNumber as Any,
            "autonomousSystemOrganization": autonomousSystemOrganization as Any,
            "isp": isp as Any,
            "connectionType": connectionType as Any,
            "connectionUsageType": connectionUsageType as Any,
            "connectionOrganization": connectionOrganization as Any
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
            currency: map["currency"] as! String,
            city: map["city"] as? String,
            timeZone: map["timeZone"] as? String,
            postalCode: map["postalCode"] as? String,
            latitude: map["latitude"] as? Double,
            longitude: map["longitude"] as? Double,
            autonomousSystemNumber: map["autonomousSystemNumber"] as? String,
            autonomousSystemOrganization: map["autonomousSystemOrganization"] as? String,
            isp: map["isp"] as? String,
            connectionType: map["connectionType"] as? String,
            connectionUsageType: map["connectionUsageType"] as? String,
            connectionOrganization: map["connectionOrganization"] as? String
        )
    }
}
