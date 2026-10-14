import Foundation
import JSONCodable

/// LocaleCode
open class LocaleCode: Codable {

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case name = "name"
    }

    /// Locale codes in [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes)
    public let code: String
    /// Locale name
    public let name: String

    init(
        code: String,
        name: String
    ) {
        self.code = code
        self.name = name
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.code = try container.contains(.code) ? container.decode(String.self, forKey: .code) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(code, forKey: .code)
        try container.encode(name, forKey: .name)
    }

    public func toMap() -> [String: Any] {
        return [
            "code": code as Any,
            "name": name as Any,
        ]
    }

    public static func from(map: [String: Any]) -> LocaleCode {
        let defaults: [String: Any] = [
            "code": "",
            "name": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return LocaleCode(
            code: map["code"] as! String,
            name: map["name"] as! String
        )
    }
}
