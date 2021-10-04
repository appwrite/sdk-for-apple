import AsyncHTTPClient
import Foundation
import NIO

open class Storage: Service {
    ///
    /// List Files
    ///
    /// Get a list of all the user files. You can use the query params to filter
    /// your results. On admin mode, this endpoint will return a list of all of the
    /// project's files. [Learn more about different API modes](/docs/admin).
    ///
    /// @param String search
    /// @param Int limit
    /// @param Int offset
    /// @param String orderType
    /// @throws Exception
    /// @return array
    ///
    open func listFiles(search: String = "", limit: Int = 25, offset: Int = 0, orderType: String = "ASC", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        let path: String = "/storage/files"

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
    /// Create File
    ///
    /// Create a new file. The user who creates the file will automatically be
    /// assigned to read and write access unless he has passed custom values for
    /// read and write arguments.
    ///
    /// @param File file
    /// @param Array<Any>? read
    /// @param Array<Any>? write
    /// @throws Exception
    /// @return array
    ///
    open func createFile(file: File, read: Array<Any>? = [], write: Array<Any>? = [], completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        let path: String = "/storage/files"

        let params: [String: Any?] = [
            "file": file,
            "read": read,
            "write": write
        ]

        let headers: [String: String] = [
            "content-type": "multipart/form-data"
        ]

        client.call(method: "POST", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get File
    ///
    /// Get a file by its unique ID. This endpoint response returns a JSON object
    /// with the file metadata.
    ///
    /// @param String fileId
    /// @throws Exception
    /// @return array
    ///
    open func getFile(fileId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/storage/files/{fileId}"

        path = path.replacingOccurrences(
          of: "{fileId}",
          with: fileId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "GET", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Update File
    ///
    /// Update a file by its unique ID. Only users with write permissions have
    /// access to update this resource.
    ///
    /// @param String fileId
    /// @param Array<Any>? read
    /// @param Array<Any>? write
    /// @throws Exception
    /// @return array
    ///
    open func updateFile(fileId: String, read: Array<Any>?, write: Array<Any>?, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/storage/files/{fileId}"

        path = path.replacingOccurrences(
          of: "{fileId}",
          with: fileId
        )

        let params: [String: Any?] = [
            "read": read,
            "write": write
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "PUT", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Delete File
    ///
    /// Delete a file by its unique ID. Only users with write permissions have
    /// access to delete this resource.
    ///
    /// @param String fileId
    /// @throws Exception
    /// @return array
    ///
    open func deleteFile(fileId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/storage/files/{fileId}"

        path = path.replacingOccurrences(
          of: "{fileId}",
          with: fileId
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(method: "DELETE", path: path, headers: headers, params: params, completion: completion)
    }

    ///
    /// Get File for Download
    ///
    /// Get a file content by its unique ID. The endpoint response return with a
    /// 'Content-Disposition: attachment' header that tells the browser to start
    /// downloading the file to user downloads directory.
    ///
    /// @param String fileId
    /// @throws Exception
    /// @return array
    ///
    open func getFileDownload(fileId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/storage/files/{fileId}/download"

        path = path.replacingOccurrences(
          of: "{fileId}",
          with: fileId
        )

        let params: [String: Any?] = [
            "project": client.config["project"]
        ]

        client.call(method: "GET", path: path, params: params, completion: completion)
    }

    ///
    /// Get File Preview
    ///
    /// Get a file preview image. Currently, this method supports preview for image
    /// files (jpg, png, and gif), other supported formats, like pdf, docs, slides,
    /// and spreadsheets, will return the file icon image. You can also pass query
    /// string arguments for cutting and resizing your preview image.
    ///
    /// @param String fileId
    /// @param Int width
    /// @param Int height
    /// @param String gravity
    /// @param Int quality
    /// @param Int borderWidth
    /// @param String borderColor
    /// @param Int borderRadius
    /// @param Double opacity
    /// @param Int rotation
    /// @param String background
    /// @param String output
    /// @throws Exception
    /// @return array
    ///
    open func getFilePreview(fileId: String, width: Int = 0, height: Int = 0, gravity: String = "center", quality: Int = 100, borderWidth: Int = 0, borderColor: String = "", borderRadius: Int = 0, opacity: Double = 1.0, rotation: Int = 0, background: String = "", output: String = "", completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/storage/files/{fileId}/preview"

        path = path.replacingOccurrences(
          of: "{fileId}",
          with: fileId
        )

        let params: [String: Any?] = [
            "width": width,
            "height": height,
            "gravity": gravity,
            "quality": quality,
            "borderWidth": borderWidth,
            "borderColor": borderColor,
            "borderRadius": borderRadius,
            "opacity": opacity,
            "rotation": rotation,
            "background": background,
            "output": output,
            "project": client.config["project"]
        ]

        client.call(method: "GET", path: path, params: params, completion: completion)
    }

    ///
    /// Get File for View
    ///
    /// Get a file content by its unique ID. This endpoint is similar to the
    /// download method but returns with no  'Content-Disposition: attachment'
    /// header.
    ///
    /// @param String fileId
    /// @throws Exception
    /// @return array
    ///
    open func getFileView(fileId: String, completion: ((Result<HTTPClient.Response, AppwriteError>) -> Void)? = nil) {
        var path: String = "/storage/files/{fileId}/view"

        path = path.replacingOccurrences(
          of: "{fileId}",
          with: fileId
        )

        let params: [String: Any?] = [
            "project": client.config["project"]
        ]

        client.call(method: "GET", path: path, params: params, completion: completion)
    }

}
