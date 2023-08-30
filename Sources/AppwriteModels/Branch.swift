import Foundation
import JSONCodable

/// Branch
public class Branch {

    /// Branch Name.
    public let name: String


    init(
        name: String
    ) {
        self.name = name
    }

    public func toMap() -> [String: Any] {
        return [
            "name": name as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Branch {
        return Branch(
            name: map["name"] as! String
        )
    }
}
