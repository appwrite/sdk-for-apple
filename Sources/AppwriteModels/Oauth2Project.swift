import Foundation
import JSONCodable

/// OAuth2 Project
open class Oauth2Project: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case region = "region"
        case endpoint = "endpoint"
    }

    /// Project ID.
    public let id: String
    /// Region ID the project is deployed in.
    public let region: String
    /// API endpoint of the region the project is deployed in. Empty when the region has no public hostname configured.
    public let endpoint: String

    init(
        id: String,
        region: String,
        endpoint: String
    ) {
        self.id = id
        self.region = region
        self.endpoint = endpoint
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.region = try container.contains(.region) ? container.decode(String.self, forKey: .region) : ""
        self.endpoint = try container.contains(.endpoint) ? container.decode(String.self, forKey: .endpoint) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(region, forKey: .region)
        try container.encode(endpoint, forKey: .endpoint)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "region": region as Any,
            "endpoint": endpoint as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Oauth2Project {
        let defaults: [String: Any] = [
            "$id": "",
            "region": "",
            "endpoint": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return Oauth2Project(
            id: map["$id"] as! String,
            region: map["region"] as! String,
            endpoint: map["endpoint"] as! String
        )
    }
}
