import Foundation
import JSONCodable

/// AlgoScrypt
open class AlgoScrypt: Codable {

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case costCpu = "costCpu"
        case costMemory = "costMemory"
        case costParallel = "costParallel"
        case length = "length"
    }

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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.type = try container.decode(String.self, forKey: .type)
        self.costCpu = try container.decode(Int.self, forKey: .costCpu)
        self.costMemory = try container.decode(Int.self, forKey: .costMemory)
        self.costParallel = try container.decode(Int.self, forKey: .costParallel)
        self.length = try container.decode(Int.self, forKey: .length)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
        try container.encode(costCpu, forKey: .costCpu)
        try container.encode(costMemory, forKey: .costMemory)
        try container.encode(costParallel, forKey: .costParallel)
        try container.encode(length, forKey: .length)
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
