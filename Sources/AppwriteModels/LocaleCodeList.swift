import Foundation
import JSONCodable

/// Locale codes list
open class LocaleCodeList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case localeCodes = "localeCodes"
    }

    /// Total number of localeCodes documents that matched your query.
    public let total: Int

    /// List of localeCodes.
    public let localeCodes: [LocaleCode]


    init(
        total: Int,
        localeCodes: [LocaleCode]
    ) {
        self.total = total
        self.localeCodes = localeCodes
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.localeCodes = try container.decode([LocaleCode].self, forKey: .localeCodes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(localeCodes, forKey: .localeCodes)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "localeCodes": localeCodes.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> LocaleCodeList {
        return LocaleCodeList(
            total: map["total"] as! Int,
            localeCodes: (map["localeCodes"] as! [[String: Any]]).map { LocaleCode.from(map: $0) }
        )
    }
}
