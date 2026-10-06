import Foundation
import JSONCodable

/// OAuth2 Device Authorization
open class Oauth2DeviceAuthorization: Codable {

    enum CodingKeys: String, CodingKey {
        case device_code = "device_code"
        case user_code = "user_code"
        case verification_uri = "verification_uri"
        case verification_uri_complete = "verification_uri_complete"
        case expires_in = "expires_in"
        case interval = "interval"
    }

    /// Device verification code used by the client to poll the token endpoint.
    public let device_code: String
    /// Short code the end user enters on the verification page.
    public let user_code: String
    /// URL where the end user enters the user code.
    public let verification_uri: String
    /// Verification URL with the user code prefilled as a query parameter.
    public let verification_uri_complete: String
    /// Lifetime of the device code and user code in seconds.
    public let expires_in: Int
    /// Minimum polling interval for the token endpoint in seconds.
    public let interval: Int

    init(
        device_code: String,
        user_code: String,
        verification_uri: String,
        verification_uri_complete: String,
        expires_in: Int,
        interval: Int
    ) {
        self.device_code = device_code
        self.user_code = user_code
        self.verification_uri = verification_uri
        self.verification_uri_complete = verification_uri_complete
        self.expires_in = expires_in
        self.interval = interval
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.device_code = try container.decode(String.self, forKey: .device_code)
        self.user_code = try container.decode(String.self, forKey: .user_code)
        self.verification_uri = try container.decode(String.self, forKey: .verification_uri)
        self.verification_uri_complete = try container.decode(String.self, forKey: .verification_uri_complete)
        self.expires_in = try container.decode(Int.self, forKey: .expires_in)
        self.interval = try container.decode(Int.self, forKey: .interval)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(device_code, forKey: .device_code)
        try container.encode(user_code, forKey: .user_code)
        try container.encode(verification_uri, forKey: .verification_uri)
        try container.encode(verification_uri_complete, forKey: .verification_uri_complete)
        try container.encode(expires_in, forKey: .expires_in)
        try container.encode(interval, forKey: .interval)
    }

    public func toMap() -> [String: Any] {
        return [
            "device_code": device_code as Any,
            "user_code": user_code as Any,
            "verification_uri": verification_uri as Any,
            "verification_uri_complete": verification_uri_complete as Any,
            "expires_in": expires_in as Any,
            "interval": interval as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Oauth2DeviceAuthorization {
        return Oauth2DeviceAuthorization(
            device_code: map["device_code"] as! String,
            user_code: map["user_code"] as! String,
            verification_uri: map["verification_uri"] as! String,
            verification_uri_complete: map["verification_uri_complete"] as! String,
            expires_in: map["expires_in"] as! Int,
            interval: map["interval"] as! Int
        )
    }
}
