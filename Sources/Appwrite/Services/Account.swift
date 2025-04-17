import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Account service allows you to authenticate and manage a user account.
open class Account: Service {

    ///
    /// Get the currently logged in user.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func get<T>(
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/account"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
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
    /// Get the currently logged in user.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func get(
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await get(
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Use this endpoint to allow a new user to register a new account in your
    /// project. After the user registration completes successfully, you can use
    /// the
    /// [/account/verfication](https://appwrite.io/docs/references/cloud/client-web/account#createVerification)
    /// route to start verifying the user email address. To allow the new user to
    /// login to their new account, you need to create a new [account
    /// session](https://appwrite.io/docs/references/cloud/client-web/account#createEmailSession).
    ///
    /// @param String userId
    /// @param String email
    /// @param String password
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func create<T>(
        userId: String,
        email: String,
        password: String,
        name: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/account"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "email": email,
            "password": password,
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
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
    /// Use this endpoint to allow a new user to register a new account in your
    /// project. After the user registration completes successfully, you can use
    /// the
    /// [/account/verfication](https://appwrite.io/docs/references/cloud/client-web/account#createVerification)
    /// route to start verifying the user email address. To allow the new user to
    /// login to their new account, you need to create a new [account
    /// session](https://appwrite.io/docs/references/cloud/client-web/account#createEmailSession).
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
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await create(
            userId: userId,
            email: email,
            password: password,
            name: name,
            nestedType: [String: AnyCodable].self
        )
    }

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
    open func updateEmail<T>(
        email: String,
        password: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/account/email"

        let apiParams: [String: Any?] = [
            "email": email,
            "password": password
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

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
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updateEmail(
            email: email,
            password: password,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Get the list of identities for the currently logged in user.
    ///
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func listIdentities(
        queries: [String]? = nil
    ) async throws -> AppwriteModels.IdentityList {
        let apiPath: String = "/account/identities"

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.IdentityList = { response in
            return AppwriteModels.IdentityList.from(map: response as! [String: Any])
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
    /// Delete an identity by its unique ID.
    ///
    /// @param String identityId
    /// @throws Exception
    /// @return array
    ///
    open func deleteIdentity(
        identityId: String
    ) async throws -> Any {
        let apiPath: String = "/account/identities/{identityId}"
            .replacingOccurrences(of: "{identityId}", with: identityId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

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
        let apiPath: String = "/account/jwts"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Jwt = { response in
            return AppwriteModels.Jwt.from(map: response as! [String: Any])
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
    /// Get the list of latest security activity logs for the currently logged in
    /// user. Each log returns user IP address, location and date and time of log.
    ///
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func listLogs(
        queries: [String]? = nil
    ) async throws -> AppwriteModels.LogList {
        let apiPath: String = "/account/logs"

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.LogList = { response in
            return AppwriteModels.LogList.from(map: response as! [String: Any])
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
    /// Enable or disable MFA on an account.
    ///
    /// @param Bool mfa
    /// @throws Exception
    /// @return array
    ///
    open func updateMFA<T>(
        mfa: Bool,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/account/mfa"

        let apiParams: [String: Any?] = [
            "mfa": mfa
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Enable or disable MFA on an account.
    ///
    /// @param Bool mfa
    /// @throws Exception
    /// @return array
    ///
    open func updateMFA(
        mfa: Bool
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updateMFA(
            mfa: mfa,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Add an authenticator app to be used as an MFA factor. Verify the
    /// authenticator using the [verify
    /// authenticator](/docs/references/cloud/client-web/account#updateMfaAuthenticator)
    /// method.
    ///
    /// @param AppwriteEnums.AuthenticatorType type
    /// @throws Exception
    /// @return array
    ///
    open func createMfaAuthenticator(
        type: AppwriteEnums.AuthenticatorType
    ) async throws -> AppwriteModels.MfaType {
        let apiPath: String = "/account/mfa/authenticators/{type}"
            .replacingOccurrences(of: "{type}", with: type.rawValue)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.MfaType = { response in
            return AppwriteModels.MfaType.from(map: response as! [String: Any])
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
    /// Verify an authenticator app after adding it using the [add
    /// authenticator](/docs/references/cloud/client-web/account#createMfaAuthenticator)
    /// method.
    ///
    /// @param AppwriteEnums.AuthenticatorType type
    /// @param String otp
    /// @throws Exception
    /// @return array
    ///
    open func updateMfaAuthenticator<T>(
        type: AppwriteEnums.AuthenticatorType,
        otp: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/account/mfa/authenticators/{type}"
            .replacingOccurrences(of: "{type}", with: type.rawValue)

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
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Verify an authenticator app after adding it using the [add
    /// authenticator](/docs/references/cloud/client-web/account#createMfaAuthenticator)
    /// method.
    ///
    /// @param AppwriteEnums.AuthenticatorType type
    /// @param String otp
    /// @throws Exception
    /// @return array
    ///
    open func updateMfaAuthenticator(
        type: AppwriteEnums.AuthenticatorType,
        otp: String
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updateMfaAuthenticator(
            type: type,
            otp: otp,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Delete an authenticator for a user by ID.
    ///
    /// @param AppwriteEnums.AuthenticatorType type
    /// @throws Exception
    /// @return array
    ///
    open func deleteMfaAuthenticator(
        type: AppwriteEnums.AuthenticatorType
    ) async throws -> Any {
        let apiPath: String = "/account/mfa/authenticators/{type}"
            .replacingOccurrences(of: "{type}", with: type.rawValue)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Begin the process of MFA verification after sign-in. Finish the flow with
    /// [updateMfaChallenge](/docs/references/cloud/client-web/account#updateMfaChallenge)
    /// method.
    ///
    /// @param AppwriteEnums.AuthenticationFactor factor
    /// @throws Exception
    /// @return array
    ///
    open func createMfaChallenge(
        factor: AppwriteEnums.AuthenticationFactor
    ) async throws -> AppwriteModels.MfaChallenge {
        let apiPath: String = "/account/mfa/challenge"

        let apiParams: [String: Any?] = [
            "factor": factor
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.MfaChallenge = { response in
            return AppwriteModels.MfaChallenge.from(map: response as! [String: Any])
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
    /// Complete the MFA challenge by providing the one-time password. Finish the
    /// process of MFA verification by providing the one-time password. To begin
    /// the flow, use
    /// [createMfaChallenge](/docs/references/cloud/client-web/account#createMfaChallenge)
    /// method.
    ///
    /// @param String challengeId
    /// @param String otp
    /// @throws Exception
    /// @return array
    ///
    open func updateMfaChallenge(
        challengeId: String,
        otp: String
    ) async throws -> AppwriteModels.Session {
        let apiPath: String = "/account/mfa/challenge"

        let apiParams: [String: Any?] = [
            "challengeId": challengeId,
            "otp": otp
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Session = { response in
            return AppwriteModels.Session.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// List the factors available on the account to be used as a MFA challange.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listMfaFactors(
    ) async throws -> AppwriteModels.MfaFactors {
        let apiPath: String = "/account/mfa/factors"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.MfaFactors = { response in
            return AppwriteModels.MfaFactors.from(map: response as! [String: Any])
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
    /// Get recovery codes that can be used as backup for MFA flow. Before getting
    /// codes, they must be generated using
    /// [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes)
    /// method. An OTP challenge is required to read recovery codes.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getMfaRecoveryCodes(
    ) async throws -> AppwriteModels.MfaRecoveryCodes {
        let apiPath: String = "/account/mfa/recovery-codes"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.MfaRecoveryCodes = { response in
            return AppwriteModels.MfaRecoveryCodes.from(map: response as! [String: Any])
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
    /// Generate recovery codes as backup for MFA flow. It's recommended to
    /// generate and show then immediately after user successfully adds their
    /// authehticator. Recovery codes can be used as a MFA verification type in
    /// [createMfaChallenge](/docs/references/cloud/client-web/account#createMfaChallenge)
    /// method.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func createMfaRecoveryCodes(
    ) async throws -> AppwriteModels.MfaRecoveryCodes {
        let apiPath: String = "/account/mfa/recovery-codes"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.MfaRecoveryCodes = { response in
            return AppwriteModels.MfaRecoveryCodes.from(map: response as! [String: Any])
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
    /// Regenerate recovery codes that can be used as backup for MFA flow. Before
    /// regenerating codes, they must be first generated using
    /// [createMfaRecoveryCodes](/docs/references/cloud/client-web/account#createMfaRecoveryCodes)
    /// method. An OTP challenge is required to regenreate recovery codes.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func updateMfaRecoveryCodes(
    ) async throws -> AppwriteModels.MfaRecoveryCodes {
        let apiPath: String = "/account/mfa/recovery-codes"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.MfaRecoveryCodes = { response in
            return AppwriteModels.MfaRecoveryCodes.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update currently logged in user account name.
    ///
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func updateName<T>(
        name: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/account/name"

        let apiParams: [String: Any?] = [
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update currently logged in user account name.
    ///
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func updateName(
        name: String
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updateName(
            name: name,
            nestedType: [String: AnyCodable].self
        )
    }

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
    open func updatePassword<T>(
        password: String,
        oldPassword: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/account/password"

        let apiParams: [String: Any?] = [
            "password": password,
            "oldPassword": oldPassword
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

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
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updatePassword(
            password: password,
            oldPassword: oldPassword,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update the currently logged in user's phone number. After updating the
    /// phone number, the phone verification status will be reset. A confirmation
    /// SMS is not sent automatically, however you can use the [POST
    /// /account/verification/phone](https://appwrite.io/docs/references/cloud/client-web/account#createPhoneVerification)
    /// endpoint to send a confirmation SMS.
    ///
    /// @param String phone
    /// @param String password
    /// @throws Exception
    /// @return array
    ///
    open func updatePhone<T>(
        phone: String,
        password: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/account/phone"

        let apiParams: [String: Any?] = [
            "phone": phone,
            "password": password
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update the currently logged in user's phone number. After updating the
    /// phone number, the phone verification status will be reset. A confirmation
    /// SMS is not sent automatically, however you can use the [POST
    /// /account/verification/phone](https://appwrite.io/docs/references/cloud/client-web/account#createPhoneVerification)
    /// endpoint to send a confirmation SMS.
    ///
    /// @param String phone
    /// @param String password
    /// @throws Exception
    /// @return array
    ///
    open func updatePhone(
        phone: String,
        password: String
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updatePhone(
            phone: phone,
            password: password,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Get the preferences as a key-value object for the currently logged in user.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getPrefs<T>(
        nestedType: T.Type
    ) async throws -> AppwriteModels.Preferences<T> {
        let apiPath: String = "/account/prefs"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Preferences<T> = { response in
            return AppwriteModels.Preferences.from(map: response as! [String: Any])
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
    /// Get the preferences as a key-value object for the currently logged in user.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getPrefs(
    ) async throws -> AppwriteModels.Preferences<[String: AnyCodable]> {
        return try await getPrefs(
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update currently logged in user account preferences. The object you pass is
    /// stored as is, and replaces any previous value. The maximum allowed prefs
    /// size is 64kB and throws error if exceeded.
    ///
    /// @param Any prefs
    /// @throws Exception
    /// @return array
    ///
    open func updatePrefs<T>(
        prefs: Any,
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/account/prefs"

        let apiParams: [String: Any?] = [
            "prefs": prefs
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

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
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updatePrefs(
            prefs: prefs,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Sends the user an email with a temporary secret key for password reset.
    /// When the user clicks the confirmation link he is redirected back to your
    /// app password reset URL with the secret key and email address values
    /// attached to the URL query string. Use the query string params to submit a
    /// request to the [PUT
    /// /account/recovery](https://appwrite.io/docs/references/cloud/client-web/account#updateRecovery)
    /// endpoint to complete the process. The verification link sent to the user's
    /// email address is valid for 1 hour.
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
        let apiPath: String = "/account/recovery"

        let apiParams: [String: Any?] = [
            "email": email,
            "url": url
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Token = { response in
            return AppwriteModels.Token.from(map: response as! [String: Any])
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
    /// Use this endpoint to complete the user account password reset. Both the
    /// **userId** and **secret** arguments will be passed as query parameters to
    /// the redirect URL you have provided when sending your request to the [POST
    /// /account/recovery](https://appwrite.io/docs/references/cloud/client-web/account#createRecovery)
    /// endpoint.
    /// 
    /// Please note that in order to avoid a [Redirect
    /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
    /// the only valid redirect URLs are the ones from domains you have set when
    /// adding your platforms in the console interface.
    ///
    /// @param String userId
    /// @param String secret
    /// @param String password
    /// @throws Exception
    /// @return array
    ///
    open func updateRecovery(
        userId: String,
        secret: String,
        password: String
    ) async throws -> AppwriteModels.Token {
        let apiPath: String = "/account/recovery"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "secret": secret,
            "password": password
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Token = { response in
            return AppwriteModels.Token.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get the list of active sessions across different devices for the currently
    /// logged in user.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listSessions(
    ) async throws -> AppwriteModels.SessionList {
        let apiPath: String = "/account/sessions"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.SessionList = { response in
            return AppwriteModels.SessionList.from(map: response as! [String: Any])
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
    /// Delete all sessions from the user account and remove any sessions cookies
    /// from the end client.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func deleteSessions(
    ) async throws -> Any {
        let apiPath: String = "/account/sessions"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Use this endpoint to allow a new user to register an anonymous account in
    /// your project. This route will also create a new session for the user. To
    /// allow the new user to convert an anonymous account to a normal account, you
    /// need to update its [email and
    /// password](https://appwrite.io/docs/references/cloud/client-web/account#updateEmail)
    /// or create an [OAuth2
    /// session](https://appwrite.io/docs/references/cloud/client-web/account#CreateOAuth2Session).
    ///
    /// @throws Exception
    /// @return array
    ///
    open func createAnonymousSession(
    ) async throws -> AppwriteModels.Session {
        let apiPath: String = "/account/sessions/anonymous"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Session = { response in
            return AppwriteModels.Session.from(map: response as! [String: Any])
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
    /// Allow the user to login into their account by providing a valid email and
    /// password combination. This route will create a new session for the user.
    /// 
    /// A user is limited to 10 active sessions at a time by default. [Learn more
    /// about session
    /// limits](https://appwrite.io/docs/authentication-security#limits).
    ///
    /// @param String email
    /// @param String password
    /// @throws Exception
    /// @return array
    ///
    open func createEmailPasswordSession(
        email: String,
        password: String
    ) async throws -> AppwriteModels.Session {
        let apiPath: String = "/account/sessions/email"

        let apiParams: [String: Any?] = [
            "email": email,
            "password": password
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Session = { response in
            return AppwriteModels.Session.from(map: response as! [String: Any])
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
    /// Use this endpoint to create a session from token. Provide the **userId**
    /// and **secret** parameters from the successful response of authentication
    /// flows initiated by token creation. For example, magic URL and phone login.
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
        let apiPath: String = "/account/sessions/magic-url"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "secret": secret
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Session = { response in
            return AppwriteModels.Session.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

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
    /// user.
    /// 
    /// A user is limited to 10 active sessions at a time by default. [Learn more
    /// about session
    /// limits](https://appwrite.io/docs/authentication-security#limits).
    /// 
    ///
    /// @param AppwriteEnums.OAuthProvider provider
    /// @param String success
    /// @param String failure
    /// @param [String] scopes
    /// @throws Exception
    /// @return array
    ///
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    open func createOAuth2Session(
        provider: AppwriteEnums.OAuthProvider,
        success: String? = nil,
        failure: String? = nil,
        scopes: [String]? = nil
    ) async throws -> Bool {
        let apiPath: String = "/account/sessions/oauth2/{provider}"
            .replacingOccurrences(of: "{provider}", with: provider.rawValue)

        let apiParams: [String: Any?] = [
            "success": success,
            "failure": failure,
            "scopes": scopes,
            "project": client.config["project"]
        ]

        let query = "?\(client.parametersToQueryString(params: apiParams))"
        let url = URL(string: client.endPoint + apiPath + query)!
        let callbackScheme = "appwrite-callback-\(client.config["project"] ?? "")"

        _ = try await withCheckedThrowingContinuation { continuation in
            /// main thread for PresentationContextProvider
            DispatchQueue.main.async {
                WebAuthComponent.authenticate(url: url, callbackScheme: callbackScheme) { result in
                    continuation.resume(with: result)
                }
            }
        }

        return true

    }

    ///
    /// Use this endpoint to create a session from token. Provide the **userId**
    /// and **secret** parameters from the successful response of authentication
    /// flows initiated by token creation. For example, magic URL and phone login.
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
        let apiPath: String = "/account/sessions/phone"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "secret": secret
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Session = { response in
            return AppwriteModels.Session.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Use this endpoint to create a session from token. Provide the **userId**
    /// and **secret** parameters from the successful response of authentication
    /// flows initiated by token creation. For example, magic URL and phone login.
    ///
    /// @param String userId
    /// @param String secret
    /// @throws Exception
    /// @return array
    ///
    open func createSession(
        userId: String,
        secret: String
    ) async throws -> AppwriteModels.Session {
        let apiPath: String = "/account/sessions/token"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "secret": secret
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Session = { response in
            return AppwriteModels.Session.from(map: response as! [String: Any])
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
        let apiPath: String = "/account/sessions/{sessionId}"
            .replacingOccurrences(of: "{sessionId}", with: sessionId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Session = { response in
            return AppwriteModels.Session.from(map: response as! [String: Any])
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
    /// Use this endpoint to extend a session's length. Extending a session is
    /// useful when session expiry is short. If the session was created using an
    /// OAuth provider, this endpoint refreshes the access token from the provider.
    ///
    /// @param String sessionId
    /// @throws Exception
    /// @return array
    ///
    open func updateSession(
        sessionId: String
    ) async throws -> AppwriteModels.Session {
        let apiPath: String = "/account/sessions/{sessionId}"
            .replacingOccurrences(of: "{sessionId}", with: sessionId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Session = { response in
            return AppwriteModels.Session.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Logout the user. Use 'current' as the session ID to logout on this device,
    /// use a session ID to logout on another device. If you're looking to logout
    /// the user on all devices, use [Delete
    /// Sessions](https://appwrite.io/docs/references/cloud/client-web/account#deleteSessions)
    /// instead.
    ///
    /// @param String sessionId
    /// @throws Exception
    /// @return array
    ///
    open func deleteSession(
        sessionId: String
    ) async throws -> Any {
        let apiPath: String = "/account/sessions/{sessionId}"
            .replacingOccurrences(of: "{sessionId}", with: sessionId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Block the currently logged in user account. Behind the scene, the user
    /// record is not deleted but permanently blocked from any access. To
    /// completely delete a user, use the Users API instead.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func updateStatus<T>(
        nestedType: T.Type
    ) async throws -> AppwriteModels.User<T> {
        let apiPath: String = "/account/status"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.User<T> = { response in
            return AppwriteModels.User.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Block the currently logged in user account. Behind the scene, the user
    /// record is not deleted but permanently blocked from any access. To
    /// completely delete a user, use the Users API instead.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func updateStatus(
    ) async throws -> AppwriteModels.User<[String: AnyCodable]> {
        return try await updateStatus(
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Use this endpoint to register a device for push notifications. Provide a
    /// target ID (custom or generated using ID.unique()), a device identifier
    /// (usually a device token), and optionally specify which provider should send
    /// notifications to this target. The target is automatically linked to the
    /// current session and includes device information like brand and model.
    ///
    /// @param String targetId
    /// @param String identifier
    /// @param String providerId
    /// @throws Exception
    /// @return array
    ///
    open func createPushTarget(
        targetId: String,
        identifier: String,
        providerId: String? = nil
    ) async throws -> AppwriteModels.Target {
        let apiPath: String = "/account/targets/push"

        let apiParams: [String: Any?] = [
            "targetId": targetId,
            "identifier": identifier,
            "providerId": providerId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Target = { response in
            return AppwriteModels.Target.from(map: response as! [String: Any])
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
    /// Update the currently logged in user's push notification target. You can
    /// modify the target's identifier (device token) and provider ID (token,
    /// email, phone etc.). The target must exist and belong to the current user.
    /// If you change the provider ID, notifications will be sent through the new
    /// messaging provider instead.
    ///
    /// @param String targetId
    /// @param String identifier
    /// @throws Exception
    /// @return array
    ///
    open func updatePushTarget(
        targetId: String,
        identifier: String
    ) async throws -> AppwriteModels.Target {
        let apiPath: String = "/account/targets/{targetId}/push"
            .replacingOccurrences(of: "{targetId}", with: targetId)

        let apiParams: [String: Any?] = [
            "identifier": identifier
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Target = { response in
            return AppwriteModels.Target.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Delete a push notification target for the currently logged in user. After
    /// deletion, the device will no longer receive push notifications. The target
    /// must exist and belong to the current user.
    ///
    /// @param String targetId
    /// @throws Exception
    /// @return array
    ///
    open func deletePushTarget(
        targetId: String
    ) async throws -> Any {
        let apiPath: String = "/account/targets/{targetId}/push"
            .replacingOccurrences(of: "{targetId}", with: targetId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Sends the user an email with a secret key for creating a session. If the
    /// provided user ID has not be registered, a new user will be created. Use the
    /// returned user ID and secret and submit a request to the [POST
    /// /v1/account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession)
    /// endpoint to complete the login process. The secret sent to the user's email
    /// is valid for 15 minutes.
    /// 
    /// A user is limited to 10 active sessions at a time by default. [Learn more
    /// about session
    /// limits](https://appwrite.io/docs/authentication-security#limits).
    ///
    /// @param String userId
    /// @param String email
    /// @param Bool phrase
    /// @throws Exception
    /// @return array
    ///
    open func createEmailToken(
        userId: String,
        email: String,
        phrase: Bool? = nil
    ) async throws -> AppwriteModels.Token {
        let apiPath: String = "/account/tokens/email"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "email": email,
            "phrase": phrase
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Token = { response in
            return AppwriteModels.Token.from(map: response as! [String: Any])
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
    /// Sends the user an email with a secret key for creating a session. If the
    /// provided user ID has not been registered, a new user will be created. When
    /// the user clicks the link in the email, the user is redirected back to the
    /// URL you provided with the secret key and userId values attached to the URL
    /// query string. Use the query string parameters to submit a request to the
    /// [POST
    /// /v1/account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession)
    /// endpoint to complete the login process. The link sent to the user's email
    /// address is valid for 1 hour.
    /// 
    /// A user is limited to 10 active sessions at a time by default. [Learn more
    /// about session
    /// limits](https://appwrite.io/docs/authentication-security#limits).
    /// 
    ///
    /// @param String userId
    /// @param String email
    /// @param String url
    /// @param Bool phrase
    /// @throws Exception
    /// @return array
    ///
    open func createMagicURLToken(
        userId: String,
        email: String,
        url: String? = nil,
        phrase: Bool? = nil
    ) async throws -> AppwriteModels.Token {
        let apiPath: String = "/account/tokens/magic-url"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "email": email,
            "url": url,
            "phrase": phrase
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Token = { response in
            return AppwriteModels.Token.from(map: response as! [String: Any])
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
    /// Allow the user to login to their account using the OAuth2 provider of their
    /// choice. Each OAuth2 provider should be enabled from the Appwrite console
    /// first. Use the success and failure arguments to provide a redirect URL's
    /// back to your app when login is completed. 
    /// 
    /// If authentication succeeds, `userId` and `secret` of a token will be
    /// appended to the success URL as query parameters. These can be used to
    /// create a new session using the [Create
    /// session](https://appwrite.io/docs/references/cloud/client-web/account#createSession)
    /// endpoint.
    /// 
    /// A user is limited to 10 active sessions at a time by default. [Learn more
    /// about session
    /// limits](https://appwrite.io/docs/authentication-security#limits).
    ///
    /// @param AppwriteEnums.OAuthProvider provider
    /// @param String success
    /// @param String failure
    /// @param [String] scopes
    /// @throws Exception
    /// @return array
    ///
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    open func createOAuth2Token(
        provider: AppwriteEnums.OAuthProvider,
        success: String? = nil,
        failure: String? = nil,
        scopes: [String]? = nil
    ) async throws -> Bool {
        let apiPath: String = "/account/tokens/oauth2/{provider}"
            .replacingOccurrences(of: "{provider}", with: provider.rawValue)

        let apiParams: [String: Any?] = [
            "success": success,
            "failure": failure,
            "scopes": scopes,
            "project": client.config["project"]
        ]

        let query = "?\(client.parametersToQueryString(params: apiParams))"
        let url = URL(string: client.endPoint + apiPath + query)!
        let callbackScheme = "appwrite-callback-\(client.config["project"] ?? "")"

        _ = try await withCheckedThrowingContinuation { continuation in
            /// main thread for PresentationContextProvider
            DispatchQueue.main.async {
                WebAuthComponent.authenticate(url: url, callbackScheme: callbackScheme) { result in
                    continuation.resume(with: result)
                }
            }
        }

        return true

    }

    ///
    /// Sends the user an SMS with a secret key for creating a session. If the
    /// provided user ID has not be registered, a new user will be created. Use the
    /// returned user ID and secret and submit a request to the [POST
    /// /v1/account/sessions/token](https://appwrite.io/docs/references/cloud/client-web/account#createSession)
    /// endpoint to complete the login process. The secret sent to the user's phone
    /// is valid for 15 minutes.
    /// 
    /// A user is limited to 10 active sessions at a time by default. [Learn more
    /// about session
    /// limits](https://appwrite.io/docs/authentication-security#limits).
    ///
    /// @param String userId
    /// @param String phone
    /// @throws Exception
    /// @return array
    ///
    open func createPhoneToken(
        userId: String,
        phone: String
    ) async throws -> AppwriteModels.Token {
        let apiPath: String = "/account/tokens/phone"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "phone": phone
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Token = { response in
            return AppwriteModels.Token.from(map: response as! [String: Any])
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
    /// Use this endpoint to send a verification message to your user email address
    /// to confirm they are the valid owners of that address. Both the **userId**
    /// and **secret** arguments will be passed as query parameters to the URL you
    /// have provided to be attached to the verification email. The provided URL
    /// should redirect the user back to your app and allow you to complete the
    /// verification process by verifying both the **userId** and **secret**
    /// parameters. Learn more about how to [complete the verification
    /// process](https://appwrite.io/docs/references/cloud/client-web/account#updateVerification).
    /// The verification link sent to the user's email address is valid for 7 days.
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
        let apiPath: String = "/account/verification"

        let apiParams: [String: Any?] = [
            "url": url
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Token = { response in
            return AppwriteModels.Token.from(map: response as! [String: Any])
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
        let apiPath: String = "/account/verification"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "secret": secret
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Token = { response in
            return AppwriteModels.Token.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Use this endpoint to send a verification SMS to the currently logged in
    /// user. This endpoint is meant for use after updating a user's phone number
    /// using the
    /// [accountUpdatePhone](https://appwrite.io/docs/references/cloud/client-web/account#updatePhone)
    /// endpoint. Learn more about how to [complete the verification
    /// process](https://appwrite.io/docs/references/cloud/client-web/account#updatePhoneVerification).
    /// The verification code sent to the user's phone number is valid for 15
    /// minutes.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func createPhoneVerification(
    ) async throws -> AppwriteModels.Token {
        let apiPath: String = "/account/verification/phone"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Token = { response in
            return AppwriteModels.Token.from(map: response as! [String: Any])
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
        let apiPath: String = "/account/verification/phone"

        let apiParams: [String: Any?] = [
            "userId": userId,
            "secret": secret
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Token = { response in
            return AppwriteModels.Token.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }


}