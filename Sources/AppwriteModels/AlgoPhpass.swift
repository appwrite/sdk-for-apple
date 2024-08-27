import Foundation
import JSONCodable

/// AlgoPHPass
public class AlgoPhpass {

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

    public static func from(map: [String: Any] ) -> AlgoPhpass {
        return AlgoPhpass(
            type: map["type"] as! String
        )
    }
}
