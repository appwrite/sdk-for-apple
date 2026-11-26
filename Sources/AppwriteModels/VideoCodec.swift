import AppwriteEnums
import Foundation
import JSONCodable

/// Video codec
open class VideoCodec: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case name = "name"
        case outputs = "outputs"
    }

    /// Codec ID.
    public let id: String
    /// Codec display name.
    public let name: String
    /// Streaming output formats this codec may be packaged into.
    public let outputs: [AppwriteEnums.VideoOutput]

    init(
        id: String,
        name: String,
        outputs: [AppwriteEnums.VideoOutput]
    ) {
        self.id = id
        self.name = name
        self.outputs = outputs
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.outputs = (try container.contains(.outputs) ? container.decode([String].self, forKey: .outputs) : []).map { AppwriteEnums.VideoOutput(rawValue: $0)! }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(outputs.map { $0.rawValue }, forKey: .outputs)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "name": name as Any,
            "outputs": outputs.map { $0.rawValue } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> VideoCodec {
        let defaults: [String: Any] = [
            "$id": "",
            "name": "",
            "outputs": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return VideoCodec(
            id: map["$id"] as! String,
            name: map["name"] as! String,
            outputs: (map["outputs"] as! [String]).map { AppwriteEnums.VideoOutput(rawValue: $0)! }
        )
    }
}
