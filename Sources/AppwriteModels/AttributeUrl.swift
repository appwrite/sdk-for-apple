
/// AttributeURL
public class AttributeUrl {

    /// Attribute Key.
    public let key: String

    /// Attribute type.
    public let type: String

    /// Attribute status. Possible values: `available`, `processing`, `deleting`, `stuck`, or `failed`
    public let status: String

    /// Is attribute required?
    public let xrequired: Bool

    /// Is attribute an array?
    public let array: Bool?

    /// String format.
    public let format: String

    /// Default value for attribute when not provided. Cannot be set when attribute is required.
    public let xdefault: String?

    init(
        key: String,
        type: String,
        status: String,
        xrequired: Bool,
        array: Bool? = ,
        format: String,
        xdefault: String? = 
    ) {
        self.key = key
        self.type = type
        self.status = status
        self.xrequired = xrequired
        self.array = array
        self.format = format
        self.xdefault = xdefault
    }

    public static func from(map: [String: Any]) -> AttributeUrl {
        return AttributeUrl(
            key: map["key"] as! String,
            type: map["type"] as! String,
            status: map["status"] as! String,
            xrequired: map["required"] as! Bool,
            array: map["array"] as? Bool,
            format: map["format"] as! String,
            xdefault: map["default"] as? String
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "key": key as Any,
            "type": type as Any,
            "status": status as Any,
            "xrequired": xrequired as Any,
            "array": array as Any,
            "format": format as Any,
            "xdefault": xdefault as Any
        ]
    }
                                
}