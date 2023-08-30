import Foundation
import JSONCodable

/// Migrations Firebase Projects List
public class FirebaseProjectList {

    /// Total number of projects documents that matched your query.
    public let total: Int

    /// List of projects.
    public let projects: [FirebaseProject]


    init(
        total: Int,
        projects: [FirebaseProject]
    ) {
        self.total = total
        self.projects = projects
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "projects": projects.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> FirebaseProjectList {
        return FirebaseProjectList(
            total: map["total"] as! Int,
            projects: (map["projects"] as! [[String: Any]]).map { FirebaseProject.from(map: $0) }
        )
    }
}
