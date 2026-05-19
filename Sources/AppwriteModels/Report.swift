import Foundation
import JSONCodable

/// Report
open class Report: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case appId = "appId"
        case type = "type"
        case title = "title"
        case summary = "summary"
        case targetType = "targetType"
        case target = "target"
        case categories = "categories"
        case insights = "insights"
        case analyzedAt = "analyzedAt"
    }

    /// Report ID.
    public let id: String
    /// Report creation date in ISO 8601 format.
    public let createdAt: String
    /// Report update date in ISO 8601 format.
    public let updatedAt: String
    /// ID of the third-party app that submitted the report.
    public let appId: String
    /// Analyzer that produced this report. e.g. lighthouse, audit, databaseAnalyzer.
    public let type: String
    /// Short, human-readable title for the report.
    public let title: String
    /// Markdown summary describing the report.
    public let summary: String
    /// Plural noun describing what the report analyzes, e.g. databases, sites, urls.
    public let targetType: String
    /// Free-form target identifier (URL for lighthouse, resource ID for db).
    public let target: String
    /// Categories covered by the report, e.g. performance, accessibility.
    public let categories: [String]
    /// Insights nested under this report.
    public let insights: [Insight]
    /// Time the report was analyzed in ISO 8601 format.
    public let analyzedAt: String?

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        appId: String,
        type: String,
        title: String,
        summary: String,
        targetType: String,
        target: String,
        categories: [String],
        insights: [Insight],
        analyzedAt: String?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.appId = appId
        self.type = type
        self.title = title
        self.summary = summary
        self.targetType = targetType
        self.target = target
        self.categories = categories
        self.insights = insights
        self.analyzedAt = analyzedAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.appId = try container.decode(String.self, forKey: .appId)
        self.type = try container.decode(String.self, forKey: .type)
        self.title = try container.decode(String.self, forKey: .title)
        self.summary = try container.decode(String.self, forKey: .summary)
        self.targetType = try container.decode(String.self, forKey: .targetType)
        self.target = try container.decode(String.self, forKey: .target)
        self.categories = try container.decode([String].self, forKey: .categories)
        self.insights = try container.decode([Insight].self, forKey: .insights)
        self.analyzedAt = try container.decodeIfPresent(String.self, forKey: .analyzedAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(appId, forKey: .appId)
        try container.encode(type, forKey: .type)
        try container.encode(title, forKey: .title)
        try container.encode(summary, forKey: .summary)
        try container.encode(targetType, forKey: .targetType)
        try container.encode(target, forKey: .target)
        try container.encode(categories, forKey: .categories)
        try container.encode(insights, forKey: .insights)
        try container.encodeIfPresent(analyzedAt, forKey: .analyzedAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "appId": appId as Any,
            "type": type as Any,
            "title": title as Any,
            "summary": summary as Any,
            "targetType": targetType as Any,
            "target": target as Any,
            "categories": categories as Any,
            "insights": insights.map { $0.toMap() } as Any,
            "analyzedAt": analyzedAt as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Report {
        return Report(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            appId: map["appId"] as! String,
            type: map["type"] as! String,
            title: map["title"] as! String,
            summary: map["summary"] as! String,
            targetType: map["targetType"] as! String,
            target: map["target"] as! String,
            categories: map["categories"] as! [String],
            insights: (map["insights"] as! [[String: Any]]).map { Insight.from(map: $0) },
            analyzedAt: map["analyzedAt"] as? String
        )
    }
}
