import Foundation
import JSONCodable

/// Documents List
open class DocumentList<T : Codable>: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case documents = "documents"
    }

    /// Total number of documents that matched your query.
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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.documents = try container.decode([Document<T>].self, forKey: .documents)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(documents, forKey: .documents)
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
