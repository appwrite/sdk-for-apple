import Foundation
import JSONCodable

/// Template Runtime
public class TemplateRuntime {

    /// Runtime Name.
    public let name: String

    /// The build command used to build the deployment.
    public let commands: String

    /// The entrypoint file used to execute the deployment.
    public let entrypoint: String

    /// Path to function in VCS (Version Control System) repository
    public let providerRootDirectory: String


    init(
        name: String,
        commands: String,
        entrypoint: String,
        providerRootDirectory: String
    ) {
        self.name = name
        self.commands = commands
        self.entrypoint = entrypoint
        self.providerRootDirectory = providerRootDirectory
    }

    public func toMap() -> [String: Any] {
        return [
            "name": name as Any,
            "commands": commands as Any,
            "entrypoint": entrypoint as Any,
            "providerRootDirectory": providerRootDirectory as Any
        ]
    }

    public static func from(map: [String: Any] ) -> TemplateRuntime {
        return TemplateRuntime(
            name: map["name"] as! String,
            commands: map["commands"] as! String,
            entrypoint: map["entrypoint"] as! String,
            providerRootDirectory: map["providerRootDirectory"] as! String
        )
    }
}
