import Foundation
import JSONCodable

/// Insights List
open class InsightList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case insights = "insights"
    }

    /// Total number of insights that matched your query.
    public let total: Int
    /// List of insights.
    public let insights: [Insight]

    init(
        total: Int,
        insights: [Insight]
    ) {
        self.total = total
        self.insights = insights
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.insights = try container.decode([Insight].self, forKey: .insights)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(insights, forKey: .insights)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "insights": insights.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> InsightList {
        return InsightList(
            total: map["total"] as! Int,
            insights: (map["insights"] as! [[String: Any]]).map { Insight.from(map: $0) }
        )
    }
}
