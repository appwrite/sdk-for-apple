import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

/// The Videos service allows you to transcode video files into adaptive HLS and DASH streams.
open class Videos: Service {

    ///
    /// Get a list of videos in the current project. Sessions receive only videos
    /// they can read according to each video's `$permissions`. API keys and admins
    /// receive the full project catalog. Playback uses the same document read ACL
    /// plus the `videos.play` (or `videos.read`) scope: a guest can stream a video
    /// that grants `read("any")` or `read("guests")` even though guests lack
    /// `videos.read` and will not see it in this list.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VideoList
    ///
    open func list(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.VideoList {
        let apiPath: String = "/videos"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.VideoList = { response in
            return AppwriteModels.VideoList.from(map: response as! [String: Any])
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
    /// Create a video resource from an existing file in a storage bucket. The
    /// source file must be a video or audio file, and the caller must be able to
    /// read that file. Creating a video stores the document and queues timeline
    /// generation. The worker downloads the source, probes metadata, extracts
    /// embedded captions once, and deletes its working copy when finished. Sources
    /// with a video track also get a thumbnail timeline. Call create-rendition to
    /// package a streaming output.
    ///
    /// An optional `name` defaults to the source file name. An optional
    /// `permissions` array sets the video document ACL (list, get, update, delete,
    /// manage child resources, and playback). By default, only the current user is
    /// granted all permissions; API keys and admins create with empty permissions
    /// when omitted. Guests with `videos.play` can stream when the video grants
    /// them read (`read("any")` or `read("guests")`).
    ///
    /// Uploaded caption files stay listed alongside auto-extracted tracks for the
    /// same language; when the current default is an auto-extracted track with
    /// that code, the upload takes the default flag.
    ///
    /// - Parameters:
    ///   - videoId: String
    ///   - bucketId: String
    ///   - fileId: String
    ///   - name: String (optional)
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Video
    ///
    open func create(
        videoId: String,
        bucketId: String,
        fileId: String,
        name: String? = nil,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.Video {
        let apiPath: String = "/videos"

        let apiParams: [String: Any?] = [
            "videoId": videoId,
            "bucketId": bucketId,
            "fileId": fileId,
            "name": name,
            "permissions": permissions,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Video = { response in
            return AppwriteModels.Video.from(map: response as! [String: Any])
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
    /// Get a list of video encode codecs enabled on this instance. Each codec
    /// includes the output formats it may be packaged into.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VideoCodecList
    ///
    open func listCodecs() async throws -> AppwriteModels.VideoCodecList {
        let apiPath: String = "/videos/codecs"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.VideoCodecList = { response in
            return AppwriteModels.VideoCodecList.from(map: response as! [String: Any])
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
    /// Get a video by its unique ID. This endpoint response returns a JSON object
    /// with the video metadata.
    ///
    /// - Parameters:
    ///   - videoId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Video
    ///
    open func get(
        videoId: String
    ) async throws -> AppwriteModels.Video {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }

        let apiPath: String = "/videos/{videoId}"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Video = { response in
            return AppwriteModels.Video.from(map: response as! [String: Any])
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
    /// Update a video's name, permissions, or both. Only the fields you pass are
    /// changed: omit `name` to keep the current name and `permissions` to keep the
    /// current ACL. The caller must hold update permission on the video document.
    /// The source file cannot be replaced; delete the video and create a new one
    /// to point at a different file.
    ///
    /// - Parameters:
    ///   - videoId: String
    ///   - name: String (optional)
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Video
    ///
    open func update(
        videoId: String,
        name: String? = nil,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.Video {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }

        let apiPath: String = "/videos/{videoId}"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))

        let apiParams: [String: Any?] = [
            "name": name,
            "permissions": permissions,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Video = { response in
            return AppwriteModels.Video.from(map: response as! [String: Any])
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
    /// Delete a video by its unique ID. This also removes every rendition,
    /// caption, preview and transcoded artifact derived from it. Fails with
    /// `video_rendition_in_progress` while a rendition is started or ended, unless
    /// that rendition has not been updated within the rendition retention window.
    /// Fails with `video_timeline_in_progress` while the video's timeline is being
    /// generated, unless the video has not been updated within the same window.
    ///
    /// - Parameters:
    ///   - videoId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        videoId: String
    ) async throws -> Any {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }

        let apiPath: String = "/videos/{videoId}"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))

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
    ///
    /// Get a list of all the caption tracks attached to a video. You can use the
    /// query params to filter your results.
    ///
    /// - Parameters:
    ///   - videoId: String
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VideoCaptionList
    ///
    open func listCaptions(
        videoId: String,
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.VideoCaptionList {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }

        let apiPath: String = "/videos/{videoId}/captions"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.VideoCaptionList = { response in
            return AppwriteModels.VideoCaptionList.from(map: response as! [String: Any])
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
    /// Add a caption track to a video from a WebVTT or SubRip file in a storage
    /// bucket. The file is normalised to WebVTT and segmented in the background.
    /// Subscribe to `videos.[videoId].captions.[captionId].update` for `started`,
    /// `ready`, and `error` status changes instead of only polling the caption
    /// document.
    ///
    /// Uploaded tracks are listed alongside auto-extracted embedded tracks
    /// (`embedded: true`). When the current default is an auto-extracted track for
    /// the same language code, the upload takes the default flag so players pick
    /// the authored file first. Auto-extracted tracks are never removed
    /// automatically — delete a track explicitly to remove it. Extraction runs
    /// once per video, so a deleted extracted track is not re-created.
    ///
    /// - Parameters:
    ///   - videoId: String
    ///   - bucketId: String
    ///   - fileId: String
    ///   - name: String
    ///   - language: String
    ///   - default: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VideoCaption
    ///
    open func createCaption(
        videoId: String,
        bucketId: String,
        fileId: String,
        name: String,
        language: String,
        `default`: Bool? = nil
    ) async throws -> AppwriteModels.VideoCaption {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }

        let apiPath: String = "/videos/{videoId}/captions"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))

        let apiParams: [String: Any?] = [
            "bucketId": bucketId,
            "fileId": fileId,
            "name": name,
            "language": language,
            "default": `default`,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.VideoCaption = { response in
            return AppwriteModels.VideoCaption.from(map: response as! [String: Any])
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
    /// Update a caption track by its unique ID. Pass only `name`, `language`,
    /// and/or `default` to retag an extracted track (for example `und` → `heb`
    /// for Hebrew) without replacing the file. Changing `bucketId`/`fileId`
    /// re-packages the track in the background.
    ///
    /// - Parameters:
    ///   - videoId: String
    ///   - captionId: String
    ///   - bucketId: String (optional)
    ///   - fileId: String (optional)
    ///   - name: String (optional)
    ///   - language: String (optional)
    ///   - default: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VideoCaption
    ///
    open func updateCaption(
        videoId: String,
        captionId: String,
        bucketId: String? = nil,
        fileId: String? = nil,
        name: String? = nil,
        language: String? = nil,
        `default`: Bool? = nil
    ) async throws -> AppwriteModels.VideoCaption {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }
        if captionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"captionId\"")
        }

        let apiPath: String = "/videos/{videoId}/captions/{captionId}"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))
            .replacingOccurrences(of: "{captionId}", with: try Client.encodePath(captionId))

        let apiParams: [String: Any?] = [
            "bucketId": bucketId,
            "fileId": fileId,
            "name": name,
            "language": language,
            "default": `default`,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.VideoCaption = { response in
            return AppwriteModels.VideoCaption.from(map: response as! [String: Any])
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
    /// Delete a caption track by its unique ID, along with its packaged segments.
    ///
    /// - Parameters:
    ///   - videoId: String
    ///   - captionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteCaption(
        videoId: String,
        captionId: String
    ) async throws -> Any {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }
        if captionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"captionId\"")
        }

        let apiPath: String = "/videos/{videoId}/captions/{captionId}"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))
            .replacingOccurrences(of: "{captionId}", with: try Client.encodePath(captionId))

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
    ///
    /// Get the top-level streaming manifest for a video output: an HLS master
    /// playlist (`master.m3u8`) or a DASH MPD (`master.mpd`). Hand this URL to a
    /// player to begin adaptive playback.
    ///
    /// Guests can request this URL when they hold `videos.play` (or `videos.read`)
    /// **and** the video document grants them read. A video with `read("any")` or
    /// `read("guests")` is playable without a session.
    ///
    /// For CMAF renditions, use `getCmafHlsManifest` or `getCmafDashManifest`.
    /// Both masters point at the same fMP4 segment set.
    ///
    /// - Parameters:
    ///   - videoId: String
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getCmafHlsManifest(
        videoId: String
    ) async throws -> ByteBuffer {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }

        let apiPath: String = "/videos/{videoId}/outputs/cmaf/master.m3u8"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "*/*",
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Get the top-level streaming manifest for a video output: an HLS master
    /// playlist (`master.m3u8`) or a DASH MPD (`master.mpd`). Hand this URL to a
    /// player to begin adaptive playback.
    ///
    /// Guests can request this URL when they hold `videos.play` (or `videos.read`)
    /// **and** the video document grants them read. A video with `read("any")` or
    /// `read("guests")` is playable without a session.
    ///
    /// For CMAF renditions, use `getCmafHlsManifest` or `getCmafDashManifest`.
    /// Both masters point at the same fMP4 segment set.
    ///
    /// - Parameters:
    ///   - videoId: String
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getCmafDashManifest(
        videoId: String
    ) async throws -> ByteBuffer {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }

        let apiPath: String = "/videos/{videoId}/outputs/cmaf/master.mpd"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "*/*",
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Get the top-level streaming manifest for a video output: an HLS master
    /// playlist (`master.m3u8`) or a DASH MPD (`master.mpd`). Hand this URL to a
    /// player to begin adaptive playback.
    ///
    /// Guests can request this URL when they hold `videos.play` (or `videos.read`)
    /// **and** the video document grants them read. A video with `read("any")` or
    /// `read("guests")` is playable without a session.
    ///
    /// For CMAF renditions, use `getCmafHlsManifest` or `getCmafDashManifest`.
    /// Both masters point at the same fMP4 segment set.
    ///
    /// - Parameters:
    ///   - videoId: String
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getDashManifest(
        videoId: String
    ) async throws -> ByteBuffer {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }

        let apiPath: String = "/videos/{videoId}/outputs/dash/master.mpd"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "*/*",
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Get the top-level streaming manifest for a video output: an HLS master
    /// playlist (`master.m3u8`) or a DASH MPD (`master.mpd`). Hand this URL to a
    /// player to begin adaptive playback.
    ///
    /// Guests can request this URL when they hold `videos.play` (or `videos.read`)
    /// **and** the video document grants them read. A video with `read("any")` or
    /// `read("guests")` is playable without a session.
    ///
    /// For CMAF renditions, use `getCmafHlsManifest` or `getCmafDashManifest`.
    /// Both masters point at the same fMP4 segment set.
    ///
    /// - Parameters:
    ///   - videoId: String
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getHlsManifest(
        videoId: String
    ) async throws -> ByteBuffer {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }

        let apiPath: String = "/videos/{videoId}/outputs/hls/master.m3u8"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "*/*",
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Get the playable caption resource for a video output: an HLS captions
    /// playlist, or the WebVTT file itself for DASH.
    ///
    /// Guests can request this URL when they hold `videos.play` (or `videos.read`)
    /// **and** the video document grants them read.
    ///
    /// - Parameters:
    ///   - videoId: String
    ///   - output: AppwriteEnums.VideoOutput
    ///   - captionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getCaptionManifest(
        videoId: String,
        output: AppwriteEnums.VideoOutput,
        captionId: String
    ) async throws -> ByteBuffer {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }
        if captionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"captionId\"")
        }

