import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

/// The OAuth2 service allows you to authorize apps and issue standards-based OAuth2 and OpenID Connect tokens.
open class Oauth2: Service {

    ///
    /// Approve an OAuth2 grant after the user gives consent. Returns the
    /// `redirectUrl` the end user should be sent to. The consent screen may
    /// optionally pass enriched `authorization_details` to record the concrete
    /// resources the user selected. You can pass Accept header of
    /// `application/json` to receive a JSON response instead of a redirect.
    ///
    /// - Parameters:
    ///   - grantId: String
    ///   - authorizationDetails: String (optional)
    ///   - scope: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2Approve
    ///
    open func approve(
        grantId: String,
        authorizationDetails: String? = nil,
        scope: String? = nil
    ) async throws -> AppwriteModels.Oauth2Approve {
        let apiPath: String = "/oauth2/{project_id}/approve"
            .replacingOccurrences(of: "{project_id}", with: client.config["project"] ?? "")

        let apiParams: [String: Any?] = [
            "grant_id": grantId,
            "authorization_details": authorizationDetails,
            "scope": scope,
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json",
            "accept": "application/json",
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
    ///   - clientId: String (optional)
    ///   - redirectUri: String (optional)
    ///   - responseType: String (optional)
    ///   - scope: String (optional)
    ///   - state: String (optional)
    ///   - nonce: String (optional)
    ///   - codeChallenge: String (optional)
    ///   - codeChallengeMethod: String (optional)
    ///   - prompt: String (optional)
    ///   - maxAge: Int (optional)
    ///   - authorizationDetails: String (optional)
    ///   - resource: String (optional)
    ///   - audience: String (optional)
    ///   - requestUri: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2Authorize
    ///
    open func authorize(
        clientId: String? = nil,
        redirectUri: String? = nil,
        responseType: String? = nil,
        scope: String? = nil,
        state: String? = nil,
        nonce: String? = nil,
        codeChallenge: String? = nil,
        codeChallengeMethod: String? = nil,
        prompt: String? = nil,
        maxAge: Int? = nil,
        authorizationDetails: String? = nil,
        resource: String? = nil,
        audience: String? = nil,
        requestUri: String? = nil
    ) async throws -> AppwriteModels.Oauth2Authorize {
        let apiPath: String = "/oauth2/{project_id}/authorize"
            .replacingOccurrences(of: "{project_id}", with: client.config["project"] ?? "")

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
            "authorization_details": authorizationDetails,
            "resource": resource,
            "audience": audience,
            "request_uri": requestUri,
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
    /// Begin the OAuth2 authorization flow. When called without a session, the
    /// user is redirected to the consent screen without grant ID. When called with
    /// a session, the redirect URL includes param for grant ID. You can pass
    /// Accept header of `application/json` to receive a JSON response instead of a
    /// redirect.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - redirectUri: String (optional)
    ///   - responseType: String (optional)
    ///   - scope: String (optional)
    ///   - state: String (optional)
    ///   - nonce: String (optional)
    ///   - codeChallenge: String (optional)
    ///   - codeChallengeMethod: String (optional)
    ///   - prompt: String (optional)
    ///   - maxAge: Int (optional)
    ///   - authorizationDetails: String (optional)
    ///   - resource: String (optional)
    ///   - audience: String (optional)
    ///   - requestUri: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2Authorize
    ///
    open func authorizePost(
        clientId: String? = nil,
        redirectUri: String? = nil,
        responseType: String? = nil,
        scope: String? = nil,
        state: String? = nil,
        nonce: String? = nil,
        codeChallenge: String? = nil,
        codeChallengeMethod: String? = nil,
        prompt: String? = nil,
        maxAge: Int? = nil,
        authorizationDetails: String? = nil,
        resource: String? = nil,
        audience: String? = nil,
        requestUri: String? = nil
    ) async throws -> AppwriteModels.Oauth2Authorize {
        let apiPath: String = "/oauth2/{project_id}/authorize"
            .replacingOccurrences(of: "{project_id}", with: client.config["project"] ?? "")

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
            "authorization_details": authorizationDetails,
            "resource": resource,
            "audience": audience,
            "request_uri": requestUri,
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Oauth2Authorize = { response in
            return AppwriteModels.Oauth2Authorize.from(map: response as! [String: Any])
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
    /// Start the OAuth2 Device Authorization Grant. Returns the device code, user
    /// code, verification URL, expiration, and polling interval.
    ///
    /// - Parameters:
    ///   - clientId: String (optional)
    ///   - scope: String (optional)
    ///   - authorizationDetails: String (optional)
    ///   - resource: String (optional)
    ///   - audience: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2DeviceAuthorization
    ///
    open func createDeviceAuthorization(
        clientId: String? = nil,
        scope: String? = nil,
        authorizationDetails: String? = nil,
        resource: String? = nil,
        audience: String? = nil
    ) async throws -> AppwriteModels.Oauth2DeviceAuthorization {
        let apiPath: String = "/oauth2/{project_id}/device_authorization"
            .replacingOccurrences(of: "{project_id}", with: client.config["project"] ?? "")

        let apiParams: [String: Any?] = [
            "client_id": clientId,
            "scope": scope,
            "authorization_details": authorizationDetails,
            "resource": resource,
            "audience": audience,
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Oauth2DeviceAuthorization = { response in
            return AppwriteModels.Oauth2DeviceAuthorization.from(map: response as! [String: Any])
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
    /// Exchange a device flow user code for an OAuth2 grant. The authenticated
    /// user is bound to the pending grant. Pass the returned grant ID to the get
    /// grant endpoint to render the consent screen, then to the approve or reject
    /// endpoint to complete the flow.
    ///
    /// - Parameters:
    ///   - userCode: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2Grant
    ///
    open func createGrant(
        userCode: String
    ) async throws -> AppwriteModels.Oauth2Grant {
        let apiPath: String = "/oauth2/{project_id}/grants"
            .replacingOccurrences(of: "{project_id}", with: client.config["project"] ?? "")

        let apiParams: [String: Any?] = [
            "user_code": userCode
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json",
            "accept": "application/json",
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
    ///   - grantId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2Grant
    ///
    open func getGrant(
        grantId: String
    ) async throws -> AppwriteModels.Oauth2Grant {
        if grantId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"grantId\"")
        }

        let apiPath: String = "/oauth2/{project_id}/grants/{grant_id}"
            .replacingOccurrences(of: "{project_id}", with: client.config["project"] ?? "")
            .replacingOccurrences(of: "{grant_id}", with: grantId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
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
    /// OpenID Connect RP-Initiated Logout. Ends the user session and revokes the
    /// tokens issued to the app identified by the `id_token_hint`, then redirects
    /// the user to `post_logout_redirect_uri` when it matches a URI registered on
    /// the app.
    ///
    /// - Parameters:
    ///   - idTokenHint: String (optional)
    ///   - logoutHint: String (optional)
    ///   - clientId: String (optional)
    ///   - postLogoutRedirectUri: String (optional)
    ///   - state: String (optional)
    ///   - uiLocales: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func logout(
        idTokenHint: String? = nil,
        logoutHint: String? = nil,
        clientId: String? = nil,
        postLogoutRedirectUri: String? = nil,
        state: String? = nil,
        uiLocales: String? = nil
    ) async throws -> Any {
        let apiPath: String = "/oauth2/{project_id}/logout"
            .replacingOccurrences(of: "{project_id}", with: client.config["project"] ?? "")

        let apiParams: [String: Any?] = [
            "id_token_hint": idTokenHint,
            "logout_hint": logoutHint,
            "client_id": clientId,
            "post_logout_redirect_uri": postLogoutRedirectUri,
            "state": state,
            "ui_locales": uiLocales,
        ]

        let apiHeaders: [String: String] = [
            "accept": "application/json"
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// OpenID Connect RP-Initiated Logout. Ends the user session and revokes the
    /// tokens issued to the app identified by the `id_token_hint`, then redirects
    /// the user to `post_logout_redirect_uri` when it matches a URI registered on
    /// the app.
    ///
    /// - Parameters:
    ///   - idTokenHint: String (optional)
    ///   - logoutHint: String (optional)
    ///   - clientId: String (optional)
    ///   - postLogoutRedirectUri: String (optional)
    ///   - state: String (optional)
    ///   - uiLocales: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func logoutPost(
        idTokenHint: String? = nil,
        logoutHint: String? = nil,
        clientId: String? = nil,
        postLogoutRedirectUri: String? = nil,
        state: String? = nil,
        uiLocales: String? = nil
    ) async throws -> Any {
        let apiPath: String = "/oauth2/{project_id}/logout"
            .replacingOccurrences(of: "{project_id}", with: client.config["project"] ?? "")

        let apiParams: [String: Any?] = [
            "id_token_hint": idTokenHint,
            "logout_hint": logoutHint,
            "client_id": clientId,
            "post_logout_redirect_uri": postLogoutRedirectUri,
            "state": state,
            "ui_locales": uiLocales,
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json",
            "accept": "application/json",
        ]

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// List the organizations the OAuth2 access token can access. Resolves the
    /// token's `organization` authorization details, expanding the `*` wildcard
    /// into the concrete set of organizations the user can see.
    ///
    /// - Parameters:
    ///   - limit: Int (optional)
    ///   - offset: Int (optional)
    ///   - search: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2OrganizationList
    ///
    open func listOrganizations(
        limit: Int? = nil,
        offset: Int? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.Oauth2OrganizationList {
        let apiPath: String = "/oauth2/{project_id}/organizations"
            .replacingOccurrences(of: "{project_id}", with: client.config["project"] ?? "")

        let apiParams: [String: Any?] = [
            "limit": limit,
            "offset": offset,
            "search": search,
        ]

        let apiHeaders: [String: String] = [
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Oauth2OrganizationList = { response in
            return AppwriteModels.Oauth2OrganizationList.from(map: response as! [String: Any])
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
    /// Store an OAuth2 authorization request server-side and receive a short-lived
    /// request_uri handle for the authorize endpoint.
    ///
    /// - Parameters:
    ///   - clientId: String
    ///   - redirectUri: String
    ///   - responseType: String
    ///   - scope: String (optional)
    ///   - state: String (optional)
    ///   - nonce: String (optional)
    ///   - codeChallenge: String (optional)
    ///   - codeChallengeMethod: String (optional)
    ///   - prompt: String (optional)
    ///   - maxAge: Int (optional)
    ///   - authorizationDetails: String (optional)
    ///   - resource: String (optional)
    ///   - audience: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2PAR
    ///
    open func createPAR(
        clientId: String,
        redirectUri: String,
        responseType: String,
        scope: String? = nil,
        state: String? = nil,
        nonce: String? = nil,
        codeChallenge: String? = nil,
        codeChallengeMethod: String? = nil,
        prompt: String? = nil,
        maxAge: Int? = nil,
        authorizationDetails: String? = nil,
        resource: String? = nil,
        audience: String? = nil
    ) async throws -> AppwriteModels.Oauth2PAR {
        let apiPath: String = "/oauth2/{project_id}/par"
            .replacingOccurrences(of: "{project_id}", with: client.config["project"] ?? "")

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
            "authorization_details": authorizationDetails,
            "resource": resource,
            "audience": audience,
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Oauth2PAR = { response in
            return AppwriteModels.Oauth2PAR.from(map: response as! [String: Any])
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
    /// List the projects the OAuth2 access token can access. Resolves the token's
    /// `project` authorization details, expanding the `*` wildcard into the
    /// concrete set of projects the user can see.
    ///
    /// - Parameters:
    ///   - limit: Int (optional)
    ///   - offset: Int (optional)
    ///   - search: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2ProjectList
    ///
    open func listProjects(
        limit: Int? = nil,
        offset: Int? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.Oauth2ProjectList {
        let apiPath: String = "/oauth2/{project_id}/projects"
            .replacingOccurrences(of: "{project_id}", with: client.config["project"] ?? "")

        let apiParams: [String: Any?] = [
            "limit": limit,
            "offset": offset,
            "search": search,
        ]

        let apiHeaders: [String: String] = [
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Oauth2ProjectList = { response in
            return AppwriteModels.Oauth2ProjectList.from(map: response as! [String: Any])
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
    ///   - grantId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2Reject
    ///
    open func reject(
        grantId: String
    ) async throws -> AppwriteModels.Oauth2Reject {
        let apiPath: String = "/oauth2/{project_id}/reject"
            .replacingOccurrences(of: "{project_id}", with: client.config["project"] ?? "")

        let apiParams: [String: Any?] = [
            "grant_id": grantId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json",
            "accept": "application/json",
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
    ///
    /// Revoke an OAuth2 access token or refresh token.
    ///
    /// - Parameters:
    ///   - token: String
    ///   - tokenTypeHint: String (optional)
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func revoke(
        token: String,
        tokenTypeHint: String? = nil,
        clientId: String? = nil,
        clientSecret: String? = nil
    ) async throws -> Any {
        let apiPath: String = "/oauth2/{project_id}/revoke"
            .replacingOccurrences(of: "{project_id}", with: client.config["project"] ?? "")

        let apiParams: [String: Any?] = [
            "token": token,
            "token_type_hint": tokenTypeHint,
            "client_id": clientId,
            "client_secret": clientSecret,
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json",
            "accept": "application/json",
        ]

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Exchange an OAuth2 authorization code, refresh token, or device code for
    /// access and refresh tokens.
    ///
    /// - Parameters:
    ///   - grantType: String
    ///   - code: String (optional)
    ///   - refreshToken: String (optional)
    ///   - deviceCode: String (optional)
    ///   - clientId: String (optional)
    ///   - clientSecret: String (optional)
    ///   - codeVerifier: String (optional)
    ///   - redirectUri: String (optional)
    ///   - resource: String (optional)
    ///   - audience: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Oauth2Token
    ///
    open func createToken(
        grantType: String,
        code: String? = nil,
        refreshToken: String? = nil,
        deviceCode: String? = nil,
        clientId: String? = nil,
        clientSecret: String? = nil,
        codeVerifier: String? = nil,
        redirectUri: String? = nil,
        resource: String? = nil,
        audience: String? = nil
    ) async throws -> AppwriteModels.Oauth2Token {
        let apiPath: String = "/oauth2/{project_id}/token"
            .replacingOccurrences(of: "{project_id}", with: client.config["project"] ?? "")

        let apiParams: [String: Any?] = [
            "grant_type": grantType,
            "code": code,
            "refresh_token": refreshToken,
            "device_code": deviceCode,
            "client_id": clientId,
            "client_secret": clientSecret,
            "code_verifier": codeVerifier,
            "redirect_uri": redirectUri,
            "resource": resource,
            "audience": audience,
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Oauth2Token = { response in
            return AppwriteModels.Oauth2Token.from(map: response as! [String: Any])
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
