import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The GraphQL API allows you to query and mutate your Appwrite server using GraphQL.
open class Graphql: Service {

    ///
    /// GraphQL endpoint
    ///
    /// Execute a GraphQL mutation.
    ///
    /// @param Any query
    /// @throws Exception
    /// @return array
    ///
    open func query(
        query: Any
    ) async throws -> Any {
        let apiPath: String = "/graphql"

        let apiParams: [String: Any?] = [
            "query": query
        ]

        let apiHeaders: [String: String] = [
            "x-sdk-graphql": "true",
            "content-type": "application/json"
        ]

        let converter: (Any) -> Any = { response in
            return response
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// GraphQL endpoint
    ///
    /// Execute a GraphQL mutation.
    ///
    /// @param Any query
    /// @throws Exception
    /// @return array
    ///
    open func mutation(
        query: Any
    ) async throws -> Any {
        let apiPath: String = "/graphql/mutation"

        let apiParams: [String: Any?] = [
            "query": query
        ]

        let apiHeaders: [String: String] = [
            "x-sdk-graphql": "true",
            "content-type": "application/json"
        ]

        let converter: (Any) -> Any = { response in
            return response
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }


}