        let apiPath: String = "/videos/{videoId}/outputs/{output}/captions/{captionId}/manifest"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))
            .replacingOccurrences(of: "{output}", with: try Client.encodePath(output.rawValue))
            .replacingOccurrences(of: "{captionId}", with: try Client.encodePath(captionId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "*/*",
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Get a list of all the renditions of a video. You can use the query params
    /// to filter your results.
    ///
    /// - Parameters:
    ///   - videoId: String
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VideoRenditionList
    ///
    open func listRenditions(
        videoId: String,
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.VideoRenditionList {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }

        let apiPath: String = "/videos/{videoId}/renditions"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.VideoRenditionList = { response in
            return AppwriteModels.VideoRenditionList.from(map: response as! [String: Any])
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
    /// Get a rendition by its unique ID, including its current transcoding status
    /// and progress.
    ///
    /// - Parameters:
    ///   - videoId: String
    ///   - renditionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VideoRendition
    ///
    open func getRendition(
        videoId: String,
        renditionId: String
    ) async throws -> AppwriteModels.VideoRendition {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }
        if renditionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"renditionId\"")
        }

        let apiPath: String = "/videos/{videoId}/renditions/{renditionId}"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))
            .replacingOccurrences(of: "{renditionId}", with: try Client.encodePath(renditionId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.VideoRendition = { response in
            return AppwriteModels.VideoRendition.from(map: response as! [String: Any])
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
    /// Delete a rendition by its unique ID, along with its packaged segments and
    /// transcoded output. Fails with `video_rendition_in_progress` while the
    /// rendition is started or ended, unless it has not been updated within the
    /// rendition retention window.
    ///
    /// - Parameters:
    ///   - videoId: String
    ///   - renditionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteRendition(
        videoId: String,
        renditionId: String
    ) async throws -> Any {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }
        if renditionId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"renditionId\"")
        }

        let apiPath: String = "/videos/{videoId}/renditions/{renditionId}"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))
            .replacingOccurrences(of: "{renditionId}", with: try Client.encodePath(renditionId))

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
    ///
    /// Get a single thumbnail sheet from a video's timeline as an image. You can
    /// resize the returned image and choose its output format.
    ///
    /// Guests can request this URL when they hold `videos.play` (or `videos.read`)
    /// **and** the video document grants them read.
    ///
    /// - Parameters:
    ///   - videoId: String
    ///   - thumbnailId: String
    ///   - width: Int (optional)
    ///   - height: Int (optional)
    ///   - output: AppwriteEnums.ImageFormat (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getThumbnail(
        videoId: String,
        thumbnailId: String,
        width: Int? = nil,
        height: Int? = nil,
        output: AppwriteEnums.ImageFormat? = nil
    ) async throws -> ByteBuffer {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }
        if thumbnailId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"thumbnailId\"")
        }

        let apiPath: String = "/videos/{videoId}/thumbnails/{thumbnailId}"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))
            .replacingOccurrences(of: "{thumbnailId}", with: try Client.encodePath(thumbnailId))

        let apiParams: [String: Any?] = [
            "width": width,
            "height": height,
            "output": output?.rawValue,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "image/*",
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Get the WebVTT thumbnail timeline for a video, used to render scrubbing
    /// thumbnails in a player. Timeline generation is queued when the video is
    /// created. Subscribe to `videos.[videoId].timelines.update` for probe and
    /// terminal updates, or poll this endpoint until it returns a WebVTT document.
    /// Audio-only sources produce no timeline and this endpoint returns
    /// `video_timelines_not_found`.
    ///
    /// Guests can request this URL when they hold `videos.play` (or `videos.read`)
    /// **and** the video document grants them read. A video with `read("any")` or
    /// `read("guests")` is playable without a session.
    ///
    /// - Parameters:
    ///   - videoId: String
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getTimeline(
        videoId: String
    ) async throws -> ByteBuffer {
        if videoId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"videoId\"")
        }

        let apiPath: String = "/videos/{videoId}/timeline"
            .replacingOccurrences(of: "{videoId}", with: try Client.encodePath(videoId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "*/*",
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
}
