import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteModels

/// The Teams service allows you to group users of your project and to enable them to share read and write access to your project resources
open class Teams: Service {

    ///
    /// List Teams
    ///
    /// Get a list of all the teams in which the current user is a member. You can
    /// use the parameters to filter your results.
    ///
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func list(
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.TeamList {
        let path: String = "/teams"

        let params: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.TeamList = { response in
            return AppwriteModels.TeamList.from(map: response as! [String: Any])
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
    /// Create Team
    ///
    /// Create a new team. The user who creates the team will automatically be
    /// assigned as the owner of the team. Only the users with the owner role can
    /// invite new members, add new owners and delete or update the team.
    ///
    /// @param String teamId
    /// @param String name
    /// @param [String] roles
    /// @throws Exception
    /// @return array
    ///
    open func create(
        teamId: String,
        name: String,
        roles: [String]? = nil
    ) async throws -> AppwriteModels.Team {
        let path: String = "/teams"

        let params: [String: Any?] = [
            "teamId": teamId,
            "name": name,
            "roles": roles
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Team = { response in
            return AppwriteModels.Team.from(map: response as! [String: Any])
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
    /// Get Team
    ///
    /// Get a team by its ID. All team members have read access for this resource.
    ///
    /// @param String teamId
    /// @throws Exception
    /// @return array
    ///
    open func get(
        teamId: String
    ) async throws -> AppwriteModels.Team {
        let path: String = "/teams/{teamId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Team = { response in
            return AppwriteModels.Team.from(map: response as! [String: Any])
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
    /// Update Team
    ///
    /// Update a team using its ID. Only members with the owner role can update the
    /// team.
    ///
    /// @param String teamId
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func update(
        teamId: String,
        name: String
    ) async throws -> AppwriteModels.Team {
        let path: String = "/teams/{teamId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let params: [String: Any?] = [
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Team = { response in
            return AppwriteModels.Team.from(map: response as! [String: Any])
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
    /// Delete Team
    ///
    /// Delete a team using its ID. Only team members with the owner role can
    /// delete the team.
    ///
    /// @param String teamId
    /// @throws Exception
    /// @return array
    ///
    open func delete(
        teamId: String
    ) async throws -> Any {
        let path: String = "/teams/{teamId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let params: [String: Any] = [:]

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
    /// List Team Memberships
    ///
    /// Use this endpoint to list a team's members using the team's ID. All team
    /// members have read access to this endpoint.
    ///
    /// @param String teamId
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func listMemberships(
        teamId: String,
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.MembershipList {
        let path: String = "/teams/{teamId}/memberships"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let params: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.MembershipList = { response in
            return AppwriteModels.MembershipList.from(map: response as! [String: Any])
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
    /// Create Team Membership
    ///
    /// Invite a new member to join your team. If initiated from the client SDK, an
    /// email with a link to join the team will be sent to the member's email
    /// address and an account will be created for them should they not be signed
    /// up already. If initiated from server-side SDKs, the new member will
    /// automatically be added to the team.
    /// 
    /// Use the 'url' parameter to redirect the user from the invitation email back
    /// to your app. When the user is redirected, use the [Update Team Membership
    /// Status](/docs/client/teams#teamsUpdateMembershipStatus) endpoint to allow
    /// the user to accept the invitation to the team. 
    /// 
    /// Please note that to avoid a [Redirect
    /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
    /// the only valid redirect URL's are the once from domains you have set when
    /// adding your platforms in the console interface.
    ///
    /// @param String teamId
    /// @param String email
    /// @param [String] roles
    /// @param String url
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createMembership(
        teamId: String,
        email: String,
        roles: [String],
        url: String,
        name: String? = nil
    ) async throws -> AppwriteModels.Membership {
        let path: String = "/teams/{teamId}/memberships"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let params: [String: Any?] = [
            "email": email,
            "roles": roles,
            "url": url,
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
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
    /// Get Team Membership
    ///
    /// Get a team member by the membership unique id. All team members have read
    /// access for this resource.
    ///
    /// @param String teamId
    /// @param String membershipId
    /// @throws Exception
    /// @return array
    ///
    open func getMembership(
        teamId: String,
        membershipId: String
    ) async throws -> AppwriteModels.Membership {
        let path: String = "/teams/{teamId}/memberships/{membershipId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
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
    /// Update Membership Roles
    ///
    /// Modify the roles of a team member. Only team members with the owner role
    /// have access to this endpoint. Learn more about [roles and
    /// permissions](/docs/permissions).
    ///
    /// @param String teamId
    /// @param String membershipId
    /// @param [String] roles
    /// @throws Exception
    /// @return array
    ///
    open func updateMembershipRoles(
        teamId: String,
        membershipId: String,
        roles: [String]
    ) async throws -> AppwriteModels.Membership {
        let path: String = "/teams/{teamId}/memberships/{membershipId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

        let params: [String: Any?] = [
            "roles": roles
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
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
    /// Delete Team Membership
    ///
    /// This endpoint allows a user to leave a team or for a team owner to delete
    /// the membership of any other team member. You can also use this endpoint to
    /// delete a user membership even if it is not accepted.
    ///
    /// @param String teamId
    /// @param String membershipId
    /// @throws Exception
    /// @return array
    ///
    open func deleteMembership(
        teamId: String,
        membershipId: String
    ) async throws -> Any {
        let path: String = "/teams/{teamId}/memberships/{membershipId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

        let params: [String: Any] = [:]

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
    /// Update Team Membership Status
    ///
    /// Use this endpoint to allow a user to accept an invitation to join a team
    /// after being redirected back to your app from the invitation email received
    /// by the user.
    /// 
    /// If the request is successful, a session for the user is automatically
    /// created.
    /// 
    ///
    /// @param String teamId
    /// @param String membershipId
    /// @param String userId
    /// @param String secret
    /// @throws Exception
    /// @return array
    ///
    open func updateMembershipStatus(
        teamId: String,
        membershipId: String,
        userId: String,
        secret: String
    ) async throws -> AppwriteModels.Membership {
        let path: String = "/teams/{teamId}/memberships/{membershipId}/status"
            .replacingOccurrences(of: "{teamId}", with: teamId)
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

        let params: [String: Any?] = [
            "userId": userId,
            "secret": secret
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }


}