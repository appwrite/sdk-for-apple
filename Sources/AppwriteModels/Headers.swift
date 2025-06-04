import Foundation
import JSONCodable

/// Headers
open class Headers: Codable {

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }

    /// Header name.
    public let name: String

    /// Header value.
    public let value: String


    init(
        name: String,
        value: String
    ) {
        self.name = name
        self.value = value
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.value = try container.decode(String.self, forKey: .value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(value, forKey: .value)
    }

    public func toMap() -> [String: Any] {
        return [
            "name": name as Any,
            "value": value as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Headers {
        return Headers(
            name: map["name"] as? String ?? "",
            value: map["value"] as? String ?? ""
        )
    }
}
