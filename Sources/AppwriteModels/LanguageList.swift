import Foundation
import JSONCodable

/// Languages List
open class LanguageList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case languages = "languages"
    }

    /// Total number of languages documents that matched your query.
    public let total: Int

    /// List of languages.
    public let languages: [Language]


    init(
        total: Int,
        languages: [Language]
    ) {
        self.total = total
        self.languages = languages
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.languages = try container.decode([Language].self, forKey: .languages)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(languages, forKey: .languages)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "languages": languages.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> LanguageList {
        return LanguageList(
            total: map["total"] as! Int,
            languages: (map["languages"] as! [[String: Any]]).map { Language.from(map: $0) }
        )
    }
}
