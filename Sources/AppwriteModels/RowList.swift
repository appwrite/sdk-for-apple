import Foundation
import JSONCodable

/// Rows List
open class RowList<T : Codable>: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case rows = "rows"
    }

    /// Total number of rows rows that matched your query.
    public let total: Int

    /// List of rows.
    public let rows: [Row<T>]


    init(
        total: Int,
        rows: [Row<T>]
    ) {
        self.total = total
        self.rows = rows
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.rows = try container.decode([Row<T>].self, forKey: .rows)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(rows, forKey: .rows)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "rows": rows.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> RowList {
        return RowList(
            total: map["total"] as! Int,
            rows: (map["rows"] as! [[String: Any]]).map { Row.from(map: $0) }
        )
    }
}
