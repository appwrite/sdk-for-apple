import Foundation
import JSONCodable

/// Country
open class Country: Codable {

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case code = "code"
    }

    /// Country name.
    public let name: String

    /// Country two-character ISO 3166-1 alpha code.
    public let code: String


    init(
        name: String,
        code: String
    ) {
        self.name = name
        self.code = code
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.code = try container.decode(String.self, forKey: .code)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(code, forKey: .code)
    }

    public func toMap() -> [String: Any] {
        return [
            "name": name as Any,
            "code": code as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Country {
        return Country(
            name: map["name"] as? String ?? "",
            code: map["code"] as? String ?? ""
        )
    }
}
