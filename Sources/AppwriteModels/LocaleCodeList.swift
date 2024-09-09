import Foundation
import JSONCodable

/// Locale codes list
public class LocaleCodeList {

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
