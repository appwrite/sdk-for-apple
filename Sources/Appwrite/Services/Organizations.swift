import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class Organizations: Service {

    ///
    /// Delete an organization.
    ///
    /// - Parameters:
    ///   - organizationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        organizationId: String
    ) async throws -> Any {
        let apiPath: String = "/organizations/{organizationId}"
            .replacingOccurrences(of: "{organizationId}", with: organizationId)

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
    /// Get a billing address using it's ID.
    ///
    /// - Parameters:
    ///   - organizationId: String
    ///   - billingAddressId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BillingAddress
    ///
    open func getBillingAddress(
        organizationId: String,
        billingAddressId: String
    ) async throws -> AppwriteModels.BillingAddress {
        let apiPath: String = "/organizations/{organizationId}/billing-addresses/{billingAddressId}"
            .replacingOccurrences(of: "{organizationId}", with: organizationId)
            .replacingOccurrences(of: "{billingAddressId}", with: billingAddressId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.BillingAddress = { response in
            return AppwriteModels.BillingAddress.from(map: response as! [String: Any])
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
    /// Get estimation for deleting an organization.
    ///
    /// - Parameters:
    ///   - organizationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.EstimationDeleteOrganization
    ///
    open func estimationDeleteOrganization(
        organizationId: String
    ) async throws -> AppwriteModels.EstimationDeleteOrganization {
        let apiPath: String = "/organizations/{organizationId}/estimations/delete-organization"
            .replacingOccurrences(of: "{organizationId}", with: organizationId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.EstimationDeleteOrganization = { response in
            return AppwriteModels.EstimationDeleteOrganization.from(map: response as! [String: Any])
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
    /// Submit feedback about downgrading from a paid plan to a lower tier. This
    /// helps the team understand user experience and improve the platform.
    /// 
    ///
    /// - Parameters:
    ///   - organizationId: String
    ///   - reason: String
    ///   - message: String
    ///   - fromPlanId: String
    ///   - toPlanId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DowngradeFeedback
    ///
    open func createDowngradeFeedback(
        organizationId: String,
        reason: String,
        message: String,
        fromPlanId: String,
        toPlanId: String
    ) async throws -> AppwriteModels.DowngradeFeedback {
        let apiPath: String = "/organizations/{organizationId}/feedbacks/downgrade"
            .replacingOccurrences(of: "{organizationId}", with: organizationId)

        let apiParams: [String: Any?] = [
            "reason": reason,
            "message": message,
            "fromPlanId": fromPlanId,
            "toPlanId": toPlanId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.DowngradeFeedback = { response in
            return AppwriteModels.DowngradeFeedback.from(map: response as! [String: Any])
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
    /// Get an organization's payment method using it's payment method ID.
    ///
    /// - Parameters:
    ///   - organizationId: String
    ///   - paymentMethodId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.PaymentMethod
    ///
    open func getPaymentMethod(
        organizationId: String,
        paymentMethodId: String
    ) async throws -> AppwriteModels.PaymentMethod {
        let apiPath: String = "/organizations/{organizationId}/payment-methods/{paymentMethodId}"
            .replacingOccurrences(of: "{organizationId}", with: organizationId)
            .replacingOccurrences(of: "{paymentMethodId}", with: paymentMethodId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.PaymentMethod = { response in
            return AppwriteModels.PaymentMethod.from(map: response as! [String: Any])
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