import Foundation
import JSONCodable

/// Detection
public class Detection {

    /// Runtime
    public let runtime: String


    init(
        runtime: String
    ) {
        self.runtime = runtime
    }

    public func toMap() -> [String: Any] {
        return [
            "runtime": runtime as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Detection {
        return Detection(
            runtime: map["runtime"] as! String
        )
    }
}
