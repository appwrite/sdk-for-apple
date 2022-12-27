import Foundation

/// JWT
public class Jwt {

    /// JWT encoded string.
    public let jwt: String


    init(
        jwt: String
    ) {
        self.jwt = jwt
    }

    public func toMap() -> [String: Any] {
        return [
            "jwt": jwt as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Jwt {
        return Jwt(
            jwt: map["jwt"] as! String
        )
    }
}
