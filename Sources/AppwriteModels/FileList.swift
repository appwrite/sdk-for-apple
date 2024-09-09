import Foundation
import JSONCodable

/// Files List
public class FileList {

    /// Total number of files documents that matched your query.
    public let total: Int

    /// List of files.
    public let files: [File]


    init(
        total: Int,
        files: [File]
    ) {
        self.total = total
        self.files = files
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "files": files.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> FileList {
        return FileList(
            total: map["total"] as! Int,
            files: (map["files"] as! [[String: Any]]).map { File.from(map: $0) }
        )
    }
}
