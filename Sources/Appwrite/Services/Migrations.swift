import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteModels

/// The Migrations service allows you to migrate third-party data to your Appwrite project.
open class Migrations: Service {

    ///
    /// Revoke Appwrite&#039;s authorization to access Firebase Projects
    ///
    /// @throws Exception
    /// @return array
    ///
    open func deleteFirebaseAuth(
    ) async throws -> Any {
        let api_path: String = "/migrations/firebase/deauthorize"

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params        )
    }

    ///
    /// List Firebase Projects
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listFirebaseProjects(
    ) async throws -> AppwriteModels.FirebaseProjectList {
        let api_path: String = "/migrations/firebase/projects"

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.FirebaseProjectList = { response in
            return AppwriteModels.FirebaseProjectList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }


}