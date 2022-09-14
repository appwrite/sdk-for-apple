
/// Languages List
public class LanguageList {

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

    public static func from(map: [String: Any]) -> LanguageList {
        return LanguageList(
            total: map["total"] as! Int,
            languages: (map["languages"] as! [[String: Any]]).map { Language.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "languages": languages.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                    
}
