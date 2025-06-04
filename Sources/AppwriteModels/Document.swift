import Foundation
import JSONCodable

/// Document
open class Document<T : Codable>: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case collectionId = "$collectionId"
        case databaseId = "$databaseId"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case permissions = "$permissions"
        case data
    }

    /// Document ID.
    public let id: String

    /// Collection ID.
    public let collectionId: String

    /// Database ID.
    public let databaseId: String

    /// Document creation date in ISO 8601 format.
    public let createdAt: String

    /// Document update date in ISO 8601 format.
    public let updatedAt: String

    /// Document permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
    public let permissions: [String]

    /// Additional properties
    public let data: T

    init(
        id: String,
        collectionId: String,
        databaseId: String,
        createdAt: String,
        updatedAt: String,
        permissions: [String],
        data: T
    ) {
        self.id = id
        self.collectionId = collectionId
        self.databaseId = databaseId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.data = data
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.collectionId = try container.decode(String.self, forKey: .collectionId)
        self.databaseId = try container.decode(String.self, forKey: .databaseId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.permissions = try container.decode([String].self, forKey: .permissions)
        self.data = try container.decode(T.self, forKey: .data)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(collectionId, forKey: .collectionId)
        try container.encode(databaseId, forKey: .databaseId)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(permissions, forKey: .permissions)
        try container.encode(data, forKey: .data)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$collectionId": collectionId as Any,
            "$databaseId": databaseId as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$permissions": permissions as Any,
            "data": try! JSONEncoder().encode(data)
        ]
    }

    public static func from(map: [String: Any] ) -> Document {
        return Document(
            id: map["$id"] as? String ?? "",
            collectionId: map["$collectionId"] as? String ?? "",
            databaseId: map["$databaseId"] as? String ?? "",
            createdAt: map["$createdAt"] as? String ?? "",
            updatedAt: map["$updatedAt"] as? String ?? "",
            permissions: map["$permissions"] as? [String] ?? [],
            data: try! JSONDecoder().decode(T.self, from: JSONSerialization.data(withJSONObject: map, options: []))
        )
    }
}
