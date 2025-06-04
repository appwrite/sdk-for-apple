import Foundation
import JSONCodable

/// Preferences
open class Preferences<T : Codable>: Codable {

    enum CodingKeys: String, CodingKey {
        case data
    }

    /// Additional properties
    public let data: T

    init(
        data: T
    ) {
        self.data = data
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.data = try container.decode(T.self, forKey: .data)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(data, forKey: .data)
    }

    public func toMap() -> [String: Any] {
        return [
            "data": try! JSONEncoder().encode(data)
        ]
    }

    public static func from(map: [String: Any] ) -> Preferences {
        return Preferences(
            data: try! JSONDecoder().decode(T.self, from: JSONSerialization.data(withJSONObject: map, options: []))
        )
    }
}
