import Foundation
import JSONCodable

/// AlgoPHPass
open class AlgoPhpass: Codable {

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    /// Algo type.
    public let type: String

    init(
        type: String
    ) {
        self.type = type
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.type = try container.decode(String.self, forKey: .type)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
    }

    public func toMap() -> [String: Any] {
        return [
            "type": type as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AlgoPhpass {
        return AlgoPhpass(
            type: map["type"] as! String
        )
    }
}
