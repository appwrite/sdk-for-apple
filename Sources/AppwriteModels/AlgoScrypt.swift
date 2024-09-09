import Foundation
import JSONCodable

/// AlgoScrypt
public class AlgoScrypt {

    /// Algo type.
    public let type: String

    /// CPU complexity of computed hash.
    public let costCpu: Int

    /// Memory complexity of computed hash.
    public let costMemory: Int

    /// Parallelization of computed hash.
    public let costParallel: Int

    /// Length used to compute hash.
    public let length: Int


    init(
        type: String,
        costCpu: Int,
        costMemory: Int,
        costParallel: Int,
        length: Int
    ) {
        self.type = type
        self.costCpu = costCpu
        self.costMemory = costMemory
        self.costParallel = costParallel
        self.length = length
    }

    public func toMap() -> [String: Any] {
        return [
            "type": type as Any,
            "costCpu": costCpu as Any,
            "costMemory": costMemory as Any,
            "costParallel": costParallel as Any,
            "length": length as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AlgoScrypt {
        return AlgoScrypt(
            type: map["type"] as! String,
            costCpu: map["costCpu"] as! Int,
            costMemory: map["costMemory"] as! Int,
            costParallel: map["costParallel"] as! Int,
            length: map["length"] as! Int
        )
    }
}
