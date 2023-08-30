import Foundation
import JSONCodable

/// ProviderRepository
public class ProviderRepository {

    /// VCS (Version Control System) repository ID.
    public let id: String

    /// VCS (Version Control System) repository name.
    public let name: String

    /// VCS (Version Control System) organization name
    public let organization: String

    /// VCS (Version Control System) provider name.
    public let provider: String

    /// Is VCS (Version Control System) repository private?
    public let xprivate: Bool

    /// Auto-detected runtime suggestion. Empty if getting response of getRuntime().
    public let runtime: String

    /// Last commit date in ISO 8601 format.
    public let pushedAt: String


    init(
        id: String,
        name: String,
        organization: String,
        provider: String,
        xprivate: Bool,
        runtime: String,
        pushedAt: String
    ) {
        self.id = id
        self.name = name
        self.organization = organization
        self.provider = provider
        self.xprivate = xprivate
        self.runtime = runtime
        self.pushedAt = pushedAt
    }

    public func toMap() -> [String: Any] {
        return [
            "id": id as Any,
            "name": name as Any,
            "organization": organization as Any,
            "provider": provider as Any,
            "xprivate": xprivate as Any,
            "runtime": runtime as Any,
            "pushedAt": pushedAt as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ProviderRepository {
        return ProviderRepository(
            id: map["id"] as! String,
            name: map["name"] as! String,
            organization: map["organization"] as! String,
            provider: map["provider"] as! String,
            xprivate: map["private"] as! Bool,
            runtime: map["runtime"] as! String,
            pushedAt: map["pushedAt"] as! String
        )
    }
}
