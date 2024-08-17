import Foundation
import JSONCodable

/// Template Variable
public class TemplateVariable {

    /// Variable Name.
    public let name: String

    /// Variable Description.
    public let description: String

    /// Variable Value.
    public let value: String

    /// Variable Placeholder.
    public let placeholder: String

    /// Is the variable required?
    public let `required`: Bool

    /// Variable Type.
    public let type: String


    init(
        name: String,
        description: String,
        value: String,
        placeholder: String,
        `required`: Bool,
        type: String
    ) {
        self.name = name
        self.description = description
        self.value = value
        self.placeholder = placeholder
        self.`required` = `required`
        self.type = type
    }

    public func toMap() -> [String: Any] {
        return [
            "name": name as Any,
            "description": description as Any,
            "value": value as Any,
            "placeholder": placeholder as Any,
            "`required`": `required` as Any,
            "type": type as Any
        ]
    }

    public static func from(map: [String: Any] ) -> TemplateVariable {
        return TemplateVariable(
            name: map["name"] as! String,
            description: map["description"] as! String,
            value: map["value"] as! String,
            placeholder: map["placeholder"] as! String,
            `required`: map["required"] as! Bool,
            type: map["type"] as! String
        )
    }
}
