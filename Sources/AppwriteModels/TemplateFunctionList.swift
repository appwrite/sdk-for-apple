import Foundation
import JSONCodable

/// Function Templates List
public class TemplateFunctionList {

    /// Total number of templates documents that matched your query.
    public let total: Int

    /// List of templates.
    public let templates: [TemplateFunction]


    init(
        total: Int,
        templates: [TemplateFunction]
    ) {
        self.total = total
        self.templates = templates
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "templates": templates.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> TemplateFunctionList {
        return TemplateFunctionList(
            total: map["total"] as! Int,
            templates: (map["templates"] as! [[String: Any]]).map { TemplateFunction.from(map: $0) }
        )
    }
}
