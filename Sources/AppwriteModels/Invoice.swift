import Foundation
import JSONCodable

/// Invoice
open class Invoice: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case permissions = "$permissions"
        case teamId = "teamId"
        case aggregationId = "aggregationId"
        case plan = "plan"
        case usage = "usage"
        case amount = "amount"
        case tax = "tax"
        case taxAmount = "taxAmount"
        case vat = "vat"
        case vatAmount = "vatAmount"
        case grossAmount = "grossAmount"
        case creditsUsed = "creditsUsed"
        case currency = "currency"
        case clientSecret = "clientSecret"
        case status = "status"
        case lastError = "lastError"
        case dueAt = "dueAt"
        case from = "from"
        case to = "to"
    }

    /// Invoice ID.
    public let id: String
    /// Invoice creation time in ISO 8601 format.
    public let createdAt: String
    /// Invoice update date in ISO 8601 format.
    public let updatedAt: String
    /// Invoice permissions. [Learn more about permissions](/docs/permissions).
    public let permissions: [String]
    /// Project ID
    public let teamId: String
    /// Aggregation ID
    public let aggregationId: String
    /// Billing plan selected. Can be one of `tier-0`, `tier-1` or `tier-2`.
    public let plan: String
    /// Usage breakdown per resource
    public let usage: [UsageResources]
    /// Invoice Amount
    public let amount: Double
    /// Tax percentage
    public let tax: Double
    /// Tax amount
    public let taxAmount: Double
    /// VAT percentage
    public let vat: Double
    /// VAT amount
    public let vatAmount: Double
    /// Gross amount after vat, tax, and discounts applied.
    public let grossAmount: Double
    /// Credits used.
    public let creditsUsed: Double
    /// Currency the invoice is in
    public let currency: String
    /// Client secret for processing failed payments in front-end
    public let clientSecret: String
    /// Invoice status
    public let status: String
    /// Last payment error associated with the invoice
    public let lastError: String
    /// Invoice due date.
    public let dueAt: String
    /// Beginning date of the invoice
    public let from: String
    /// End date of the invoice
    public let to: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        permissions: [String],
        teamId: String,
        aggregationId: String,
        plan: String,
        usage: [UsageResources],
        amount: Double,
        tax: Double,
        taxAmount: Double,
        vat: Double,
        vatAmount: Double,
        grossAmount: Double,
        creditsUsed: Double,
        currency: String,
        clientSecret: String,
        status: String,
        lastError: String,
        dueAt: String,
        from: String,
        to: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.teamId = teamId
        self.aggregationId = aggregationId
        self.plan = plan
        self.usage = usage
        self.amount = amount
        self.tax = tax
        self.taxAmount = taxAmount
        self.vat = vat
        self.vatAmount = vatAmount
        self.grossAmount = grossAmount
        self.creditsUsed = creditsUsed
        self.currency = currency
        self.clientSecret = clientSecret
        self.status = status
        self.lastError = lastError
        self.dueAt = dueAt
        self.from = from
        self.to = to
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.permissions = try container.decode([String].self, forKey: .permissions)
        self.teamId = try container.decode(String.self, forKey: .teamId)
        self.aggregationId = try container.decode(String.self, forKey: .aggregationId)
        self.plan = try container.decode(String.self, forKey: .plan)
        self.usage = try container.decode([UsageResources].self, forKey: .usage)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.tax = try container.decode(Double.self, forKey: .tax)
        self.taxAmount = try container.decode(Double.self, forKey: .taxAmount)
        self.vat = try container.decode(Double.self, forKey: .vat)
        self.vatAmount = try container.decode(Double.self, forKey: .vatAmount)
        self.grossAmount = try container.decode(Double.self, forKey: .grossAmount)
        self.creditsUsed = try container.decode(Double.self, forKey: .creditsUsed)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.clientSecret = try container.decode(String.self, forKey: .clientSecret)
        self.status = try container.decode(String.self, forKey: .status)
        self.lastError = try container.decode(String.self, forKey: .lastError)
        self.dueAt = try container.decode(String.self, forKey: .dueAt)
        self.from = try container.decode(String.self, forKey: .from)
        self.to = try container.decode(String.self, forKey: .to)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(permissions, forKey: .permissions)
        try container.encode(teamId, forKey: .teamId)
        try container.encode(aggregationId, forKey: .aggregationId)
        try container.encode(plan, forKey: .plan)
        try container.encode(usage, forKey: .usage)
        try container.encode(amount, forKey: .amount)
        try container.encode(tax, forKey: .tax)
        try container.encode(taxAmount, forKey: .taxAmount)
        try container.encode(vat, forKey: .vat)
        try container.encode(vatAmount, forKey: .vatAmount)
        try container.encode(grossAmount, forKey: .grossAmount)
        try container.encode(creditsUsed, forKey: .creditsUsed)
        try container.encode(currency, forKey: .currency)
        try container.encode(clientSecret, forKey: .clientSecret)
        try container.encode(status, forKey: .status)
        try container.encode(lastError, forKey: .lastError)
        try container.encode(dueAt, forKey: .dueAt)
        try container.encode(from, forKey: .from)
        try container.encode(to, forKey: .to)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$permissions": permissions as Any,
            "teamId": teamId as Any,
            "aggregationId": aggregationId as Any,
            "plan": plan as Any,
            "usage": usage.map { $0.toMap() } as Any,
            "amount": amount as Any,
            "tax": tax as Any,
            "taxAmount": taxAmount as Any,
            "vat": vat as Any,
            "vatAmount": vatAmount as Any,
            "grossAmount": grossAmount as Any,
            "creditsUsed": creditsUsed as Any,
            "currency": currency as Any,
            "clientSecret": clientSecret as Any,
            "status": status as Any,
            "lastError": lastError as Any,
            "dueAt": dueAt as Any,
            "from": from as Any,
            "to": to as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Invoice {
        return Invoice(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [String],
            teamId: map["teamId"] as! String,
            aggregationId: map["aggregationId"] as! String,
            plan: map["plan"] as! String,
            usage: (map["usage"] as! [[String: Any]]).map { UsageResources.from(map: $0) },
            amount: map["amount"] as! Double,
            tax: map["tax"] as! Double,
            taxAmount: map["taxAmount"] as! Double,
            vat: map["vat"] as! Double,
            vatAmount: map["vatAmount"] as! Double,
            grossAmount: map["grossAmount"] as! Double,
            creditsUsed: map["creditsUsed"] as! Double,
            currency: map["currency"] as! String,
            clientSecret: map["clientSecret"] as! String,
            status: map["status"] as! String,
            lastError: map["lastError"] as! String,
            dueAt: map["dueAt"] as! String,
            from: map["from"] as! String,
            to: map["to"] as! String
        )
    }
}
