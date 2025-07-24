import Foundation
import JSONCodable

/// Files List
open class FileList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case files = "files"
    }

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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.files = try container.decode([File].self, forKey: .files)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(files, forKey: .files)
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
