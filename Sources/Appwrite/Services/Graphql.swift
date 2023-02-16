import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteModels

/// The GraphQL API allows you to query and mutate your Appwrite server using GraphQL.
open class Graphql: Service {

    ///
    /// GraphQL Endpoint
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
        let path: String = "/graphql"

        let params: [String: Any?] = [
            "query": query,
            "project": client.config["project"]
        ]

        let headers: [String: String] = [
            "x-sdk-graphql": "true",
            "content-type": "application/json"
        ]

        let converter: (Any) -> Any = { response in
            return response
        }

        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// GraphQL Endpoint
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
        let path: String = "/graphql/mutation"

        let params: [String: Any?] = [
            "query": query,
            "project": client.config["project"]
        ]

        let headers: [String: String] = [
            "x-sdk-graphql": "true",
            "content-type": "application/json"
        ]

        let converter: (Any) -> Any = { response in
            return response
        }

        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }


}