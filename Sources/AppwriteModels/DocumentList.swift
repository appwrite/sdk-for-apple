import Foundation

/// Documents List
public class DocumentList<T : Codable> {

    /// Total number of documents documents that matched your query.
    public let total: Int

    /// List of documents.
    public let documents: [Document<T>]


    init(
        total: Int,
        documents: [Document<T>]
    ) {
        self.total = total
        self.documents = documents
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "documents": documents.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DocumentList {
        return DocumentList(
            total: map["total"] as! Int,
            documents: (map["documents"] as! [[String: Any]]).map { Document.from(map: $0) }
        )
    }
}
