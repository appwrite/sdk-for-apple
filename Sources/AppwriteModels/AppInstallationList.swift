import Foundation
import JSONCodable

/// App installations list
open class AppInstallationList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case installations = "installations"
    }

    /// Total number of installations that matched your query.
    public let total: Int
    /// List of installations.
    public let installations: [AppInstallation]

    init(
        total: Int,
        installations: [AppInstallation]
    ) {
        self.total = total
        self.installations = installations
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.installations = try container.decode([AppInstallation].self, forKey: .installations)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(installations, forKey: .installations)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "installations": installations.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> AppInstallationList {
        return AppInstallationList(
            total: map["total"] as! Int,
            installations: (map["installations"] as! [[String: Any]]).map { AppInstallation.from(map: $0) }
        )
    }
}
