import Foundation
import JSONCodable

/// Template Function
public class TemplateFunction {

    /// Function Template Icon.
    public let icon: String

    /// Function Template ID.
    public let id: String

    /// Function Template Name.
    public let name: String

    /// Function Template Tagline.
    public let tagline: String

    /// Execution permissions.
    public let permissions: [Any]

    /// Function trigger events.
    public let events: [Any]

    /// Function execution schedult in CRON format.
    public let cron: String

    /// Function execution timeout in seconds.
    public let timeout: Int

    /// Function use cases.
    public let useCases: [Any]

    /// List of runtimes that can be used with this template.
    public let runtimes: [TemplateRuntime]

    /// Function Template Instructions.
    public let instructions: String

    /// VCS (Version Control System) Provider.
    public let vcsProvider: String

    /// VCS (Version Control System) Repository ID
    public let providerRepositoryId: String

    /// VCS (Version Control System) Owner.
    public let providerOwner: String

    /// VCS (Version Control System) branch version (tag).
    public let providerVersion: String

    /// Function variables.
    public let variables: [TemplateVariable]

    /// Function scopes.
    public let scopes: [Any]


    init(
        icon: String,
        id: String,
        name: String,
        tagline: String,
        permissions: [Any],
        events: [Any],
        cron: String,
        timeout: Int,
        useCases: [Any],
        runtimes: [TemplateRuntime],
        instructions: String,
        vcsProvider: String,
        providerRepositoryId: String,
        providerOwner: String,
        providerVersion: String,
        variables: [TemplateVariable],
        scopes: [Any]
    ) {
        self.icon = icon
        self.id = id
        self.name = name
        self.tagline = tagline
        self.permissions = permissions
        self.events = events
        self.cron = cron
        self.timeout = timeout
        self.useCases = useCases
        self.runtimes = runtimes
        self.instructions = instructions
        self.vcsProvider = vcsProvider
        self.providerRepositoryId = providerRepositoryId
        self.providerOwner = providerOwner
        self.providerVersion = providerVersion
        self.variables = variables
        self.scopes = scopes
    }

    public func toMap() -> [String: Any] {
        return [
            "icon": icon as Any,
            "id": id as Any,
            "name": name as Any,
            "tagline": tagline as Any,
            "permissions": permissions as Any,
            "events": events as Any,
            "cron": cron as Any,
            "timeout": timeout as Any,
            "useCases": useCases as Any,
            "runtimes": runtimes.map { $0.toMap() } as Any,
            "instructions": instructions as Any,
            "vcsProvider": vcsProvider as Any,
            "providerRepositoryId": providerRepositoryId as Any,
            "providerOwner": providerOwner as Any,
            "providerVersion": providerVersion as Any,
            "variables": variables.map { $0.toMap() } as Any,
            "scopes": scopes as Any
        ]
    }

    public static func from(map: [String: Any] ) -> TemplateFunction {
        return TemplateFunction(
            icon: map["icon"] as! String,
            id: map["id"] as! String,
            name: map["name"] as! String,
            tagline: map["tagline"] as! String,
            permissions: map["permissions"] as! [Any],
            events: map["events"] as! [Any],
            cron: map["cron"] as! String,
            timeout: map["timeout"] as! Int,
            useCases: map["useCases"] as! [Any],
            runtimes: (map["runtimes"] as! [[String: Any]]).map { TemplateRuntime.from(map: $0) },
            instructions: map["instructions"] as! String,
            vcsProvider: map["vcsProvider"] as! String,
            providerRepositoryId: map["providerRepositoryId"] as! String,
            providerOwner: map["providerOwner"] as! String,
            providerVersion: map["providerVersion"] as! String,
            variables: (map["variables"] as! [[String: Any]]).map { TemplateVariable.from(map: $0) },
            scopes: map["scopes"] as! [Any]
        )
    }
}
