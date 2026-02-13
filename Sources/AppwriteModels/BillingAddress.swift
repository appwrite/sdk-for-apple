import Foundation
import JSONCodable

/// BillingAddress
open class BillingAddress: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case userId = "userId"
        case streetAddress = "streetAddress"
        case addressLine2 = "addressLine2"
        case country = "country"
        case city = "city"
        case state = "state"
        case postalCode = "postalCode"
    }

    /// Region ID
    public let id: String
    /// User ID
    public let userId: String
    /// Street address
    public let streetAddress: String
    /// Address line 2
    public let addressLine2: String
    /// Address country
    public let country: String
    /// city
    public let city: String
    /// state
    public let state: String
    /// postal code
    public let postalCode: String

    init(
        id: String,
        userId: String,
        streetAddress: String,
        addressLine2: String,
        country: String,
        city: String,
        state: String,
        postalCode: String
    ) {
        self.id = id
        self.userId = userId
        self.streetAddress = streetAddress
        self.addressLine2 = addressLine2
        self.country = country
        self.city = city
        self.state = state
        self.postalCode = postalCode
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.streetAddress = try container.decode(String.self, forKey: .streetAddress)
        self.addressLine2 = try container.decode(String.self, forKey: .addressLine2)
        self.country = try container.decode(String.self, forKey: .country)
        self.city = try container.decode(String.self, forKey: .city)
        self.state = try container.decode(String.self, forKey: .state)
        self.postalCode = try container.decode(String.self, forKey: .postalCode)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(userId, forKey: .userId)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(addressLine2, forKey: .addressLine2)
        try container.encode(country, forKey: .country)
        try container.encode(city, forKey: .city)
        try container.encode(state, forKey: .state)
        try container.encode(postalCode, forKey: .postalCode)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "userId": userId as Any,
            "streetAddress": streetAddress as Any,
            "addressLine2": addressLine2 as Any,
            "country": country as Any,
            "city": city as Any,
            "state": state as Any,
            "postalCode": postalCode as Any
        ]
    }

    public static func from(map: [String: Any] ) -> BillingAddress {
        return BillingAddress(
            id: map["$id"] as! String,
            userId: map["userId"] as! String,
            streetAddress: map["streetAddress"] as! String,
            addressLine2: map["addressLine2"] as! String,
            country: map["country"] as! String,
            city: map["city"] as! String,
            state: map["state"] as! String,
            postalCode: map["postalCode"] as! String
        )
    }
}
