
/// Sessions List
public class SessionList {

    /// Total number of sessions documents that matched your query.
    public let total: Int

    /// List of sessions.
    public let sessions: [Session]

    init(
        total: Int,
        sessions: [Session]
    ) {
        self.total = total
        self.sessions = sessions
    }

    public static func from(map: [String: Any]) -> SessionList {
        return SessionList(
            total: map["total"] as! Int,
            sessions: (map["sessions"] as! [[String: Any]]).map { Session.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "sessions": sessions.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                    
}