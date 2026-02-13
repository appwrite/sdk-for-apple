import Foundation
import JSONCodable

/// UsageResource
open class UsageResources: Codable {

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
        case amount = "amount"
        case rate = "rate"
        case desc = "desc"
        case resourceId = "resourceId"
    }

    /// Invoice name
    public let name: String
    /// Invoice value
    public let value: Int
    /// Invoice amount
    public let amount: Double
    /// Invoice rate
    public let rate: Double
    /// Invoice description
    public let desc: String
    /// Resource ID
    public let resourceId: String

    init(
        name: String,
        value: Int,
        amount: Double,
        rate: Double,
        desc: String,
        resourceId: String
    ) {
        self.name = name
        self.value = value
        self.amount = amount
        self.rate = rate
        self.desc = desc
        self.resourceId = resourceId
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.value = try container.decode(Int.self, forKey: .value)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.rate = try container.decode(Double.self, forKey: .rate)
        self.desc = try container.decode(String.self, forKey: .desc)
        self.resourceId = try container.decode(String.self, forKey: .resourceId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(value, forKey: .value)
        try container.encode(amount, forKey: .amount)
        try container.encode(rate, forKey: .rate)
        try container.encode(desc, forKey: .desc)
        try container.encode(resourceId, forKey: .resourceId)
    }

    public func toMap() -> [String: Any] {
        return [
            "name": name as Any,
            "value": value as Any,
            "amount": amount as Any,
            "rate": rate as Any,
            "desc": desc as Any,
            "resourceId": resourceId as Any
        ]
    }

    public static func from(map: [String: Any] ) -> UsageResources {
        return UsageResources(
            name: map["name"] as! String,
            value: map["value"] as! Int,
            amount: map["amount"] as! Double,
            rate: map["rate"] as! Double,
            desc: map["desc"] as! String,
            resourceId: map["resourceId"] as! String
        )
    }
}
