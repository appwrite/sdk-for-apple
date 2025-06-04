import Foundation
import JSONCodable

/// AlgoScryptModified
open class AlgoScryptModified: Codable {

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case salt = "salt"
        case saltSeparator = "saltSeparator"
        case signerKey = "signerKey"
    }

    /// Algo type.
    public let type: String

    /// Salt used to compute hash.
    public let salt: String

    /// Separator used to compute hash.
    public let saltSeparator: String

    /// Key used to compute hash.
    public let signerKey: String


    init(
        type: String,
        salt: String,
        saltSeparator: String,
        signerKey: String
    ) {
        self.type = type
        self.salt = salt
        self.saltSeparator = saltSeparator
        self.signerKey = signerKey
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.type = try container.decode(String.self, forKey: .type)
        self.salt = try container.decode(String.self, forKey: .salt)
        self.saltSeparator = try container.decode(String.self, forKey: .saltSeparator)
        self.signerKey = try container.decode(String.self, forKey: .signerKey)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
        try container.encode(salt, forKey: .salt)
        try container.encode(saltSeparator, forKey: .saltSeparator)
        try container.encode(signerKey, forKey: .signerKey)
    }

    public func toMap() -> [String: Any] {
        return [
            "type": type as Any,
            "salt": salt as Any,
            "saltSeparator": saltSeparator as Any,
            "signerKey": signerKey as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AlgoScryptModified {
        return AlgoScryptModified(
            type: map["type"] as! String,
            salt: map["salt"] as! String,
            saltSeparator: map["saltSeparator"] as! String,
            signerKey: map["signerKey"] as! String
        )
    }
}
