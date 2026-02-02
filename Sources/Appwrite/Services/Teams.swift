import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Teams service allows you to group users of your project and to enable them to share read and write access to your project resources
open class Teams: Service {

    ///
    /// Get a list of all the teams in which the current user is a member. You can
    /// use the parameters to filter your results.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.TeamList<T>
    ///
    open func list<T>(
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.TeamList<T> {
        let apiPath: String = "/teams"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.TeamList<T> = { response in
            return AppwriteModels.TeamList.from(map: response as! [String: Any])
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
    /// Get a list of all the teams in which the current user is a member. You can
    /// use the parameters to filter your results.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.TeamList<T>
    ///
    open func list(
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.TeamList<[String: AnyCodable]> {
        return try await list(
            queries: queries,
            search: search,
            total: total,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create a new team. The user who creates the team will automatically be
    /// assigned as the owner of the team. Only the users with the owner role can
    /// invite new members, add new owners and delete or update the team.
    ///
    /// - Parameters:
    ///   - teamId: String
    ///   - name: String
    ///   - roles: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Team<T>
    ///
    open func create<T>(
        teamId: String,
        name: String,
        roles: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Team<T> {
        let apiPath: String = "/teams"

        let apiParams: [String: Any?] = [
            "teamId": teamId,
            "name": name,
            "roles": roles
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Team<T> = { response in
            return AppwriteModels.Team.from(map: response as! [String: Any])
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
    /// Create a new team. The user who creates the team will automatically be
    /// assigned as the owner of the team. Only the users with the owner role can
    /// invite new members, add new owners and delete or update the team.
    ///
    /// - Parameters:
    ///   - teamId: String
    ///   - name: String
    ///   - roles: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Team<T>
    ///
    open func create(
        teamId: String,
        name: String,
        roles: [String]? = nil
    ) async throws -> AppwriteModels.Team<[String: AnyCodable]> {
        return try await create(
            teamId: teamId,
            name: name,
            roles: roles,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Get a team by its ID. All team members have read access for this resource.
    ///
    /// - Parameters:
    ///   - teamId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Team<T>
    ///
    open func get<T>(
        teamId: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Team<T> {
        let apiPath: String = "/teams/{teamId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Team<T> = { response in
            return AppwriteModels.Team.from(map: response as! [String: Any])
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
    /// Get a team by its ID. All team members have read access for this resource.
    ///
    /// - Parameters:
    ///   - teamId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Team<T>
    ///
    open func get(
        teamId: String
    ) async throws -> AppwriteModels.Team<[String: AnyCodable]> {
        return try await get(
            teamId: teamId,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update the team's name by its unique ID.
    ///
    /// - Parameters:
    ///   - teamId: String
    ///   - name: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Team<T>
    ///
    open func updateName<T>(
        teamId: String,
        name: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Team<T> {
        let apiPath: String = "/teams/{teamId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let apiParams: [String: Any?] = [
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Team<T> = { response in
            return AppwriteModels.Team.from(map: response as! [String: Any])
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
    /// Update the team's name by its unique ID.
    ///
    /// - Parameters:
    ///   - teamId: String
    ///   - name: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Team<T>
    ///
    open func updateName(
        teamId: String,
        name: String
    ) async throws -> AppwriteModels.Team<[String: AnyCodable]> {
        return try await updateName(
            teamId: teamId,
            name: name,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Delete a team using its ID. Only team members with the owner role can
    /// delete the team.
    ///
    /// - Parameters:
    ///   - teamId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        teamId: String
    ) async throws -> Any {
        let apiPath: String = "/teams/{teamId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)

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
    /// Use this endpoint to list a team's members using the team's ID. All team
    /// members have read access to this endpoint. Hide sensitive attributes from
    /// the response by toggling membership privacy in the Console.
    ///
    /// - Parameters:
    ///   - teamId: String
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MembershipList
    ///
    open func listMemberships(
        teamId: String,
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.MembershipList {
        let apiPath: String = "/teams/{teamId}/memberships"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.MembershipList = { response in
            return AppwriteModels.MembershipList.from(map: response as! [String: Any])
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
    /// Invite a new member to join your team. Provide an ID for existing users, or
    /// invite unregistered users using an email or phone number. If initiated from
    /// a Client SDK, Appwrite will send an email or sms with a link to join the
    /// team to the invited user, and an account will be created for them if one
    /// doesn't exist. If initiated from a Server SDK, the new member will be added
    /// automatically to the team.
    /// 
    /// You only need to provide one of a user ID, email, or phone number. Appwrite
    /// will prioritize accepting the user ID > email > phone number if you provide
    /// more than one of these parameters.
    /// 
    /// Use the `url` parameter to redirect the user from the invitation email to
    /// your app. After the user is redirected, use the [Update Team Membership
    /// Status](https://appwrite.io/docs/references/cloud/client-web/teams#updateMembershipStatus)
    /// endpoint to allow the user to accept the invitation to the team. 
    /// 
    /// Please note that to avoid a [Redirect
    /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
    /// Appwrite will accept the only redirect URLs under the domains you have
    /// added as a platform on the Appwrite Console.
    /// 
    ///
    /// - Parameters:
    ///   - teamId: String
    ///   - roles: [AppwriteEnums.Roles]
    ///   - email: String (optional)
    ///   - userId: String (optional)
    ///   - phone: String (optional)
    ///   - url: String (optional)
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Membership
    ///
    open func createMembership(
        teamId: String,
        roles: [AppwriteEnums.Roles],
        email: String? = nil,
        userId: String? = nil,
        phone: String? = nil,
        url: String? = nil,
        name: String? = nil
    ) async throws -> AppwriteModels.Membership {
        let apiPath: String = "/teams/{teamId}/memberships"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let apiParams: [String: Any?] = [
            "email": email,
            "userId": userId,
            "phone": phone,
            "roles": roles,
            "url": url,
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
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
    /// Get a team member by the membership unique id. All team members have read
    /// access for this resource. Hide sensitive attributes from the response by
    /// toggling membership privacy in the Console.
    ///
    /// - Parameters:
    ///   - teamId: String
    ///   - membershipId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Membership
    ///
    open func getMembership(
        teamId: String,
        membershipId: String
    ) async throws -> AppwriteModels.Membership {
        let apiPath: String = "/teams/{teamId}/memberships/{membershipId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
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
    /// Modify the roles of a team member. Only team members with the owner role
    /// have access to this endpoint. Learn more about [roles and
    /// permissions](https://appwrite.io/docs/permissions).
    /// 
    ///
    /// - Parameters:
    ///   - teamId: String
    ///   - membershipId: String
    ///   - roles: [AppwriteEnums.Roles]
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Membership
    ///
    open func updateMembership(
        teamId: String,
        membershipId: String,
        roles: [AppwriteEnums.Roles]
    ) async throws -> AppwriteModels.Membership {
        let apiPath: String = "/teams/{teamId}/memberships/{membershipId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

        let apiParams: [String: Any?] = [
            "roles": roles
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
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
    /// This endpoint allows a user to leave a team or for a team owner to delete
    /// the membership of any other team member. You can also use this endpoint to
    /// delete a user membership even if it is not accepted.
    ///
    /// - Parameters:
    ///   - teamId: String
    ///   - membershipId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteMembership(
        teamId: String,
        membershipId: String
    ) async throws -> Any {
        let apiPath: String = "/teams/{teamId}/memberships/{membershipId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

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
    /// Use this endpoint to allow a user to accept an invitation to join a team
    /// after being redirected back to your app from the invitation email received
    /// by the user.
    /// 
    /// If the request is successful, a session for the user is automatically
    /// created.
    /// 
    ///
    /// - Parameters:
    ///   - teamId: String
    ///   - membershipId: String
    ///   - userId: String
    ///   - secret: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Membership
    ///
    open func updateMembershipStatus(
        teamId: String,
        membershipId: String,
        userId: String,
        secret: String
    ) async throws -> AppwriteModels.Membership {
        let apiPath: String = "/teams/{teamId}/memberships/{membershipId}/status"
            .replacingOccurrences(of: "{teamId}", with: teamId)
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

        let apiParams: [String: Any?] = [
            "userId": userId,
            "secret": secret
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
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
    /// Get the team's shared preferences by its unique ID. If a preference doesn't
    /// need to be shared by all team members, prefer storing them in [user
    /// preferences](https://appwrite.io/docs/references/cloud/client-web/account#getPrefs).
    ///
    /// - Parameters:
    ///   - teamId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Preferences<T>
    ///
    open func getPrefs<T>(
        teamId: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Preferences<T> {
        let apiPath: String = "/teams/{teamId}/prefs"
            .replacingOccurrences(of: "{teamId}", with: teamId)

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
    /// Get the team's shared preferences by its unique ID. If a preference doesn't
    /// need to be shared by all team members, prefer storing them in [user
    /// preferences](https://appwrite.io/docs/references/cloud/client-web/account#getPrefs).
    ///
    /// - Parameters:
    ///   - teamId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Preferences<T>
    ///
    open func getPrefs(
        teamId: String
    ) async throws -> AppwriteModels.Preferences<[String: AnyCodable]> {
        return try await getPrefs(
            teamId: teamId,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update the team's preferences by its unique ID. The object you pass is
    /// stored as is and replaces any previous value. The maximum allowed prefs
    /// size is 64kB and throws an error if exceeded.
    ///
    /// - Parameters:
    ///   - teamId: String
    ///   - prefs: Any
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Preferences<T>
    ///
    open func updatePrefs<T>(
        teamId: String,
        prefs: Any,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Preferences<T> {
        let apiPath: String = "/teams/{teamId}/prefs"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let apiParams: [String: Any?] = [
            "prefs": prefs
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Preferences<T> = { response in
            return AppwriteModels.Preferences.from(map: response as! [String: Any])
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
    /// Update the team's preferences by its unique ID. The object you pass is
    /// stored as is and replaces any previous value. The maximum allowed prefs
    /// size is 64kB and throws an error if exceeded.
    ///
    /// - Parameters:
    ///   - teamId: String
    ///   - prefs: Any
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Preferences<T>
    ///
    open func updatePrefs(
        teamId: String,
        prefs: Any
    ) async throws -> AppwriteModels.Preferences<[String: AnyCodable]> {
        return try await updatePrefs(
            teamId: teamId,
            prefs: prefs,
            nestedType: [String: AnyCodable].self
        )
    }


}