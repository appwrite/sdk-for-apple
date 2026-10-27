import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

///
open class Analytics: Service {

    ///
    /// Send a tracking event from a browser, native app, or server-side SDK.
    ///
    /// - Parameters:
    ///   - propertyId: String
    ///   - name: String
    ///   - url: String
    ///   - domain: String (optional)
    ///   - referrer: String (optional)
    ///   - screenWidth: Int (optional)
    ///   - sessionHash: String (optional)
    ///   - scrollDepth: Int (optional)
    ///   - engagementTime: Int (optional)
    ///   - props: [String] (optional)
    ///   - userId: String (optional)
    ///   - ip: String (optional)
    ///   - userAgent: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func createEvent(
        propertyId: String,
        name: String,
        url: String,
        domain: String? = nil,
        referrer: String? = nil,
        screenWidth: Int? = nil,
        sessionHash: String? = nil,
        scrollDepth: Int? = nil,
        engagementTime: Int? = nil,
        props: [String]? = nil,
        userId: String? = nil,
        ip: String? = nil,
        userAgent: String? = nil
    ) async throws -> Any {
        if propertyId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"propertyId\"")
        }

        let apiPath: String = "/analytics/properties/{propertyId}/events"
            .replacingOccurrences(of: "{propertyId}", with: try Client.encodePath(propertyId))

        let apiParams: [String: Any?] = [
            "name": name,
            "url": url,
            "domain": domain,
            "referrer": referrer,
            "screenWidth": screenWidth,
            "sessionHash": sessionHash,
            "scrollDepth": scrollDepth,
            "engagementTime": engagementTime,
            "props": props,
            "userId": userId,
            "ip": ip,
            "userAgent": userAgent,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
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
}
