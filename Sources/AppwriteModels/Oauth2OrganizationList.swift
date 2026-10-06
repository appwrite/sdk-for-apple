import Foundation
import JSONCodable

/// OAuth2 accessible organizations list
open class Oauth2OrganizationList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case organizations = "organizations"
    }

    /// Total number of organizations that matched your query.
    public let total: Int
    /// List of organizations.
    public let organizations: [Oauth2Organization]

    init(
        total: Int,
        organizations: [Oauth2Organization]
    ) {
        self.total = total
        self.organizations = organizations
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.organizations = try container.decode([Oauth2Organization].self, forKey: .organizations)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(organizations, forKey: .organizations)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "organizations": organizations.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Oauth2OrganizationList {
        return Oauth2OrganizationList(
            total: map["total"] as! Int,
            organizations: (map["organizations"] as! [[String: Any]]).map { Oauth2Organization.from(map: $0) }
        )
    }
}
