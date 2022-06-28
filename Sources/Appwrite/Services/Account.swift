import AsyncHTTPClient
import Foundation
import NIO
import AppwriteModels

open class Account: Service {
    ///
    /// Get Account
    ///
    /// Get currently logged in user data as JSON object.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func get(
    ) async throws -> AppwriteModels.User {
        let path: String = "/account"
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Account
    ///
    /// Use this endpoint to allow a new user to register a new account in your
    /// project. After the user registration completes successfully, you can use
    /// the [/account/verfication](/docs/client/account#accountCreateVerification)
    /// route to start verifying the user email address. To allow the new user to
    /// login to their new account, you need to create a new [account
    /// session](/docs/client/account#accountCreateSession).
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func create(
        userId: String,
        email: String,
        password: String,
        name: String? = nil
    ) async throws -> AppwriteModels.User {
        let path: String = "/account"
        let params: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "name": name
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
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
    /// Update Account Email
    ///
    /// Update currently logged in user account email address. After changing user
    /// address, the user confirmation status will get reset. A new confirmation
    /// email is not sent automatically however you can use the send confirmation
    /// email endpoint again to send the confirmation email. For security measures,
    /// user password is required to complete this request.
    /// This endpoint can also be used to convert an anonymous account to a normal
    /// one, by passing an email address and a new password.
    /// 
    ///
    /// @param String email
    /// @param String password
    /// @throws Exception
    /// @return array
    ///
    open func updateEmail(
        email: String,
        password: String
    ) async throws -> AppwriteModels.User {
        let path: String = "/account/email"
        let params: [String: Any?] = [
            "email": email,
            "password": password
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
        }
        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Account JWT
    ///
    /// Use this endpoint to create a JSON Web Token. You can use the resulting JWT
    /// to authenticate on behalf of the current user when working with the
    /// Appwrite server-side API and SDKs. The JWT secret is valid for 15 minutes
    /// from its creation and will be invalid if the user will logout in that time
    /// frame.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func createJWT(
    ) async throws -> AppwriteModels.Jwt {
        let path: String = "/account/jwt"
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Jwt = { dict in
            return AppwriteModels.Jwt.from(map: dict)
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
    /// Get Account Logs
    ///
    /// Get currently logged in user list of latest security activity logs. Each
    /// log returns user IP address, location and date and time of log.
    ///
    /// @param Int limit
    /// @param Int offset
    /// @throws Exception
    /// @return array
    ///
    open func getLogs(
        limit: Int? = nil,
        offset: Int? = nil
    ) async throws -> AppwriteModels.LogList {
        let path: String = "/account/logs"
        let params: [String: Any?] = [
            "limit": limit,
            "offset": offset
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.LogList = { dict in
            return AppwriteModels.LogList.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Account Name
    ///
    /// Update currently logged in user account name.
    ///
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func updateName(
        name: String
    ) async throws -> AppwriteModels.User {
        let path: String = "/account/name"
        let params: [String: Any?] = [
            "name": name
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
        }
        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Account Password
    ///
    /// Update currently logged in user password. For validation, user is required
    /// to pass in the new password, and the old password. For users created with
    /// OAuth, Team Invites and Magic URL, oldPassword is optional.
    ///
    /// @param String password
    /// @param String oldPassword
    /// @throws Exception
    /// @return array
    ///
    open func updatePassword(
        password: String,
        oldPassword: String? = nil
    ) async throws -> AppwriteModels.User {
        let path: String = "/account/password"
        let params: [String: Any?] = [
            "password": password,
            "oldPassword": oldPassword
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
        }
        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Account Phone
    ///
    /// Update currently logged in user account phone number. After changing phone
    /// number, the user confirmation status will get reset. A new confirmation SMS
    /// is not sent automatically however you can use the phone confirmation
    /// endpoint again to send the confirmation SMS.
    ///
    /// @param String number
    /// @param String password
    /// @throws Exception
    /// @return array
    ///
    open func updatePhone(
        number: String,
        password: String
    ) async throws -> AppwriteModels.User {
        let path: String = "/account/phone"
        let params: [String: Any?] = [
            "number": number,
            "password": password
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
        }
        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Account Preferences
    ///
    /// Get currently logged in user preferences as a key-value object.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getPrefs(
    ) async throws -> AppwriteModels.Preferences {
        let path: String = "/account/prefs"
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Preferences = { dict in
            return AppwriteModels.Preferences.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Account Preferences
    ///
    /// Update currently logged in user account preferences. The object you pass is
    /// stored as is, and replaces any previous value. The maximum allowed prefs
    /// size is 64kB and throws error if exceeded.
    ///
    /// @param Any prefs
    /// @throws Exception
    /// @return array
    ///
    open func updatePrefs(
        prefs: Any
    ) async throws -> AppwriteModels.User {
        let path: String = "/account/prefs"
        let params: [String: Any?] = [
            "prefs": prefs
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
        }
        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Password Recovery
    ///
    /// Sends the user an email with a temporary secret key for password reset.
    /// When the user clicks the confirmation link he is redirected back to your
    /// app password reset URL with the secret key and email address values
    /// attached to the URL query string. Use the query string params to submit a
    /// request to the [PUT
    /// /account/recovery](/docs/client/account#accountUpdateRecovery) endpoint to
    /// complete the process. The verification link sent to the user's email
    /// address is valid for 1 hour.
    ///
    /// @param String email
    /// @param String url
    /// @throws Exception
    /// @return array
    ///
    open func createRecovery(
        email: String,
        url: String
    ) async throws -> AppwriteModels.Token {
        let path: String = "/account/recovery"
        let params: [String: Any?] = [
            "email": email,
            "url": url
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Token = { dict in
            return AppwriteModels.Token.from(map: dict)
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
    /// Create Password Recovery (confirmation)
    ///
    /// Use this endpoint to complete the user account password reset. Both the
    /// **userId** and **secret** arguments will be passed as query parameters to
    /// the redirect URL you have provided when sending your request to the [POST
    /// /account/recovery](/docs/client/account#accountCreateRecovery) endpoint.
    /// 
    /// Please note that in order to avoid a [Redirect
    /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
    /// the only valid redirect URLs are the ones from domains you have set when
    /// adding your platforms in the console interface.
    ///
    /// @param String userId
    /// @param String secret
    /// @param String password
    /// @param String passwordAgain
    /// @throws Exception
    /// @return array
    ///
    open func updateRecovery(
        userId: String,
        secret: String,
        password: String,
        passwordAgain: String
    ) async throws -> AppwriteModels.Token {
        let path: String = "/account/recovery"
        let params: [String: Any?] = [
            "userId": userId,
            "secret": secret,
            "password": password,
            "passwordAgain": passwordAgain
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Token = { dict in
            return AppwriteModels.Token.from(map: dict)
        }
        return try await client.call(
            method: "PUT",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Account Sessions
    ///
    /// Get currently logged in user list of active sessions across different
    /// devices.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getSessions(
    ) async throws -> AppwriteModels.SessionList {
        let path: String = "/account/sessions"
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.SessionList = { dict in
            return AppwriteModels.SessionList.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Delete All Account Sessions
    ///
    /// Delete all sessions from the user account and remove any sessions cookies
    /// from the end client.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func deleteSessions(
    ) async throws -> Any {
        let path: String = "/account/sessions"
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        return try await client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params        )
    }

    ///
    /// Create Anonymous Session
    ///
    /// Use this endpoint to allow a new user to register an anonymous account in
    /// your project. This route will also create a new session for the user. To
    /// allow the new user to convert an anonymous account to a normal account, you
    /// need to update its [email and
    /// password](/docs/client/account#accountUpdateEmail) or create an [OAuth2
    /// session](/docs/client/account#accountCreateOAuth2Session).
    ///
    /// @throws Exception
    /// @return array
    ///
    open func createAnonymousSession(
    ) async throws -> AppwriteModels.Session {
        let path: String = "/account/sessions/anonymous"
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Session = { dict in
            return AppwriteModels.Session.from(map: dict)
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
    /// Create Account Session with Email
    ///
    /// Allow the user to login into their account by providing a valid email and
    /// password combination. This route will create a new session for the user.
    ///
    /// @param String email
    /// @param String password
    /// @throws Exception
    /// @return array
    ///
    open func createEmailSession(
        email: String,
        password: String
    ) async throws -> AppwriteModels.Session {
        let path: String = "/account/sessions/email"
        let params: [String: Any?] = [
            "email": email,
            "password": password
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Session = { dict in
            return AppwriteModels.Session.from(map: dict)
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
    /// Create Magic URL session
    ///
    /// Sends the user an email with a secret key for creating a session. When the
    /// user clicks the link in the email, the user is redirected back to the URL
    /// you provided with the secret key and userId values attached to the URL
    /// query string. Use the query string parameters to submit a request to the
    /// [PUT
    /// /account/sessions/magic-url](/docs/client/account#accountUpdateMagicURLSession)
    /// endpoint to complete the login process. The link sent to the user's email
    /// address is valid for 1 hour. If you are on a mobile device you can leave
    /// the URL parameter empty, so that the login completion will be handled by
    /// your Appwrite instance by default.
    ///
    /// @param String userId
    /// @param String email
    /// @param String url
    /// @throws Exception
    /// @return array
    ///
    open func createMagicURLSession(
        userId: String,
        email: String,
        url: String? = nil
    ) async throws -> AppwriteModels.Token {
        let path: String = "/account/sessions/magic-url"
        let params: [String: Any?] = [
            "userId": userId,
            "email": email,
            "url": url
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Token = { dict in
            return AppwriteModels.Token.from(map: dict)
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
    /// Create Magic URL session (confirmation)
    ///
    /// Use this endpoint to complete creating the session with the Magic URL. Both
    /// the **userId** and **secret** arguments will be passed as query parameters
    /// to the redirect URL you have provided when sending your request to the
    /// [POST
    /// /account/sessions/magic-url](/docs/client/account#accountCreateMagicURLSession)
    /// endpoint.
    /// 
    /// Please note that in order to avoid a [Redirect
    /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
    /// the only valid redirect URLs are the ones from domains you have set when
    /// adding your platforms in the console interface.
    ///
    /// @param String userId
    /// @param String secret
    /// @throws Exception
    /// @return array
    ///
    open func updateMagicURLSession(
        userId: String,
        secret: String
    ) async throws -> AppwriteModels.Session {
        let path: String = "/account/sessions/magic-url"
        let params: [String: Any?] = [
            "userId": userId,
            "secret": secret
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Session = { dict in
            return AppwriteModels.Session.from(map: dict)
        }
        return try await client.call(
            method: "PUT",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Account Session with OAuth2
    ///
    /// Allow the user to login to their account using the OAuth2 provider of their
    /// choice. Each OAuth2 provider should be enabled from the Appwrite console
    /// first. Use the success and failure arguments to provide a redirect URL's
    /// back to your app when login is completed.
    /// 
    /// If there is already an active session, the new session will be attached to
    /// the logged-in account. If there are no active sessions, the server will
    /// attempt to look for a user with the same email address as the email
    /// received from the OAuth2 provider and attach the new session to the
    /// existing user. If no matching user is found - the server will create a new
    /// user..
    /// 
    ///
    /// @param String provider
    /// @param String success
    /// @param String failure
    /// @param [Any] scopes
    /// @throws Exception
    /// @return array
    ///
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    open func createOAuth2Session(
        provider: String,
        success: String? = nil,
        failure: String? = nil,
        scopes: [Any]? = nil
    ) async throws -> Bool {
        var path: String = "/account/sessions/oauth2/{provider}"
        path = path.replacingOccurrences(
          of: "{provider}",
          with: provider
        )
        let params: [String: Any?] = [
            "success": success,
            "failure": failure,
            "scopes": scopes,
            "project": client.config["project"]
        ]
        let query = "?\(client.parametersToQueryString(params: params))"
        let url = URL(string: client.endPoint + path + query)!
        let callbackScheme = "appwrite-callback-\(client.config["project"] ?? "")"
        let group = DispatchGroup()

        group.enter()
        WebAuthComponent.authenticate(url: url, callbackScheme: callbackScheme) { result in
            group.leave()
        }
        group.wait()
        
        return true
    }

    ///
    /// Create Phone session
    ///
    /// Sends the user a SMS with a secret key for creating a session. Use the
    /// returned user ID and the secret to submit a request to the [PUT
    /// /account/sessions/phone](/docs/client/account#accountUpdatePhoneSession)
    /// endpoint to complete the login process. The secret sent to the user's phone
    /// is valid for 15 minutes.
    ///
    /// @param String userId
    /// @param String number
    /// @throws Exception
    /// @return array
    ///
    open func createPhoneSession(
        userId: String,
        number: String
    ) async throws -> AppwriteModels.Token {
        let path: String = "/account/sessions/phone"
        let params: [String: Any?] = [
            "userId": userId,
            "number": number
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Token = { dict in
            return AppwriteModels.Token.from(map: dict)
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
    /// Create Phone session (confirmation)
    ///
    /// Use this endpoint to complete creating the session with the Magic URL. Both
    /// the **userId** and **secret** arguments will be passed as query parameters
    /// to the redirect URL you have provided when sending your request to the
    /// [POST
    /// /account/sessions/magic-url](/docs/client/account#accountCreateMagicURLSession)
    /// endpoint.
    /// 
    /// Please note that in order to avoid a [Redirect
    /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
    /// the only valid redirect URLs are the ones from domains you have set when
    /// adding your platforms in the console interface.
    ///
    /// @param String userId
    /// @param String secret
    /// @throws Exception
    /// @return array
    ///
    open func updatePhoneSession(
        userId: String,
        secret: String
    ) async throws -> AppwriteModels.Session {
        let path: String = "/account/sessions/phone"
        let params: [String: Any?] = [
            "userId": userId,
            "secret": secret
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Session = { dict in
            return AppwriteModels.Session.from(map: dict)
        }
        return try await client.call(
            method: "PUT",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Session By ID
    ///
    /// Use this endpoint to get a logged in user's session using a Session ID.
    /// Inputting 'current' will return the current session being used.
    ///
    /// @param String sessionId
    /// @throws Exception
    /// @return array
    ///
    open func getSession(
        sessionId: String
    ) async throws -> AppwriteModels.Session {
        var path: String = "/account/sessions/{sessionId}"
        path = path.replacingOccurrences(
          of: "{sessionId}",
          with: sessionId
        )
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Session = { dict in
            return AppwriteModels.Session.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Session (Refresh Tokens)
    ///
    /// Access tokens have limited lifespan and expire to mitigate security risks.
    /// If session was created using an OAuth provider, this route can be used to
    /// "refresh" the access token.
    ///
    /// @param String sessionId
    /// @throws Exception
    /// @return array
    ///
    open func updateSession(
        sessionId: String
    ) async throws -> AppwriteModels.Session {
        var path: String = "/account/sessions/{sessionId}"
        path = path.replacingOccurrences(
          of: "{sessionId}",
          with: sessionId
        )
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Session = { dict in
            return AppwriteModels.Session.from(map: dict)
        }
        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Delete Account Session
    ///
    /// Use this endpoint to log out the currently logged in user from all their
    /// account sessions across all of their different devices. When using the
    /// Session ID argument, only the unique session ID provided is deleted.
    /// 
    ///
    /// @param String sessionId
    /// @throws Exception
    /// @return array
    ///
    open func deleteSession(
        sessionId: String
    ) async throws -> Any {
        var path: String = "/account/sessions/{sessionId}"
        path = path.replacingOccurrences(
          of: "{sessionId}",
          with: sessionId
        )
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        return try await client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params        )
    }

    ///
    /// Update Account Status
    ///
    /// Block the currently logged in user account. Behind the scene, the user
    /// record is not deleted but permanently blocked from any access. To
    /// completely delete a user, use the Users API instead.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func updateStatus(
    ) async throws -> AppwriteModels.User {
        let path: String = "/account/status"
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.User = { dict in
            return AppwriteModels.User.from(map: dict)
        }
        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Email Verification
    ///
    /// Use this endpoint to send a verification message to your user email address
    /// to confirm they are the valid owners of that address. Both the **userId**
    /// and **secret** arguments will be passed as query parameters to the URL you
    /// have provided to be attached to the verification email. The provided URL
    /// should redirect the user back to your app and allow you to complete the
    /// verification process by verifying both the **userId** and **secret**
    /// parameters. Learn more about how to [complete the verification
    /// process](/docs/client/account#accountUpdateEmailVerification). The
    /// verification link sent to the user's email address is valid for 7 days.
    /// 
    /// Please note that in order to avoid a [Redirect
    /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md),
    /// the only valid redirect URLs are the ones from domains you have set when
    /// adding your platforms in the console interface.
    /// 
    ///
    /// @param String url
    /// @throws Exception
    /// @return array
    ///
    open func createVerification(
        url: String
    ) async throws -> AppwriteModels.Token {
        let path: String = "/account/verification"
        let params: [String: Any?] = [
            "url": url
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Token = { dict in
            return AppwriteModels.Token.from(map: dict)
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
    /// Create Email Verification (confirmation)
    ///
    /// Use this endpoint to complete the user email verification process. Use both
    /// the **userId** and **secret** parameters that were attached to your app URL
    /// to verify the user email ownership. If confirmed this route will return a
    /// 200 status code.
    ///
    /// @param String userId
    /// @param String secret
    /// @throws Exception
    /// @return array
    ///
    open func updateVerification(
        userId: String,
        secret: String
    ) async throws -> AppwriteModels.Token {
        let path: String = "/account/verification"
        let params: [String: Any?] = [
            "userId": userId,
            "secret": secret
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Token = { dict in
            return AppwriteModels.Token.from(map: dict)
        }
        return try await client.call(
            method: "PUT",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Phone Verification
    ///
    /// Use this endpoint to send a verification message to your user's phone
    /// number to confirm they are the valid owners of that address. The provided
    /// secret should allow you to complete the verification process by verifying
    /// both the **userId** and **secret** parameters. Learn more about how to
    /// [complete the verification
    /// process](/docs/client/account#accountUpdatePhoneVerification). The
    /// verification link sent to the user's phone number is valid for 15 minutes.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func createPhoneVerification(
    ) async throws -> AppwriteModels.Token {
        let path: String = "/account/verification/phone"
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Token = { dict in
            return AppwriteModels.Token.from(map: dict)
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
    /// Create Phone Verification (confirmation)
    ///
    /// Use this endpoint to complete the user phone verification process. Use the
    /// **userId** and **secret** that were sent to your user's phone number to
    /// verify the user email ownership. If confirmed this route will return a 200
    /// status code.
    ///
    /// @param String userId
    /// @param String secret
    /// @throws Exception
    /// @return array
    ///
    open func updatePhoneVerification(
        userId: String,
        secret: String
    ) async throws -> AppwriteModels.Token {
        let path: String = "/account/verification/phone"
        let params: [String: Any?] = [
            "userId": userId,
            "secret": secret
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Token = { dict in
            return AppwriteModels.Token.from(map: dict)
        }
        return try await client.call(
            method: "PUT",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }


    ///
    /// Get Account
    ///
    /// Get currently logged in user data as JSON object.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func get(
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await get(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Account
    ///
    /// Use this endpoint to allow a new user to register a new account in your
    /// project. After the user registration completes successfully, you can use
    /// the [/account/verfication](/docs/client/account#accountCreateVerification)
    /// route to start verifying the user email address. To allow the new user to
    /// login to their new account, you need to create a new [account
    /// session](/docs/client/account#accountCreateSession).
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func create(
        userId: String,
        email: String,
        password: String,
        name: String? = nil,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await create(
                    userId: userId,
                    email: email,
                    password: password,
                    name: name
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Update Account Email
    ///
    /// Update currently logged in user account email address. After changing user
    /// address, the user confirmation status will get reset. A new confirmation
    /// email is not sent automatically however you can use the send confirmation
    /// email endpoint again to send the confirmation email. For security measures,
    /// user password is required to complete this request.
    /// This endpoint can also be used to convert an anonymous account to a normal
    /// one, by passing an email address and a new password.
    /// 
    ///
    /// @param String email
    /// @param String password
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateEmail(
        email: String,
        password: String,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateEmail(
                    email: email,
                    password: password
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Account JWT
    ///
    /// Use this endpoint to create a JSON Web Token. You can use the resulting JWT
    /// to authenticate on behalf of the current user when working with the
    /// Appwrite server-side API and SDKs. The JWT secret is valid for 15 minutes
    /// from its creation and will be invalid if the user will logout in that time
    /// frame.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createJWT(
        completion: ((Result<AppwriteModels.Jwt, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createJWT(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Account Logs
    ///
    /// Get currently logged in user list of latest security activity logs. Each
    /// log returns user IP address, location and date and time of log.
    ///
    /// @param Int limit
    /// @param Int offset
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getLogs(
        limit: Int? = nil,
        offset: Int? = nil,
        completion: ((Result<AppwriteModels.LogList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getLogs(
                    limit: limit,
                    offset: offset
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Update Account Name
    ///
    /// Update currently logged in user account name.
    ///
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateName(
        name: String,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateName(
                    name: name
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Update Account Password
    ///
    /// Update currently logged in user password. For validation, user is required
    /// to pass in the new password, and the old password. For users created with
    /// OAuth, Team Invites and Magic URL, oldPassword is optional.
    ///
    /// @param String password
    /// @param String oldPassword
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updatePassword(
        password: String,
        oldPassword: String? = nil,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updatePassword(
                    password: password,
                    oldPassword: oldPassword
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Update Account Phone
    ///
    /// Update currently logged in user account phone number. After changing phone
    /// number, the user confirmation status will get reset. A new confirmation SMS
    /// is not sent automatically however you can use the phone confirmation
    /// endpoint again to send the confirmation SMS.
    ///
    /// @param String number
    /// @param String password
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updatePhone(
        number: String,
        password: String,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updatePhone(
                    number: number,
                    password: password
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Account Preferences
    ///
    /// Get currently logged in user preferences as a key-value object.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getPrefs(
        completion: ((Result<AppwriteModels.Preferences, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getPrefs(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Update Account Preferences
    ///
    /// Update currently logged in user account preferences. The object you pass is
    /// stored as is, and replaces any previous value. The maximum allowed prefs
    /// size is 64kB and throws error if exceeded.
    ///
    /// @param Any prefs
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updatePrefs(
        prefs: Any,
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updatePrefs(
                    prefs: prefs
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Password Recovery
    ///
    /// Sends the user an email with a temporary secret key for password reset.
    /// When the user clicks the confirmation link he is redirected back to your
    /// app password reset URL with the secret key and email address values
    /// attached to the URL query string. Use the query string params to submit a
    /// request to the [PUT
    /// /account/recovery](/docs/client/account#accountUpdateRecovery) endpoint to
    /// complete the process. The verification link sent to the user's email
    /// address is valid for 1 hour.
    ///
    /// @param String email
    /// @param String url
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createRecovery(
        email: String,
        url: String,
        completion: ((Result<AppwriteModels.Token, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createRecovery(
                    email: email,
                    url: url
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Password Recovery (confirmation)
    ///
    /// Use this endpoint to complete the user account password reset. Both the
    /// **userId** and **secret** arguments will be passed as query parameters to
    /// the redirect URL you have provided when sending your request to the [POST
    /// /account/recovery](/docs/client/account#accountCreateRecovery) endpoint.
    /// 
    /// Please note that in order to avoid a [Redirect
    /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
    /// the only valid redirect URLs are the ones from domains you have set when
    /// adding your platforms in the console interface.
    ///
    /// @param String userId
    /// @param String secret
    /// @param String password
    /// @param String passwordAgain
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateRecovery(
        userId: String,
        secret: String,
        password: String,
        passwordAgain: String,
        completion: ((Result<AppwriteModels.Token, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateRecovery(
                    userId: userId,
                    secret: secret,
                    password: password,
                    passwordAgain: passwordAgain
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Account Sessions
    ///
    /// Get currently logged in user list of active sessions across different
    /// devices.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getSessions(
        completion: ((Result<AppwriteModels.SessionList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getSessions(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Delete All Account Sessions
    ///
    /// Delete all sessions from the user account and remove any sessions cookies
    /// from the end client.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func deleteSessions(
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await deleteSessions(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Anonymous Session
    ///
    /// Use this endpoint to allow a new user to register an anonymous account in
    /// your project. This route will also create a new session for the user. To
    /// allow the new user to convert an anonymous account to a normal account, you
    /// need to update its [email and
    /// password](/docs/client/account#accountUpdateEmail) or create an [OAuth2
    /// session](/docs/client/account#accountCreateOAuth2Session).
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createAnonymousSession(
        completion: ((Result<AppwriteModels.Session, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createAnonymousSession(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Account Session with Email
    ///
    /// Allow the user to login into their account by providing a valid email and
    /// password combination. This route will create a new session for the user.
    ///
    /// @param String email
    /// @param String password
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createEmailSession(
        email: String,
        password: String,
        completion: ((Result<AppwriteModels.Session, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createEmailSession(
                    email: email,
                    password: password
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Magic URL session
    ///
    /// Sends the user an email with a secret key for creating a session. When the
    /// user clicks the link in the email, the user is redirected back to the URL
    /// you provided with the secret key and userId values attached to the URL
    /// query string. Use the query string parameters to submit a request to the
    /// [PUT
    /// /account/sessions/magic-url](/docs/client/account#accountUpdateMagicURLSession)
    /// endpoint to complete the login process. The link sent to the user's email
    /// address is valid for 1 hour. If you are on a mobile device you can leave
    /// the URL parameter empty, so that the login completion will be handled by
    /// your Appwrite instance by default.
    ///
    /// @param String userId
    /// @param String email
    /// @param String url
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createMagicURLSession(
        userId: String,
        email: String,
        url: String? = nil,
        completion: ((Result<AppwriteModels.Token, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createMagicURLSession(
                    userId: userId,
                    email: email,
                    url: url
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Magic URL session (confirmation)
    ///
    /// Use this endpoint to complete creating the session with the Magic URL. Both
    /// the **userId** and **secret** arguments will be passed as query parameters
    /// to the redirect URL you have provided when sending your request to the
    /// [POST
    /// /account/sessions/magic-url](/docs/client/account#accountCreateMagicURLSession)
    /// endpoint.
    /// 
    /// Please note that in order to avoid a [Redirect
    /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
    /// the only valid redirect URLs are the ones from domains you have set when
    /// adding your platforms in the console interface.
    ///
    /// @param String userId
    /// @param String secret
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateMagicURLSession(
        userId: String,
        secret: String,
        completion: ((Result<AppwriteModels.Session, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateMagicURLSession(
                    userId: userId,
                    secret: secret
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Account Session with OAuth2
    ///
    /// Allow the user to login to their account using the OAuth2 provider of their
    /// choice. Each OAuth2 provider should be enabled from the Appwrite console
    /// first. Use the success and failure arguments to provide a redirect URL's
    /// back to your app when login is completed.
    /// 
    /// If there is already an active session, the new session will be attached to
    /// the logged-in account. If there are no active sessions, the server will
    /// attempt to look for a user with the same email address as the email
    /// received from the OAuth2 provider and attach the new session to the
    /// existing user. If no matching user is found - the server will create a new
    /// user..
    /// 
    ///
    /// @param String provider
    /// @param String success
    /// @param String failure
    /// @param [Any] scopes
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    open func createOAuth2Session(
        provider: String,
        success: String? = nil,
        failure: String? = nil,
        scopes: [Any]? = nil,
        completion: ((Result<Bool, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createOAuth2Session(
                    provider: provider,
                    success: success,
                    failure: failure,
                    scopes: scopes
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Phone session
    ///
    /// Sends the user a SMS with a secret key for creating a session. Use the
    /// returned user ID and the secret to submit a request to the [PUT
    /// /account/sessions/phone](/docs/client/account#accountUpdatePhoneSession)
    /// endpoint to complete the login process. The secret sent to the user's phone
    /// is valid for 15 minutes.
    ///
    /// @param String userId
    /// @param String number
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createPhoneSession(
        userId: String,
        number: String,
        completion: ((Result<AppwriteModels.Token, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createPhoneSession(
                    userId: userId,
                    number: number
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Phone session (confirmation)
    ///
    /// Use this endpoint to complete creating the session with the Magic URL. Both
    /// the **userId** and **secret** arguments will be passed as query parameters
    /// to the redirect URL you have provided when sending your request to the
    /// [POST
    /// /account/sessions/magic-url](/docs/client/account#accountCreateMagicURLSession)
    /// endpoint.
    /// 
    /// Please note that in order to avoid a [Redirect
    /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
    /// the only valid redirect URLs are the ones from domains you have set when
    /// adding your platforms in the console interface.
    ///
    /// @param String userId
    /// @param String secret
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updatePhoneSession(
        userId: String,
        secret: String,
        completion: ((Result<AppwriteModels.Session, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updatePhoneSession(
                    userId: userId,
                    secret: secret
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Session By ID
    ///
    /// Use this endpoint to get a logged in user's session using a Session ID.
    /// Inputting 'current' will return the current session being used.
    ///
    /// @param String sessionId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getSession(
        sessionId: String,
        completion: ((Result<AppwriteModels.Session, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getSession(
                    sessionId: sessionId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Update Session (Refresh Tokens)
    ///
    /// Access tokens have limited lifespan and expire to mitigate security risks.
    /// If session was created using an OAuth provider, this route can be used to
    /// "refresh" the access token.
    ///
    /// @param String sessionId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateSession(
        sessionId: String,
        completion: ((Result<AppwriteModels.Session, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateSession(
                    sessionId: sessionId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Delete Account Session
    ///
    /// Use this endpoint to log out the currently logged in user from all their
    /// account sessions across all of their different devices. When using the
    /// Session ID argument, only the unique session ID provided is deleted.
    /// 
    ///
    /// @param String sessionId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func deleteSession(
        sessionId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await deleteSession(
                    sessionId: sessionId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Update Account Status
    ///
    /// Block the currently logged in user account. Behind the scene, the user
    /// record is not deleted but permanently blocked from any access. To
    /// completely delete a user, use the Users API instead.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateStatus(
        completion: ((Result<AppwriteModels.User, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateStatus(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Email Verification
    ///
    /// Use this endpoint to send a verification message to your user email address
    /// to confirm they are the valid owners of that address. Both the **userId**
    /// and **secret** arguments will be passed as query parameters to the URL you
    /// have provided to be attached to the verification email. The provided URL
    /// should redirect the user back to your app and allow you to complete the
    /// verification process by verifying both the **userId** and **secret**
    /// parameters. Learn more about how to [complete the verification
    /// process](/docs/client/account#accountUpdateEmailVerification). The
    /// verification link sent to the user's email address is valid for 7 days.
    /// 
    /// Please note that in order to avoid a [Redirect
    /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md),
    /// the only valid redirect URLs are the ones from domains you have set when
    /// adding your platforms in the console interface.
    /// 
    ///
    /// @param String url
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createVerification(
        url: String,
        completion: ((Result<AppwriteModels.Token, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createVerification(
                    url: url
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Email Verification (confirmation)
    ///
    /// Use this endpoint to complete the user email verification process. Use both
    /// the **userId** and **secret** parameters that were attached to your app URL
    /// to verify the user email ownership. If confirmed this route will return a
    /// 200 status code.
    ///
    /// @param String userId
    /// @param String secret
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateVerification(
        userId: String,
        secret: String,
        completion: ((Result<AppwriteModels.Token, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateVerification(
                    userId: userId,
                    secret: secret
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Phone Verification
    ///
    /// Use this endpoint to send a verification message to your user's phone
    /// number to confirm they are the valid owners of that address. The provided
    /// secret should allow you to complete the verification process by verifying
    /// both the **userId** and **secret** parameters. Learn more about how to
    /// [complete the verification
    /// process](/docs/client/account#accountUpdatePhoneVerification). The
    /// verification link sent to the user's phone number is valid for 15 minutes.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createPhoneVerification(
        completion: ((Result<AppwriteModels.Token, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createPhoneVerification(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Phone Verification (confirmation)
    ///
    /// Use this endpoint to complete the user phone verification process. Use the
    /// **userId** and **secret** that were sent to your user's phone number to
    /// verify the user email ownership. If confirmed this route will return a 200
    /// status code.
    ///
    /// @param String userId
    /// @param String secret
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updatePhoneVerification(
        userId: String,
        secret: String,
        completion: ((Result<AppwriteModels.Token, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updatePhoneVerification(
                    userId: userId,
                    secret: secret
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

}
