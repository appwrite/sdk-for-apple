import Foundation
import JSONCodable

/// Language
open class Language: Codable {

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case code = "code"
        case nativeName = "nativeName"
    }

    /// Language name.
    public let name: String

    /// Language two-character ISO 639-1 codes.
    public let code: String

    /// Language native name.
    public let nativeName: String


    init(
        name: String,
        code: String,
        nativeName: String
    ) {
        self.name = name
        self.code = code
        self.nativeName = nativeName
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.code = try container.decode(String.self, forKey: .code)
        self.nativeName = try container.decode(String.self, forKey: .nativeName)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(code, forKey: .code)
        try container.encode(nativeName, forKey: .nativeName)
    }

    public func toMap() -> [String: Any] {
        return [
            "name": name as Any,
            "code": code as Any,
            "nativeName": nativeName as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Language {
        return Language(
            name: map["name"] as? String ?? "",
            code: map["code"] as? String ?? "",
            nativeName: map["nativeName"] as? String ?? ""
        )
    }
}
