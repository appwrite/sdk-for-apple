import Foundation
import JSONCodable

/// paymentMethod
open class PaymentMethod: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case permissions = "$permissions"
        case providerMethodId = "providerMethodId"
        case clientSecret = "clientSecret"
        case providerUserId = "providerUserId"
        case userId = "userId"
        case expiryMonth = "expiryMonth"
        case expiryYear = "expiryYear"
        case last4 = "last4"
        case brand = "brand"
        case name = "name"
        case mandateId = "mandateId"
        case country = "country"
        case state = "state"
        case lastError = "lastError"
        case `default` = "default"
        case expired = "expired"
        case failed = "failed"
    }

    /// Payment Method ID.
    public let id: String
    /// Payment method creation time in ISO 8601 format.
    public let createdAt: String
    /// Payment method update date in ISO 8601 format.
    public let updatedAt: String
    /// Payment method permissions. [Learn more about permissions](/docs/permissions).
    public let permissions: [String]
    /// Payment method ID from the payment provider
    public let providerMethodId: String
    /// Client secret hash for payment setup
    public let clientSecret: String
    /// User ID from the payment provider.
    public let providerUserId: String
    /// ID of the Team.
    public let userId: String
    /// Expiry month of the payment method.
    public let expiryMonth: Int
    /// Expiry year of the payment method.
    public let expiryYear: Int
    /// Last 4 digit of the payment method
    public let last4: String
    /// Payment method brand
    public let brand: String
    /// Name of the owner
    public let name: String
    /// Mandate ID of the payment method
    public let mandateId: String
    /// Country of the payment method
    public let country: String
    /// State of the payment method
    public let state: String
    /// Last payment error associated with the payment method.
    public let lastError: String
    /// True when it&#039;s the default payment method.
    public let `default`: Bool
    /// True when payment method has expired.
    public let expired: Bool
    /// True when payment method has failed to process multiple times.
    public let failed: Bool

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        permissions: [String],
        providerMethodId: String,
        clientSecret: String,
        providerUserId: String,
        userId: String,
        expiryMonth: Int,
        expiryYear: Int,
        last4: String,
        brand: String,
        name: String,
        mandateId: String,
        country: String,
        state: String,
        lastError: String,
        `default`: Bool,
        expired: Bool,
        failed: Bool
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.providerMethodId = providerMethodId
        self.clientSecret = clientSecret
        self.providerUserId = providerUserId
        self.userId = userId
        self.expiryMonth = expiryMonth
        self.expiryYear = expiryYear
        self.last4 = last4
        self.brand = brand
        self.name = name
        self.mandateId = mandateId
        self.country = country
        self.state = state
        self.lastError = lastError
        self.`default` = `default`
        self.expired = expired
        self.failed = failed
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.permissions = try container.decode([String].self, forKey: .permissions)
        self.providerMethodId = try container.decode(String.self, forKey: .providerMethodId)
        self.clientSecret = try container.decode(String.self, forKey: .clientSecret)
        self.providerUserId = try container.decode(String.self, forKey: .providerUserId)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.expiryMonth = try container.decode(Int.self, forKey: .expiryMonth)
        self.expiryYear = try container.decode(Int.self, forKey: .expiryYear)
        self.last4 = try container.decode(String.self, forKey: .last4)
        self.brand = try container.decode(String.self, forKey: .brand)
        self.name = try container.decode(String.self, forKey: .name)
        self.mandateId = try container.decode(String.self, forKey: .mandateId)
        self.country = try container.decode(String.self, forKey: .country)
        self.state = try container.decode(String.self, forKey: .state)
        self.lastError = try container.decode(String.self, forKey: .lastError)
        self.`default` = try container.decode(Bool.self, forKey: .`default`)
        self.expired = try container.decode(Bool.self, forKey: .expired)
        self.failed = try container.decode(Bool.self, forKey: .failed)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(permissions, forKey: .permissions)
        try container.encode(providerMethodId, forKey: .providerMethodId)
        try container.encode(clientSecret, forKey: .clientSecret)
        try container.encode(providerUserId, forKey: .providerUserId)
        try container.encode(userId, forKey: .userId)
        try container.encode(expiryMonth, forKey: .expiryMonth)
        try container.encode(expiryYear, forKey: .expiryYear)
        try container.encode(last4, forKey: .last4)
        try container.encode(brand, forKey: .brand)
        try container.encode(name, forKey: .name)
        try container.encode(mandateId, forKey: .mandateId)
        try container.encode(country, forKey: .country)
        try container.encode(state, forKey: .state)
        try container.encode(lastError, forKey: .lastError)
        try container.encode(`default`, forKey: .`default`)
        try container.encode(expired, forKey: .expired)
        try container.encode(failed, forKey: .failed)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$permissions": permissions as Any,
            "providerMethodId": providerMethodId as Any,
            "clientSecret": clientSecret as Any,
            "providerUserId": providerUserId as Any,
            "userId": userId as Any,
            "expiryMonth": expiryMonth as Any,
            "expiryYear": expiryYear as Any,
            "last4": last4 as Any,
            "brand": brand as Any,
            "name": name as Any,
            "mandateId": mandateId as Any,
            "country": country as Any,
            "state": state as Any,
            "lastError": lastError as Any,
            "default": `default` as Any,
            "expired": expired as Any,
            "failed": failed as Any
        ]
    }

    public static func from(map: [String: Any] ) -> PaymentMethod {
        return PaymentMethod(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [String],
            providerMethodId: map["providerMethodId"] as! String,
            clientSecret: map["clientSecret"] as! String,
            providerUserId: map["providerUserId"] as! String,
            userId: map["userId"] as! String,
            expiryMonth: map["expiryMonth"] as! Int,
            expiryYear: map["expiryYear"] as! Int,
            last4: map["last4"] as! String,
            brand: map["brand"] as! String,
            name: map["name"] as! String,
            mandateId: map["mandateId"] as! String,
            country: map["country"] as! String,
            state: map["state"] as! String,
            lastError: map["lastError"] as! String,
            default: map["default"] as! Bool,
            expired: map["expired"] as! Bool,
            failed: map["failed"] as! Bool
        )
    }
}
