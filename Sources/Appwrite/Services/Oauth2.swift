import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class Oauth2: Service {

    ///
    /// Approve an OAuth2 grant after the user gives consent. Returns the
    /// `redirectUrl` the end user should be sent to. The consent screen may
    /// optionally pass enriched `authorization_details` to record the concrete
    /// resources the user selected. You can pass Accept header of
    /// `application/json` to receive a JSON response instead of a redirect.
    ///
    /// - Parameters:
    ///   - projectId: String
    ///   - grantId: String
    ///   - authorizationDetails: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2Approve
    ///
    open func approve(
        projectId: String,
        grantId: String,
        authorizationDetails: String? = nil
    ) async throws -> AppwriteModels.Oauth2Approve {
        let apiPath: String = "/oauth2/{project_id}/approve"
            .replacingOccurrences(of: "{project_id}", with: projectId)
            + "?project=\(client.config["project"]?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"

        let apiParams: [String: Any?] = [
            "grant_id": grantId,
            "authorization_details": authorizationDetails
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Oauth2Approve = { response in
            return AppwriteModels.Oauth2Approve.from(map: response as! [String: Any])
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
    /// Begin the OAuth2 authorization flow. When called without a session, the
    /// user is redirected to the consent screen without grant ID. When called with
    /// a session, the redirect URL includes param for grant ID. You can pass
    /// Accept header of `application/json` to receive a JSON response instead of a
    /// redirect.
    ///
    /// - Parameters:
    ///   - projectId: String
    ///   - clientId: String
    ///   - redirectUri: String
    ///   - responseType: String
    ///   - scope: String
    ///   - state: String (optional)
    ///   - nonce: String (optional)
    ///   - codeChallenge: String (optional)
    ///   - codeChallengeMethod: String (optional)
    ///   - prompt: String (optional)
    ///   - maxAge: Int (optional)
    ///   - authorizationDetails: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2Authorize
    ///
    open func authorize(
        projectId: String,
        clientId: String,
        redirectUri: String,
        responseType: String,
        scope: String,
        state: String? = nil,
        nonce: String? = nil,
        codeChallenge: String? = nil,
        codeChallengeMethod: String? = nil,
        prompt: String? = nil,
        maxAge: Int? = nil,
        authorizationDetails: String? = nil
    ) async throws -> AppwriteModels.Oauth2Authorize {
        let apiPath: String = "/oauth2/{project_id}/authorize"
            .replacingOccurrences(of: "{project_id}", with: projectId)
            + "?project=\(client.config["project"]?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"

        let apiParams: [String: Any?] = [
            "client_id": clientId,
            "redirect_uri": redirectUri,
            "response_type": responseType,
            "scope": scope,
            "state": state,
            "nonce": nonce,
            "code_challenge": codeChallenge,
            "code_challenge_method": codeChallengeMethod,
            "prompt": prompt,
            "max_age": maxAge,
            "authorization_details": authorizationDetails
        ]

        let apiHeaders: [String: String] = [
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Oauth2Authorize = { response in
            return AppwriteModels.Oauth2Authorize.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Exchange a device flow user code for an OAuth2 grant. The authenticated
    /// user is bound to the pending grant. Pass the returned grant ID to the get
    /// grant endpoint to render the consent screen, then to the approve or reject
    /// endpoint to complete the flow.
    ///
    /// - Parameters:
    ///   - projectId: String
    ///   - userCode: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2Grant
    ///
    open func createGrant(
        projectId: String,
        userCode: String
    ) async throws -> AppwriteModels.Oauth2Grant {
        let apiPath: String = "/oauth2/{project_id}/grants"
            .replacingOccurrences(of: "{project_id}", with: projectId)

        let apiParams: [String: Any?] = [
            "user_code": userCode
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Oauth2Grant = { response in
            return AppwriteModels.Oauth2Grant.from(map: response as! [String: Any])
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
    /// Get an OAuth2 grant by its ID. Used by the consent screen to display the
    /// details of the authorization the user is being asked to approve. A grant
    /// can only be read by the user it belongs to, or by server SDK.
    ///
    /// - Parameters:
    ///   - projectId: String
    ///   - grantId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2Grant
    ///
    open func getGrant(
        projectId: String,
        grantId: String
    ) async throws -> AppwriteModels.Oauth2Grant {
        let apiPath: String = "/oauth2/{project_id}/grants/{grant_id}"
            .replacingOccurrences(of: "{project_id}", with: projectId)
            .replacingOccurrences(of: "{grant_id}", with: grantId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Oauth2Grant = { response in
            return AppwriteModels.Oauth2Grant.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Reject an OAuth2 grant when the user denies consent. Returns the
    /// `redirectUrl` the end user should be sent to with an `access_denied` error.
    /// You can pass Accept header of `application/json` to receive a JSON response
    /// instead of a redirect.
    ///
    /// - Parameters:
    ///   - projectId: String
    ///   - grantId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2Reject
    ///
    open func reject(
        projectId: String,
        grantId: String
    ) async throws -> AppwriteModels.Oauth2Reject {
        let apiPath: String = "/oauth2/{project_id}/reject"
            .replacingOccurrences(of: "{project_id}", with: projectId)
            + "?project=\(client.config["project"]?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"

        let apiParams: [String: Any?] = [
            "grant_id": grantId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Oauth2Reject = { response in
            return AppwriteModels.Oauth2Reject.from(map: response as! [String: Any])
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
