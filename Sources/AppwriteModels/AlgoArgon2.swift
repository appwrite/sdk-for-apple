import Foundation
import JSONCodable

/// AlgoArgon2
open class AlgoArgon2: Codable {

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case memoryCost = "memoryCost"
        case timeCost = "timeCost"
        case threads = "threads"
    }

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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.type = try container.decode(String.self, forKey: .type)
        self.memoryCost = try container.decode(Int.self, forKey: .memoryCost)
        self.timeCost = try container.decode(Int.self, forKey: .timeCost)
        self.threads = try container.decode(Int.self, forKey: .threads)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
        try container.encode(memoryCost, forKey: .memoryCost)
        try container.encode(timeCost, forKey: .timeCost)
        try container.encode(threads, forKey: .threads)
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
            type: map["type"] as? String ?? "",
            memoryCost: map["memoryCost"] as? Int ?? 0,
            timeCost: map["timeCost"] as? Int ?? 0,
            threads: map["threads"] as? Int ?? 0
        )
    }
}
