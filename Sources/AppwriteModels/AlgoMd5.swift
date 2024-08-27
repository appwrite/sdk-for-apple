import Foundation
import JSONCodable

/// AlgoMD5
public class AlgoMd5 {

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

    public static func from(map: [String: Any] ) -> AlgoMd5 {
        return AlgoMd5(
            type: map["type"] as! String
        )
    }
}
