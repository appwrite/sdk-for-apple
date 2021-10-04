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
    open func list(search: String = "", limit: Int = 25, offset: Int = 0, orderType: String = "ASC", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func create(name: String, teamId: String, description: String = "", logo: String = "", url: String = "", legalName: String = "", legalCountry: String = "", legalState: String = "", legalCity: String = "", legalAddress: String = "", legalTaxId: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func get(projectId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func update(projectId: String, name: String, description: String = "", logo: String = "", url: String = "", legalName: String = "", legalCountry: String = "", legalState: String = "", legalCity: String = "", legalAddress: String = "", legalTaxId: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func delete(projectId: String, password: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func updateAuthLimit(projectId: String, limit: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func updateAuthStatus(projectId: String, method: String, status: Bool, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func listDomains(projectId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func createDomain(projectId: String, domain: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func getDomain(projectId: String, domainId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func deleteDomain(projectId: String, domainId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func updateDomainVerification(projectId: String, domainId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func listKeys(projectId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func createKey(projectId: String, name: String, scopes: Array<Any>?, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func getKey(projectId: String, keyId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func updateKey(projectId: String, keyId: String, name: String, scopes: Array<Any>?, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func deleteKey(projectId: String, keyId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func updateOAuth2(projectId: String, provider: String, appId: String = "", secret: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func listPlatforms(projectId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func createPlatform(projectId: String, type: String, name: String, key: String = "", store: String = "", hostname: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func getPlatform(projectId: String, platformId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func updatePlatform(projectId: String, platformId: String, name: String, key: String = "", store: String = "", hostname: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func deletePlatform(projectId: String, platformId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func listTasks(projectId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func createTask(projectId: String, name: String, status: String, schedule: String, security: Bool, httpMethod: String, httpUrl: String, httpHeaders: Array<Any>? = [], httpUser: String = "", httpPass: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func getTask(projectId: String, taskId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func updateTask(projectId: String, taskId: String, name: String, status: String, schedule: String, security: Bool, httpMethod: String, httpUrl: String, httpHeaders: Array<Any>? = [], httpUser: String = "", httpPass: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func deleteTask(projectId: String, taskId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func getUsage(projectId: String, range: String = "30d", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func listWebhooks(projectId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func createWebhook(projectId: String, name: String, events: Array<Any>?, url: String, security: Bool, httpUser: String = "", httpPass: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func getWebhook(projectId: String, webhookId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func updateWebhook(projectId: String, webhookId: String, name: String, events: Array<Any>?, url: String, security: Bool, httpUser: String = "", httpPass: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
    open func deleteWebhook(projectId: String, webhookId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
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
