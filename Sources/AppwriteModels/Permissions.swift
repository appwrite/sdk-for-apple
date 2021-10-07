
/// Permissions
public class Permissions {

    /// Read permissions.
    public let read: Array<Any>?

    /// Write permissions.
    public let write: Array<Any>?

    init(
        read: Array<Any>?,
        write: Array<Any>?
    ) {
        self.read = read
        self.write = write
    }

    public static func from(map: [String: Any]) -> Permissions {
        return Permissions(
            read: map["read"] as! Array<Any>?,
            write: map["write"] as! Array<Any>?
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "read": read as Any,
            "write": write as Any
        ]
    }
            
}