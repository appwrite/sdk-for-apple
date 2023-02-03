import Foundation
import JSONCodable

/// Preferences
public class Preferences<T : Codable> {

    /// Additional properties
    public let data: T

    init(
        data: T
    ) {
        self.data = data
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
