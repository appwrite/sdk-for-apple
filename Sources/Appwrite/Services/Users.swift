import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Users service allows you to manage your project users.
open class Users: Service {

    ///
    /// Delete Authenticator
    ///
    /// @param String userId
    /// @param AppwriteEnums.AuthenticatorProvider provider
    /// @param String otp
    /// @throws Exception
    /// @return array
    ///
    open func deleteAuthenticator<T>(
        userId: String,
        provider: AppwriteEnums.AuthenticatorProvider,
        otp: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/users/{userId}/mfa/{provider}"
            .replacingOccurrences(of: "{userId}", with: userId)
            .replacingOccurrences(of: "{provider}", with: provider.rawValue)

        let apiParams: [String: Any?] = [
            "otp": otp
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Delete Authenticator
    ///
    /// @param String userId
    /// @param AppwriteEnums.AuthenticatorProvider provider
    /// @param String otp
    /// @throws Exception
    /// @return array
    ///
    open func deleteAuthenticator(
        userId: String,
        provider: AppwriteEnums.AuthenticatorProvider,
        otp: String
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await deleteAuthenticator(
            userId: userId,
            provider: provider,
            otp: otp,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// List Providers
    ///
    /// @param String userId
    /// @throws Exception
    /// @return array
    ///
    open func listProviders(
        userId: String
    ) async throws -> AppwriteModels.MfaProviders {
        let apiPath: String = "/users/{userId}/providers"
            .replacingOccurrences(of: "{userId}", with: userId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.MfaProviders = { response in
            return AppwriteModels.MfaProviders.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }


}