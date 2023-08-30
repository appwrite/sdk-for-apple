import Foundation
import JSONCodable

/// Branches List
public class BranchList {

    /// Total number of branches documents that matched your query.
    public let total: Int

    /// List of branches.
    public let branches: [Branch]


    init(
        total: Int,
        branches: [Branch]
    ) {
        self.total = total
        self.branches = branches
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "branches": branches.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> BranchList {
        return BranchList(
            total: map["total"] as! Int,
            branches: (map["branches"] as! [[String: Any]]).map { Branch.from(map: $0) }
        )
    }
}
