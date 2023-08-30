import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteModels

/// 
open class Vcs: Service {

    ///
    /// List Repositories
    ///
    /// @param String installationId
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func listRepositories(
        installationId: String,
        search: String? = nil
    ) async throws -> AppwriteModels.ProviderRepositoryList {
        let api_path: String = "/vcs/github/installations/{installationId}/providerRepositories"
            .replacingOccurrences(of: "{installationId}", with: installationId)

        let params: [String: Any?] = [
            "search": search
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ProviderRepositoryList = { response in
            return AppwriteModels.ProviderRepositoryList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create repository
    ///
    /// @param String installationId
    /// @param String name
    /// @param Bool private
    /// @throws Exception
    /// @return array
    ///
    open func createRepository(
        installationId: String,
        name: String,
        xprivate: Bool
    ) async throws -> AppwriteModels.ProviderRepository {
        let api_path: String = "/vcs/github/installations/{installationId}/providerRepositories"
            .replacingOccurrences(of: "{installationId}", with: installationId)

        let params: [String: Any?] = [
            "name": name,
            "private": xprivate
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ProviderRepository = { response in
            return AppwriteModels.ProviderRepository.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get repository
    ///
    /// @param String installationId
    /// @param String providerRepositoryId
    /// @throws Exception
    /// @return array
    ///
    open func getRepository(
        installationId: String,
        providerRepositoryId: String
    ) async throws -> AppwriteModels.ProviderRepository {
        let api_path: String = "/vcs/github/installations/{installationId}/providerRepositories/{providerRepositoryId}"
            .replacingOccurrences(of: "{installationId}", with: installationId)
            .replacingOccurrences(of: "{providerRepositoryId}", with: providerRepositoryId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ProviderRepository = { response in
            return AppwriteModels.ProviderRepository.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// List Repository Branches
    ///
    /// @param String installationId
    /// @param String providerRepositoryId
    /// @throws Exception
    /// @return array
    ///
    open func listRepositoryBranches(
        installationId: String,
        providerRepositoryId: String
    ) async throws -> AppwriteModels.BranchList {
        let api_path: String = "/vcs/github/installations/{installationId}/providerRepositories/{providerRepositoryId}/branches"
            .replacingOccurrences(of: "{installationId}", with: installationId)
            .replacingOccurrences(of: "{providerRepositoryId}", with: providerRepositoryId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.BranchList = { response in
            return AppwriteModels.BranchList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Detect runtime settings from source code
    ///
    /// @param String installationId
    /// @param String providerRepositoryId
    /// @param String providerRootDirectory
    /// @throws Exception
    /// @return array
    ///
    open func createRepositoryDetection(
        installationId: String,
        providerRepositoryId: String,
        providerRootDirectory: String? = nil
    ) async throws -> AppwriteModels.Detection {
        let api_path: String = "/vcs/github/installations/{installationId}/providerRepositories/{providerRepositoryId}/detection"
            .replacingOccurrences(of: "{installationId}", with: installationId)
            .replacingOccurrences(of: "{providerRepositoryId}", with: providerRepositoryId)

        let params: [String: Any?] = [
            "providerRootDirectory": providerRootDirectory
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Detection = { response in
            return AppwriteModels.Detection.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Authorize external deployment
    ///
    /// @param String installationId
    /// @param String repositoryId
    /// @param String providerPullRequestId
    /// @throws Exception
    /// @return array
    ///
    open func updateExternalDeployments(
        installationId: String,
        repositoryId: String,
        providerPullRequestId: String
    ) async throws -> Any {
        let api_path: String = "/vcs/github/installations/{installationId}/repositories/{repositoryId}"
            .replacingOccurrences(of: "{installationId}", with: installationId)
            .replacingOccurrences(of: "{repositoryId}", with: repositoryId)

        let params: [String: Any?] = [
            "providerPullRequestId": providerPullRequestId
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "PATCH",
            path: api_path,
            headers: headers,
            params: params        )
    }


}