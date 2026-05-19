import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class Advisor: Service {

    ///
    /// Get a list of all the project's analyzer reports. You can use the query
    /// params to filter your results.
    /// 
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ReportList
    ///
    open func listReports(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.ReportList {
        let apiPath: String = "/reports"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.ReportList = { response in
            return AppwriteModels.ReportList.from(map: response as! [String: Any])
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
    /// Get an analyzer report by its unique ID. The response includes the report's
    /// metadata and the nested insights it produced.
    /// 
    ///
    /// - Parameters:
    ///   - reportId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Report
    ///
    open func getReport(
        reportId: String
    ) async throws -> AppwriteModels.Report {
        let apiPath: String = "/reports/{reportId}"
            .replacingOccurrences(of: "{reportId}", with: reportId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.Report = { response in
            return AppwriteModels.Report.from(map: response as! [String: Any])
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
    /// List the insights produced under a single analyzer report. You can use the
    /// query params to filter your results further.
    /// 
    ///
    /// - Parameters:
    ///   - reportId: String
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.InsightList
    ///
    open func listInsights(
        reportId: String,
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.InsightList {
        let apiPath: String = "/reports/{reportId}/insights"
            .replacingOccurrences(of: "{reportId}", with: reportId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.InsightList = { response in
            return AppwriteModels.InsightList.from(map: response as! [String: Any])
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
    /// Get an insight by its unique ID, scoped to its parent report.
    /// 
    ///
    /// - Parameters:
    ///   - reportId: String
    ///   - insightId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Insight
    ///
    open func getInsight(
        reportId: String,
        insightId: String
    ) async throws -> AppwriteModels.Insight {
        let apiPath: String = "/reports/{reportId}/insights/{insightId}"
            .replacingOccurrences(of: "{reportId}", with: reportId)
            .replacingOccurrences(of: "{insightId}", with: insightId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.Insight = { response in
            return AppwriteModels.Insight.from(map: response as! [String: Any])
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
