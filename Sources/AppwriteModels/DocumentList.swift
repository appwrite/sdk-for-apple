
/// Documents List
public class DocumentList {

    /// Total number of documents documents that matched your query.
    public let total: Int

    /// List of documents.
    public let documents: [Document]

    init(
        total: Int,
        documents: [Document]
    ) {
        self.total = total
        self.documents = documents
    }

    public static func from(map: [String: Any]) -> DocumentList {
        return DocumentList(
            total: map["total"] as! Int,
            documents: (map["documents"] as! [[String: Any]]).map { Document.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "documents": documents.map { $0.toMap() } as Any
        ]
    }
                                                                    
    public func convertTo<T>(fromJson: ([String: Any]) -> T) -> [T] {
        documents.map { d in d.convertTo(fromJson: fromJson) }
    }
                                                                
}
