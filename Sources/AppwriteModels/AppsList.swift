import Foundation
import JSONCodable

/// Apps list
open class AppsList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case apps = "apps"
    }

    /// Total number of apps that matched your query.
    public let total: Int
    /// List of apps.
    public let apps: [App]

    init(
        total: Int,
        apps: [App]
    ) {
        self.total = total
        self.apps = apps
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.apps = try container.decode([App].self, forKey: .apps)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(apps, forKey: .apps)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "apps": apps.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AppsList {
        return AppsList(
            total: map["total"] as! Int,
            apps: (map["apps"] as! [[String: Any]]).map { App.from(map: $0) }
        )
    }
}
