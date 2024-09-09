import Foundation
import JSONCodable

/// AlgoBcrypt
public class AlgoBcrypt {

    /// Algo type.
    public let type: String


    init(
        type: String
    ) {
        self.type = type
    }

    public func toMap() -> [String: Any] {
        return [
            "type": type as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AlgoBcrypt {
        return AlgoBcrypt(
            type: map["type"] as! String
        )
    }
}
