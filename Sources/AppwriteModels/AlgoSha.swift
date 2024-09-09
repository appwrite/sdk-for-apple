import Foundation
import JSONCodable

/// AlgoSHA
public class AlgoSha {

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

    public static func from(map: [String: Any] ) -> AlgoSha {
        return AlgoSha(
            type: map["type"] as! String
        )
    }
}
