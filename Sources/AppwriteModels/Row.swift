import Foundation
import JSONCodable

/// Row
open class Row<T : Codable>: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case sequence = "$sequence"
        case tableId = "$tableId"
        case databaseId = "$databaseId"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case permissions = "$permissions"
        case data
    }

    /// Row ID.
    public let id: String

    /// Row automatically incrementing ID.
    public let sequence: Int

    /// Table ID.
    public let tableId: String

    /// Database ID.
    public let databaseId: String

    /// Row creation date in ISO 8601 format.
    public let createdAt: String

    /// Row update date in ISO 8601 format.
    public let updatedAt: String

    /// Row permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
    public let permissions: [String]

    /// Additional properties
    public let data: T

    init(
        id: String,
        sequence: Int,
        tableId: String,
        databaseId: String,
        createdAt: String,
        updatedAt: String,
        permissions: [String],
        data: T
    ) {
        self.id = id
        self.sequence = sequence
        self.tableId = tableId
        self.databaseId = databaseId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.data = data
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.sequence = try container.decode(Int.self, forKey: .sequence)
        self.tableId = try container.decode(String.self, forKey: .tableId)
        self.databaseId = try container.decode(String.self, forKey: .databaseId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.permissions = try container.decode([String].self, forKey: .permissions)
        self.data = try container.decode(T.self, forKey: .data)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(sequence, forKey: .sequence)
        try container.encode(tableId, forKey: .tableId)
        try container.encode(databaseId, forKey: .databaseId)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(permissions, forKey: .permissions)
        try container.encode(data, forKey: .data)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$sequence": sequence as Any,
            "$tableId": tableId as Any,
            "$databaseId": databaseId as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$permissions": permissions as Any,
            "data": try! JSONEncoder().encode(data)
        ]
    }

    public static func from(map: [String: Any] ) -> Row {
        return Row(
            id: map["$id"] as! String,
            sequence: map["$sequence"] as! Int,
            tableId: map["$tableId"] as! String,
            databaseId: map["$databaseId"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [String],
            data: try! JSONDecoder().decode(T.self, from: JSONSerialization.data(withJSONObject: map, options: []))
        )
    }
}
