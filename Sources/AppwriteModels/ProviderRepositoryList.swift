import Foundation
import JSONCodable

/// Provider Repositories List
public class ProviderRepositoryList {

    /// Total number of providerRepositories documents that matched your query.
    public let total: Int

    /// List of providerRepositories.
    public let providerRepositories: [ProviderRepository]


    init(
        total: Int,
        providerRepositories: [ProviderRepository]
    ) {
        self.total = total
        self.providerRepositories = providerRepositories
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "providerRepositories": providerRepositories.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ProviderRepositoryList {
        return ProviderRepositoryList(
            total: map["total"] as! Int,
            providerRepositories: (map["providerRepositories"] as! [[String: Any]]).map { ProviderRepository.from(map: $0) }
        )
    }
}
