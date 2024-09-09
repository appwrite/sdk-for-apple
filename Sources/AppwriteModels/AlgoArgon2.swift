import Foundation
import JSONCodable

/// AlgoArgon2
public class AlgoArgon2 {

    /// Algo type.
    public let type: String


    /// Memory used to compute hash.
    public let memoryCost: Int


    /// Amount of time consumed to compute hash
    public let timeCost: Int


    /// Number of threads used to compute hash.
    public let threads: Int



    init(
        type: String,
        memoryCost: Int,
        timeCost: Int,
        threads: Int
    ) {
        self.type = type
        self.memoryCost = memoryCost
        self.timeCost = timeCost
        self.threads = threads
    }

    public func toMap() -> [String: Any] {
        return [
            "type": type as Any,
            "memoryCost": memoryCost as Any,
            "timeCost": timeCost as Any,
            "threads": threads as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AlgoArgon2 {
        return AlgoArgon2(
            type: map["type"] as! String,
            memoryCost: map["memoryCost"] as! Int,
            timeCost: map["timeCost"] as! Int,
            threads: map["threads"] as! Int
        )
    }
}
