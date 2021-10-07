
/// Documents List
public class DocumentList {

    /// Total sum of items in the list.
    public let sum: Int

    /// List of documents.
    public let documents: [Document]

    init(
        sum: Int,
        documents: [Document]
    ) {
        self.sum = sum
        self.documents = documents
    }

    public static func from(map: [String: Any]) -> DocumentList {
        return DocumentList(
            sum: map["sum"] as! Int,
            documents: (map["documents"] as! [[String: Any]]).map { Document.from(map: $0) } as! [Document]
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "documents": documents.map { $0.toMap() } as Any
        ]
    }
                                                                        
    public func convertTo<T>(fromJson: ([String: Any]) -> T) -> [T] {
        documents.map { d in d.convertTo(fromJson: fromJson) }
    }
                                                                
}