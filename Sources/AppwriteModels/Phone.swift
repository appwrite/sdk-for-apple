import Foundation
import JSONCodable

/// Phone
open class Phone: Codable {

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case countryCode = "countryCode"
        case countryName = "countryName"
    }

    /// Phone code.
    public let code: String
    /// Country two-character ISO 3166-1 alpha code.
    public let countryCode: String
    /// Country name.
    public let countryName: String

    init(
        code: String,
        countryCode: String,
        countryName: String
    ) {
        self.code = code
        self.countryCode = countryCode
        self.countryName = countryName
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.code = try container.decode(String.self, forKey: .code)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.countryName = try container.decode(String.self, forKey: .countryName)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(code, forKey: .code)
        try container.encode(countryCode, forKey: .countryCode)
        try container.encode(countryName, forKey: .countryName)
    }

    public func toMap() -> [String: Any] {
        return [
            "code": code as Any,
            "countryCode": countryCode as Any,
            "countryName": countryName as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Phone {
        return Phone(
            code: map["code"] as! String,
            countryCode: map["countryCode"] as! String,
            countryName: map["countryName"] as! String
        )
    }
}
