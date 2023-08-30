import Foundation
import JSONCodable

/// MigrationFirebaseProject
public class FirebaseProject {

    /// Project ID.
    public let projectId: String

    /// Project display name.
    public let displayName: String


    init(
        projectId: String,
        displayName: String
    ) {
        self.projectId = projectId
        self.displayName = displayName
    }

    public func toMap() -> [String: Any] {
        return [
            "projectId": projectId as Any,
            "displayName": displayName as Any
        ]
    }

    public static func from(map: [String: Any] ) -> FirebaseProject {
        return FirebaseProject(
            projectId: map["projectId"] as! String,
            displayName: map["displayName"] as! String
        )
    }
}
