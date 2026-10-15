import Foundation
import JSONCodable

/// MFA Recovery Codes
open class MfaRecoveryCodes: Codable {

    enum CodingKeys: String, CodingKey {
        case recoveryCodes = "recoveryCodes"
    }

    /// Recovery codes.
    public let recoveryCodes: [String]

    init(
        recoveryCodes: [String]
    ) {
        self.recoveryCodes = recoveryCodes
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.recoveryCodes = try container.contains(.recoveryCodes) ? container.decode([String].self, forKey: .recoveryCodes) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(recoveryCodes, forKey: .recoveryCodes)
    }

    public func toMap() -> [String: Any] {
        return [
            "recoveryCodes": recoveryCodes as Any
        ]
    }

    public static func from(map: [String: Any]) -> MfaRecoveryCodes {
        let defaults: [String: Any] = ["recoveryCodes": [Any]()]
        let map = defaults.merging(map) { _, new in new }

        return MfaRecoveryCodes(
            recoveryCodes: map["recoveryCodes"] as! [String]
        )
    }
}
