import Foundation
import JSONCodable

/// LocaleCode
public class LocaleCode {

    /// Locale codes in [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes)
    public let code: String

    /// Locale name
    public let name: String


    init(
        code: String,
        name: String
    ) {
        self.code = code
        self.name = name
    }

    public func toMap() -> [String: Any] {
        return [
            "code": code as Any,
            "name": name as Any
        ]
    }

    public static func from(map: [String: Any] ) -> LocaleCode {
        return LocaleCode(
            code: map["code"] as! String,
            name: map["name"] as! String
        )
    }
}
