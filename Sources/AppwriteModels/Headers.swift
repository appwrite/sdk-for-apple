import Foundation
import JSONCodable

/// Headers
public class Headers {

    /// Header name.
    public let name: String


    /// Header value.
    public let value: String



    init(
        name: String,
        value: String
    ) {
        self.name = name
        self.value = value
    }

    public func toMap() -> [String: Any] {
        return [
            "name": name as Any,
            "value": value as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Headers {
        return Headers(
            name: map["name"] as! String,
            value: map["value"] as! String
        )
    }
}
