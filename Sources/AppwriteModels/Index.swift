
/// Index
public class Index {

    /// Index Key.
    public let key: String

    /// Index type.
    public let type: String

    /// Index status. Possible values: `available`, `processing`, `deleting`, `stuck`, or `failed`
    public let status: String

    /// Index attributes.
    public let attributes: [Any]

    /// Index orders.
    public let orders: [Any]

    init(
        key: String,
        type: String,
        status: String,
        attributes: [Any],
        orders: [Any]
    ) {
        self.key = key
        self.type = type
        self.status = status
        self.attributes = attributes
        self.orders = orders
    }

    public static func from(map: [String: Any]) -> Index {
        return Index(
            key: map["key"] as! String,
            type: map["type"] as! String,
            status: map["status"] as! String,
            attributes: map["attributes"] as! [Any],
            orders: map["orders"] as! [Any]
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "key": key as Any,
            "type": type as Any,
            "status": status as Any,
            "attributes": attributes as Any,
            "orders": orders as Any
        ]
    }
                        
}