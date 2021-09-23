import AsyncHTTPClient
import Foundation
import NIO

open class Projects: Service {
    ///
    /// List Projects
    ///
    /// @param String search
    /// @param Int limit
    /// @param Int offset
    /// @param String orderType
    /// @throws Exception
    /// @return array
    ///
    open func list(_ search: String = "", _ limit: Int = 25, _ offset: Int = 0, _ orderType: String = "ASC", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        let path: String = "/projects"

        let params: [String: Any?] = [
            "search": search,
            "limit": limit,
            "offset": offset,
            "orderType": orderType
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Create Project
    ///
    /// @param String name
    /// @param String teamId
    /// @param String description
    /// @param String logo
    /// @param String url
    /// @param String legalName
    /// @param String legalCountry
    /// @param String legalState
    /// @param String legalCity
    /// @param String legalAddress
    /// @param String legalTaxId
    /// @throws Exception
    /// @return array
    ///
    open func create(_ name: String, _ teamId: String, _ description: String = "", _ logo: String = "", _ url: String = "", _ legalName: String = "", _ legalCountry: String = "", _ legalState: String = "", _ legalCity: String = "", _ legalAddress: String = "", _ legalTaxId: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        let path: String = "/projects"

        let params: [String: Any?] = [
            "name": name,
            "teamId": teamId,
            "description": description,
            "logo": logo,
            "url": url,
            "legalName": legalName,
            "legalCountry": legalCountry,
            "legalState": legalState,
            "legalCity": legalCity,
            "legalAddress": legalAddress,
            "legalTaxId": legalTaxId
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "POST", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get Project
    ///
    /// @param String projectId
    /// @throws Exception
    /// @return array
    ///
    open func get(_ projectId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update Project
    ///
    /// @param String projectId
    /// @param String name
    /// @param String description
    /// @param String logo
    /// @param String url
    /// @param String legalName
    /// @param String legalCountry
    /// @param String legalState
    /// @param String legalCity
    /// @param String legalAddress
    /// @param String legalTaxId
    /// @throws Exception
    /// @return array
    ///
    open func update(_ projectId: String, _ name: String, _ description: String = "", _ logo: String = "", _ url: String = "", _ legalName: String = "", _ legalCountry: String = "", _ legalState: String = "", _ legalCity: String = "", _ legalAddress: String = "", _ legalTaxId: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [
            "name": name,
            "description": description,
            "logo": logo,
            "url": url,
            "legalName": legalName,
            "legalCountry": legalCountry,
            "legalState": legalState,
            "legalCity": legalCity,
            "legalAddress": legalAddress,
            "legalTaxId": legalTaxId
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "PATCH", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Delete Project
    ///
    /// @param String projectId
    /// @param String password
    /// @throws Exception
    /// @return array
    ///
    open func delete(_ projectId: String, _ password: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [
            "password": password
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "DELETE", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update Project users limit
    ///
    /// @param String projectId
    /// @param String limit
    /// @throws Exception
    /// @return array
    ///
    open func updateAuthLimit(_ projectId: String, _ limit: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/auth/limit"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [
            "limit": limit
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "PATCH", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update Project auth method status. Use this endpoint to enable or disable a given auth method for this project.
    ///
    /// @param String projectId
    /// @param String method
    /// @param Bool status
    /// @throws Exception
    /// @return array
    ///
    open func updateAuthStatus(_ projectId: String, _ method: String, _ status: Bool, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/auth/{method}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{method}",
          with: method
        )

        let params: [String: Any?] = [
            "status": status
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "PATCH", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// List Domains
    ///
    /// @param String projectId
    /// @throws Exception
    /// @return array
    ///
    open func listDomains(_ projectId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/domains"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Create Domain
    ///
    /// @param String projectId
    /// @param String domain
    /// @throws Exception
    /// @return array
    ///
    open func createDomain(_ projectId: String, _ domain: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/domains"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [
            "domain": domain
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "POST", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get Domain
    ///
    /// @param String projectId
    /// @param String domainId
    /// @throws Exception
    /// @return array
    ///
    open func getDomain(_ projectId: String, _ domainId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/domains/{domainId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{domainId}",
          with: domainId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Delete Domain
    ///
    /// @param String projectId
    /// @param String domainId
    /// @throws Exception
    /// @return array
    ///
    open func deleteDomain(_ projectId: String, _ domainId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/domains/{domainId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{domainId}",
          with: domainId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "DELETE", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update Domain Verification Status
    ///
    /// @param String projectId
    /// @param String domainId
    /// @throws Exception
    /// @return array
    ///
    open func updateDomainVerification(_ projectId: String, _ domainId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/domains/{domainId}/verification"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{domainId}",
          with: domainId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "PATCH", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// List Keys
    ///
    /// @param String projectId
    /// @throws Exception
    /// @return array
    ///
    open func listKeys(_ projectId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/keys"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Create Key
    ///
    /// @param String projectId
    /// @param String name
    /// @param Array<Any>? scopes
    /// @throws Exception
    /// @return array
    ///
    open func createKey(_ projectId: String, _ name: String, _ scopes: Array<Any>?, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/keys"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [
            "name": name,
            "scopes": scopes
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "POST", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get Key
    ///
    /// @param String projectId
    /// @param String keyId
    /// @throws Exception
    /// @return array
    ///
    open func getKey(_ projectId: String, _ keyId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/keys/{keyId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{keyId}",
          with: keyId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update Key
    ///
    /// @param String projectId
    /// @param String keyId
    /// @param String name
    /// @param Array<Any>? scopes
    /// @throws Exception
    /// @return array
    ///
    open func updateKey(_ projectId: String, _ keyId: String, _ name: String, _ scopes: Array<Any>?, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/keys/{keyId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{keyId}",
          with: keyId
        )

        let params: [String: Any?] = [
            "name": name,
            "scopes": scopes
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "PUT", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Delete Key
    ///
    /// @param String projectId
    /// @param String keyId
    /// @throws Exception
    /// @return array
    ///
    open func deleteKey(_ projectId: String, _ keyId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/keys/{keyId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{keyId}",
          with: keyId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "DELETE", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update Project OAuth2
    ///
    /// @param String projectId
    /// @param String provider
    /// @param String appId
    /// @param String secret
    /// @throws Exception
    /// @return array
    ///
    open func updateOAuth2(_ projectId: String, _ provider: String, _ appId: String = "", _ secret: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/oauth2"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [
            "provider": provider,
            "appId": appId,
            "secret": secret
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "PATCH", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// List Platforms
    ///
    /// @param String projectId
    /// @throws Exception
    /// @return array
    ///
    open func listPlatforms(_ projectId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/platforms"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Create Platform
    ///
    /// @param String projectId
    /// @param String type
    /// @param String name
    /// @param String key
    /// @param String store
    /// @param String hostname
    /// @throws Exception
    /// @return array
    ///
    open func createPlatform(_ projectId: String, _ type: String, _ name: String, _ key: String = "", _ store: String = "", _ hostname: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/platforms"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [
            "type": type,
            "name": name,
            "key": key,
            "store": store,
            "hostname": hostname
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "POST", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get Platform
    ///
    /// @param String projectId
    /// @param String platformId
    /// @throws Exception
    /// @return array
    ///
    open func getPlatform(_ projectId: String, _ platformId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/platforms/{platformId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{platformId}",
          with: platformId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update Platform
    ///
    /// @param String projectId
    /// @param String platformId
    /// @param String name
    /// @param String key
    /// @param String store
    /// @param String hostname
    /// @throws Exception
    /// @return array
    ///
    open func updatePlatform(_ projectId: String, _ platformId: String, _ name: String, _ key: String = "", _ store: String = "", _ hostname: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/platforms/{platformId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{platformId}",
          with: platformId
        )

        let params: [String: Any?] = [
            "name": name,
            "key": key,
            "store": store,
            "hostname": hostname
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "PUT", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Delete Platform
    ///
    /// @param String projectId
    /// @param String platformId
    /// @throws Exception
    /// @return array
    ///
    open func deletePlatform(_ projectId: String, _ platformId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/platforms/{platformId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{platformId}",
          with: platformId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "DELETE", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// List Tasks
    ///
    /// @param String projectId
    /// @throws Exception
    /// @return array
    ///
    open func listTasks(_ projectId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/tasks"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Create Task
    ///
    /// @param String projectId
    /// @param String name
    /// @param String status
    /// @param String schedule
    /// @param Bool security
    /// @param String httpMethod
    /// @param String httpUrl
    /// @param Array<Any>? httpHeaders
    /// @param String httpUser
    /// @param String httpPass
    /// @throws Exception
    /// @return array
    ///
    open func createTask(_ projectId: String, _ name: String, _ status: String, _ schedule: String, _ security: Bool, _ httpMethod: String, _ httpUrl: String, _ httpHeaders: Array<Any>? = [], _ httpUser: String = "", _ httpPass: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/tasks"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [
            "name": name,
            "status": status,
            "schedule": schedule,
            "security": security,
            "httpMethod": httpMethod,
            "httpUrl": httpUrl,
            "httpHeaders": httpHeaders,
            "httpUser": httpUser,
            "httpPass": httpPass
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "POST", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get Task
    ///
    /// @param String projectId
    /// @param String taskId
    /// @throws Exception
    /// @return array
    ///
    open func getTask(_ projectId: String, _ taskId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/tasks/{taskId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{taskId}",
          with: taskId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update Task
    ///
    /// @param String projectId
    /// @param String taskId
    /// @param String name
    /// @param String status
    /// @param String schedule
    /// @param Bool security
    /// @param String httpMethod
    /// @param String httpUrl
    /// @param Array<Any>? httpHeaders
    /// @param String httpUser
    /// @param String httpPass
    /// @throws Exception
    /// @return array
    ///
    open func updateTask(_ projectId: String, _ taskId: String, _ name: String, _ status: String, _ schedule: String, _ security: Bool, _ httpMethod: String, _ httpUrl: String, _ httpHeaders: Array<Any>? = [], _ httpUser: String = "", _ httpPass: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/tasks/{taskId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{taskId}",
          with: taskId
        )

        let params: [String: Any?] = [
            "name": name,
            "status": status,
            "schedule": schedule,
            "security": security,
            "httpMethod": httpMethod,
            "httpUrl": httpUrl,
            "httpHeaders": httpHeaders,
            "httpUser": httpUser,
            "httpPass": httpPass
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "PUT", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Delete Task
    ///
    /// @param String projectId
    /// @param String taskId
    /// @throws Exception
    /// @return array
    ///
    open func deleteTask(_ projectId: String, _ taskId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/tasks/{taskId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{taskId}",
          with: taskId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "DELETE", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get Project
    ///
    /// @param String projectId
    /// @param String range
    /// @throws Exception
    /// @return array
    ///
    open func getUsage(_ projectId: String, _ range: String = "30d", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/usage"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [
            "range": range
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// List Webhooks
    ///
    /// @param String projectId
    /// @throws Exception
    /// @return array
    ///
    open func listWebhooks(_ projectId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/webhooks"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Create Webhook
    ///
    /// @param String projectId
    /// @param String name
    /// @param Array<Any>? events
    /// @param String url
    /// @param Bool security
    /// @param String httpUser
    /// @param String httpPass
    /// @throws Exception
    /// @return array
    ///
    open func createWebhook(_ projectId: String, _ name: String, _ events: Array<Any>?, _ url: String, _ security: Bool, _ httpUser: String = "", _ httpPass: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/webhooks"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        let params: [String: Any?] = [
            "name": name,
            "events": events,
            "url": url,
            "security": security,
            "httpUser": httpUser,
            "httpPass": httpPass
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "POST", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get Webhook
    ///
    /// @param String projectId
    /// @param String webhookId
    /// @throws Exception
    /// @return array
    ///
    open func getWebhook(_ projectId: String, _ webhookId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/webhooks/{webhookId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{webhookId}",
          with: webhookId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update Webhook
    ///
    /// @param String projectId
    /// @param String webhookId
    /// @param String name
    /// @param Array<Any>? events
    /// @param String url
    /// @param Bool security
    /// @param String httpUser
    /// @param String httpPass
    /// @throws Exception
    /// @return array
    ///
    open func updateWebhook(_ projectId: String, _ webhookId: String, _ name: String, _ events: Array<Any>?, _ url: String, _ security: Bool, _ httpUser: String = "", _ httpPass: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/webhooks/{webhookId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{webhookId}",
          with: webhookId
        )

        let params: [String: Any?] = [
            "name": name,
            "events": events,
            "url": url,
            "security": security,
            "httpUser": httpUser,
            "httpPass": httpPass
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "PUT", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Delete Webhook
    ///
    /// @param String projectId
    /// @param String webhookId
    /// @throws Exception
    /// @return array
    ///
    open func deleteWebhook(_ projectId: String, _ webhookId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/projects/{projectId}/webhooks/{webhookId}"

        path = path.replacingOccurrences(
          of: "{projectId}",
          with: projectId
        )

        path = path.replacingOccurrences(
          of: "{webhookId}",
          with: webhookId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "DELETE", path: path, headers: headers, params: params, completion: completion)
    }

}
