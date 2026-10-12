import Foundation
import JSONCodable

/// Passkeys List
open class PasskeyList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case passkeys = "passkeys"
    }

    /// Total number of passkeys that matched your query.
    public let total: Int
    /// List of passkeys.
    public let passkeys: [Passkey]

    init(
        total: Int,
        passkeys: [Passkey]
    ) {
        self.total = total
        self.passkeys = passkeys
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.passkeys = try container.decode([Passkey].self, forKey: .passkeys)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(passkeys, forKey: .passkeys)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "passkeys": passkeys.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> PasskeyList {
        let defaults: [String: Any] = [
            "total": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return PasskeyList(
            total: map["total"] as! Int,
            passkeys: (map["passkeys"] as! [[String: Any]]).map { Passkey.from(map: $0) }
        )
    }
}
