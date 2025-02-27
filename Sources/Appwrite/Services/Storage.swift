import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Storage service allows you to manage your project files.
open class Storage: Service {

    ///
    /// Get a list of all the user files. You can use the query params to filter
    /// your results.
    ///
    /// @param String bucketId
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func listFiles(
        bucketId: String,
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.FileList {
        let apiPath: String = "/storage/buckets/{bucketId}/files"
            .replacingOccurrences(of: "{bucketId}", with: bucketId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.FileList = { response in
            return AppwriteModels.FileList.from(map: response as! [String: Any])
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
    /// Create a new file. Before using this route, you should create a new bucket
    /// resource using either a [server
    /// integration](https://appwrite.io/docs/server/storage#storageCreateBucket)
    /// API or directly from your Appwrite console.
    /// 
    /// Larger files should be uploaded using multiple requests with the
    /// [content-range](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Range)
    /// header to send a partial request with a maximum supported chunk of `5MB`.
    /// The `content-range` header values should always be in bytes.
    /// 
    /// When the first request is sent, the server will return the **File** object,
    /// and the subsequent part request must include the file's **id** in
    /// `x-appwrite-id` header to allow the server to know that the partial upload
    /// is for the existing file and not for a new one.
    /// 
    /// If you're creating a new file using one of the Appwrite SDKs, all the
    /// chunking logic will be managed by the SDK internally.
    /// 
    ///
    /// @param String bucketId
    /// @param String fileId
    /// @param InputFile file
    /// @param [String] permissions
    /// @throws Exception
    /// @return array
    ///
    open func createFile(
        bucketId: String,
        fileId: String,
        file: InputFile,
        permissions: [String]? = nil,
        onProgress: ((UploadProgress) -> Void)? = nil
    ) async throws -> AppwriteModels.File {
        let apiPath: String = "/storage/buckets/{bucketId}/files"
            .replacingOccurrences(of: "{bucketId}", with: bucketId)

        var apiParams: [String: Any?] = [
            "fileId": fileId,
            "file": file,
            "permissions": permissions
        ]

        var apiHeaders: [String: String] = [
            "content-type": "multipart/form-data"
        ]

        let converter: (Any) -> AppwriteModels.File = { response in
            return AppwriteModels.File.from(map: response as! [String: Any])
        }

        let idParamName: String? = "fileId"
        let paramName = "file"
        return try await client.chunkedUpload(
            path: apiPath,
            headers: &apiHeaders,
            params: &apiParams,
            paramName: paramName,
            idParamName: idParamName,
            converter: converter,
            onProgress: onProgress
        )
    }

    ///
    /// Get a file by its unique ID. This endpoint response returns a JSON object
    /// with the file metadata.
    ///
    /// @param String bucketId
    /// @param String fileId
    /// @throws Exception
    /// @return array
    ///
    open func getFile(
        bucketId: String,
        fileId: String
    ) async throws -> AppwriteModels.File {
        let apiPath: String = "/storage/buckets/{bucketId}/files/{fileId}"
            .replacingOccurrences(of: "{bucketId}", with: bucketId)
            .replacingOccurrences(of: "{fileId}", with: fileId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.File = { response in
            return AppwriteModels.File.from(map: response as! [String: Any])
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
    /// Update a file by its unique ID. Only users with write permissions have
    /// access to update this resource.
    ///
    /// @param String bucketId
    /// @param String fileId
    /// @param String name
    /// @param [String] permissions
    /// @throws Exception
    /// @return array
    ///
    open func updateFile(
        bucketId: String,
        fileId: String,
        name: String? = nil,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.File {
        let apiPath: String = "/storage/buckets/{bucketId}/files/{fileId}"
            .replacingOccurrences(of: "{bucketId}", with: bucketId)
            .replacingOccurrences(of: "{fileId}", with: fileId)

        let apiParams: [String: Any?] = [
            "name": name,
            "permissions": permissions
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.File = { response in
            return AppwriteModels.File.from(map: response as! [String: Any])
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
    /// Delete a file by its unique ID. Only users with write permissions have
    /// access to delete this resource.
    ///
    /// @param String bucketId
    /// @param String fileId
    /// @throws Exception
    /// @return array
    ///
    open func deleteFile(
        bucketId: String,
        fileId: String
    ) async throws -> Any {
        let apiPath: String = "/storage/buckets/{bucketId}/files/{fileId}"
            .replacingOccurrences(of: "{bucketId}", with: bucketId)
            .replacingOccurrences(of: "{fileId}", with: fileId)

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
    /// Get a file content by its unique ID. The endpoint response return with a
    /// 'Content-Disposition: attachment' header that tells the browser to start
    /// downloading the file to user downloads directory.
    ///
    /// @param String bucketId
    /// @param String fileId
    /// @throws Exception
    /// @return array
    ///
    open func getFileDownload(
        bucketId: String,
        fileId: String
    ) async throws -> ByteBuffer {
        let apiPath: String = "/storage/buckets/{bucketId}/files/{fileId}/download"
            .replacingOccurrences(of: "{bucketId}", with: bucketId)
            .replacingOccurrences(of: "{fileId}", with: fileId)

        let apiParams: [String: Any] = [:]

        return try await client.call(
            method: "GET",
            path: apiPath,
            params: apiParams
        )
    }

    ///
    /// Get a file preview image. Currently, this method supports preview for image
    /// files (jpg, png, and gif), other supported formats, like pdf, docs, slides,
    /// and spreadsheets, will return the file icon image. You can also pass query
    /// string arguments for cutting and resizing your preview image. Preview is
    /// supported only for image files smaller than 10MB.
    ///
    /// @param String bucketId
    /// @param String fileId
    /// @param Int width
    /// @param Int height
    /// @param AppwriteEnums.ImageGravity gravity
    /// @param Int quality
    /// @param Int borderWidth
    /// @param String borderColor
    /// @param Int borderRadius
    /// @param Double opacity
    /// @param Int rotation
    /// @param String background
    /// @param AppwriteEnums.ImageFormat output
    /// @throws Exception
    /// @return array
    ///
    open func getFilePreview(
        bucketId: String,
        fileId: String,
        width: Int? = nil,
        height: Int? = nil,
        gravity: AppwriteEnums.ImageGravity? = nil,
        quality: Int? = nil,
        borderWidth: Int? = nil,
        borderColor: String? = nil,
        borderRadius: Int? = nil,
        opacity: Double? = nil,
        rotation: Int? = nil,
        background: String? = nil,
        output: AppwriteEnums.ImageFormat? = nil
    ) async throws -> ByteBuffer {
        let apiPath: String = "/storage/buckets/{bucketId}/files/{fileId}/preview"
            .replacingOccurrences(of: "{bucketId}", with: bucketId)
            .replacingOccurrences(of: "{fileId}", with: fileId)

        let apiParams: [String: Any?] = [
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

        return try await client.call(
            method: "GET",
            path: apiPath,
            params: apiParams
        )
    }

    ///
    /// Get a file content by its unique ID. This endpoint is similar to the
    /// download method but returns with no  'Content-Disposition: attachment'
    /// header.
    ///
    /// @param String bucketId
    /// @param String fileId
    /// @throws Exception
    /// @return array
    ///
    open func getFileView(
        bucketId: String,
        fileId: String
    ) async throws -> ByteBuffer {
        let apiPath: String = "/storage/buckets/{bucketId}/files/{fileId}/view"
            .replacingOccurrences(of: "{bucketId}", with: bucketId)
            .replacingOccurrences(of: "{fileId}", with: fileId)

        let apiParams: [String: Any] = [:]

        return try await client.call(
            method: "GET",
            path: apiPath,
            params: apiParams
        )
    }


}