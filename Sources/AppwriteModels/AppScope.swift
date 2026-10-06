import Foundation
import JSONCodable

/// AppScope
open class AppScope: Codable {

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case description = "description"
        case type = "type"
        case category = "category"
        case deprecated = "deprecated"
    }

    /// Scope value as requested by apps.
    public let value: String
    /// Human-readable description of what the scope grants.
    public let description: String
    /// What the scope grants access to. One of `account`, `project`, or `organization`. Only `project` and `organization` scopes are installable.
    public let type: String
    /// Scope category, used to group scopes on consent and installation screens.
    public let category: String
    /// Whether the scope is deprecated. Deprecated scopes can still be requested but should not be offered for new grants.
    public let deprecated: Bool

    init(
        value: String,
        description: String,
        type: String,
        category: String,
        deprecated: Bool
    ) {
        self.value = value
        self.description = description
        self.type = type
        self.category = category
        self.deprecated = deprecated
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.value = try container.decode(String.self, forKey: .value)
        self.description = try container.decode(String.self, forKey: .description)
        self.type = try container.decode(String.self, forKey: .type)
        self.category = try container.decode(String.self, forKey: .category)
        self.deprecated = try container.decode(Bool.self, forKey: .deprecated)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(value, forKey: .value)
        try container.encode(description, forKey: .description)
        try container.encode(type, forKey: .type)
        try container.encode(category, forKey: .category)
        try container.encode(deprecated, forKey: .deprecated)
    }

    public func toMap() -> [String: Any] {
        return [
            "value": value as Any,
            "description": description as Any,
            "type": type as Any,
            "category": category as Any,
            "deprecated": deprecated as Any,
        ]
    }

    public static func from(map: [String: Any]) -> AppScope {
        return AppScope(
            value: map["value"] as! String,
            description: map["description"] as! String,
            type: map["type"] as! String,
            category: map["category"] as! String,
            deprecated: map["deprecated"] as! Bool
        )
    }
}
