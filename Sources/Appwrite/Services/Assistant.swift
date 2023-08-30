import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteModels

/// 
open class Assistant: Service {

    ///
    /// Ask Query
    ///
    /// @param String prompt
    /// @throws Exception
    /// @return array
    ///
    open func chat(
        prompt: String
    ) async throws -> Any {
        let api_path: String = "/console/assistant"

        let params: [String: Any?] = [
            "prompt": prompt
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "POST",
            path: api_path,
            headers: headers,
            params: params        )
    }


}