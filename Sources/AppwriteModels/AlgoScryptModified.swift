import Foundation
import JSONCodable

/// AlgoScryptModified
public class AlgoScryptModified {

    /// Algo type.
    public let type: String

    /// Salt used to compute hash.
    public let salt: String

    /// Separator used to compute hash.
    public let saltSeparator: String

    /// Key used to compute hash.
    public let signerKey: String


    init(
        type: String,
        salt: String,
        saltSeparator: String,
        signerKey: String
    ) {
        self.type = type
        self.salt = salt
        self.saltSeparator = saltSeparator
        self.signerKey = signerKey
    }

    public func toMap() -> [String: Any] {
        return [
            "type": type as Any,
            "salt": salt as Any,
            "saltSeparator": saltSeparator as Any,
            "signerKey": signerKey as Any
        ]
    }

    public static func from(map: [String: Any] ) -> AlgoScryptModified {
        return AlgoScryptModified(
            type: map["type"] as! String,
            salt: map["salt"] as! String,
            saltSeparator: map["saltSeparator"] as! String,
            signerKey: map["signerKey"] as! String
        )
    }
}
