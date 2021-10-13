
/// Files List
public class FileList {

    /// Total sum of items in the list.
    public let sum: Int

    /// List of files.
    public let files: [File]

    init(
        sum: Int,
        files: [File]
    ) {
        self.sum = sum
        self.files = files
    }

    public static func from(map: [String: Any]) -> FileList {
        return FileList(
            sum: map["sum"] as! Int,
            files: (map["files"] as! [[String: Any]]).map { File.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "files": files.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                        
}