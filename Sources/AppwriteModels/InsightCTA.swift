import Foundation
import JSONCodable

/// InsightCTA
open class InsightCTA: Codable {

    enum CodingKeys: String, CodingKey {
        case label = "label"
        case service = "service"
        case method = "method"
        case params = "params"
    }

    /// Human-readable label for the CTA, used in UI.
    public let label: String
    /// Public API service (SDK namespace) the client should invoke. Must match the engine that owns the resource — for index suggestions: databases (legacy), tablesDB, documentsDB, or vectorsDB.
    public let service: String
    /// Public API method on the chosen service the client should invoke when this CTA is triggered.
    public let method: String
    /// Parameter map the client should pass to the service method when this CTA is triggered. Keys match the target API&#039;s parameter names (e.g. databaseId/tableId/columns for tablesDB, databaseId/collectionId/attributes for the legacy Databases API).
    public let params: [String: AnyCodable]

    init(
        label: String,
        service: String,
        method: String,
        params: [String: AnyCodable]
    ) {
        self.label = label
        self.service = service
        self.method = method
        self.params = params
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.label = try container.decode(String.self, forKey: .label)
        self.service = try container.decode(String.self, forKey: .service)
        self.method = try container.decode(String.self, forKey: .method)
        self.params = try container.decode([String: AnyCodable].self, forKey: .params)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(label, forKey: .label)
        try container.encode(service, forKey: .service)
        try container.encode(method, forKey: .method)
        try container.encode(params, forKey: .params)
    }

    public func toMap() -> [String: Any] {
        return [
            "label": label as Any,
            "service": service as Any,
            "method": method as Any,
            "params": params as Any
        ]
    }

    public static func from(map: [String: Any] ) -> InsightCTA {
        return InsightCTA(
            label: map["label"] as! String,
            service: map["service"] as! String,
            method: map["method"] as! String,
            params: map["params"] as! [String: AnyCodable]
        )
    }
}
