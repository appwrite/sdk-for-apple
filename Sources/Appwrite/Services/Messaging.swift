import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

/// The Messaging service allows you to send messages to any provider type (SMTP, push notification, SMS, etc.).
open class Messaging: Service {

    ///
    /// Create a new subscriber.
    ///
    /// - Parameters:
    ///   - topicId: String
    ///   - subscriberId: String
    ///   - targetId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Subscriber
    ///
    open func createSubscriber(
        topicId: String,
        subscriberId: String,
        targetId: String
    ) async throws -> AppwriteModels.Subscriber {
        if topicId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"topicId\"")
        }

        let apiPath: String = "/messaging/topics/{topicId}/subscribers"
            .replacingOccurrences(of: "{topicId}", with: topicId)

        let apiParams: [String: Any?] = [
            "subscriberId": subscriberId,
            "targetId": targetId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Subscriber = { response in
            return AppwriteModels.Subscriber.from(map: response as! [String: Any])
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
    /// Delete a subscriber by its unique ID.
    ///
    /// - Parameters:
    ///   - topicId: String
    ///   - subscriberId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteSubscriber(
        topicId: String,
        subscriberId: String
    ) async throws -> Any {
        if topicId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"topicId\"")
        }
        if subscriberId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"subscriberId\"")
        }

        let apiPath: String = "/messaging/topics/{topicId}/subscribers/{subscriberId}"
            .replacingOccurrences(of: "{topicId}", with: topicId)
            .replacingOccurrences(of: "{subscriberId}", with: subscriberId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
}
