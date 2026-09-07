import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

/// The Avatars service aims to help you complete everyday tasks related to your app image, icons, and avatars.
open class Avatars: Service {

    ///
    /// You can use this endpoint to show different browser icons to your users.
    /// The code argument receives the browser code as it appears in your user [GET
    /// /account/sessions](https://appwrite.io/docs/references/cloud/client-web/account#getSessions)
    /// endpoint. Use width, height and quality arguments to change the output
    /// settings.
    ///
    /// When one dimension is specified and the other is 0, the image is scaled
    /// with preserved aspect ratio. If both dimensions are 0, the API provides an
    /// image at source quality. If dimensions are not specified, the default size
    /// of image returned is 100x100px.
    ///
    /// - Parameters:
    ///   - code: AppwriteEnums.Browser
    ///   - width: Int (optional)
    ///   - height: Int (optional)
    ///   - quality: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getBrowser(
        code: AppwriteEnums.Browser,
        width: Int? = nil,
        height: Int? = nil,
        quality: Int? = nil
    ) async throws -> ByteBuffer {
        let apiPath: String = "/avatars/browsers/{code}"
            .replacingOccurrences(of: "{code}", with: code.rawValue)

        let apiParams: [String: Any?] = [
            "width": width,
            "height": height,
            "quality": quality,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "image/png",
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// The credit card endpoint will return you the icon of the credit card
    /// provider you need. Use width, height and quality arguments to change the
    /// output settings.
    ///
    /// When one dimension is specified and the other is 0, the image is scaled
    /// with preserved aspect ratio. If both dimensions are 0, the API provides an
    /// image at source quality. If dimensions are not specified, the default size
    /// of image returned is 100x100px.
    ///
    /// - Parameters:
    ///   - code: AppwriteEnums.CreditCard
    ///   - width: Int (optional)
    ///   - height: Int (optional)
    ///   - quality: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getCreditCard(
        code: AppwriteEnums.CreditCard,
        width: Int? = nil,
        height: Int? = nil,
        quality: Int? = nil
    ) async throws -> ByteBuffer {
        let apiPath: String = "/avatars/credit-cards/{code}"
            .replacingOccurrences(of: "{code}", with: code.rawValue)

        let apiParams: [String: Any?] = [
            "width": width,
            "height": height,
            "quality": quality,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "image/png",
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Use this endpoint to fetch the favorite icon (AKA favicon) of any remote
    /// website URL.
    ///
    /// This endpoint does not follow HTTP redirects.
    ///
    /// - Parameters:
    ///   - url: String
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getFavicon(
        url: String
    ) async throws -> ByteBuffer {
        let apiPath: String = "/avatars/favicon"

        let apiParams: [String: Any?] = [
            "url": url
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
    /// You can use this endpoint to show different country flags icons to your
    /// users. The code argument receives the 2 letter country code. Use width,
    /// height and quality arguments to change the output settings. Country codes
    /// follow the [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1) standard.
    ///
    /// When one dimension is specified and the other is 0, the image is scaled
    /// with preserved aspect ratio. If both dimensions are 0, the API provides an
    /// image at source quality. If dimensions are not specified, the default size
    /// of image returned is 100x100px.
    ///
    /// - Parameters:
    ///   - code: AppwriteEnums.Flag
    ///   - width: Int (optional)
    ///   - height: Int (optional)
    ///   - quality: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getFlag(
        code: AppwriteEnums.Flag,
        width: Int? = nil,
        height: Int? = nil,
        quality: Int? = nil
    ) async throws -> ByteBuffer {
        let apiPath: String = "/avatars/flags/{code}"
            .replacingOccurrences(of: "{code}", with: code.rawValue)

        let apiParams: [String: Any?] = [
            "width": width,
            "height": height,
            "quality": quality,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "image/png",
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Use this endpoint to fetch a remote image URL and crop it to any image size
    /// you want. This endpoint is very useful if you need to crop and display
    /// remote images in your app or in case you want to make sure a 3rd party
    /// image is properly served using a TLS protocol.
    ///
    /// When one dimension is specified and the other is 0, the image is scaled
    /// with preserved aspect ratio. If both dimensions are 0, the API provides an
    /// image at source quality. If dimensions are not specified, the default size
    /// of image returned is 400x400px.
    ///
    /// This endpoint does not follow HTTP redirects.
    ///
    /// - Parameters:
    ///   - url: String
    ///   - width: Int (optional)
    ///   - height: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getImage(
        url: String,
        width: Int? = nil,
        height: Int? = nil
    ) async throws -> ByteBuffer {
        let apiPath: String = "/avatars/image"

        let apiParams: [String: Any?] = [
            "url": url,
            "width": width,
            "height": height,
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
    /// Use this endpoint to show your user initials avatar icon on your website or
    /// app. By default, this route will try to print your logged-in user name or
    /// email initials. You can also overwrite the user name if you pass the 'name'
    /// parameter. If no name is given and no user is logged, an empty avatar will
    /// be returned.
    ///
    /// You can use the color and background params to change the avatar colors. By
    /// default, a random theme will be selected. The random theme will persist for
    /// the user's initials when reloading the same theme will always return for
    /// the same initials.
    ///
    /// When one dimension is specified and the other is 0, the image is scaled
    /// with preserved aspect ratio. If both dimensions are 0, the API provides an
    /// image at source quality. If dimensions are not specified, the default size
    /// of image returned is 100x100px.
    ///
    /// - Parameters:
    ///   - name: String (optional)
    ///   - width: Int (optional)
    ///   - height: Int (optional)
    ///   - background: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getInitials(
        name: String? = nil,
        width: Int? = nil,
        height: Int? = nil,
        background: String? = nil
    ) async throws -> ByteBuffer {
        let apiPath: String = "/avatars/initials"

        let apiParams: [String: Any?] = [
            "name": name,
            "width": width,
            "height": height,
            "background": background,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "image/png",
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Returns the best available profile photo for a user. The endpoint tries
    /// each source in priority order and returns the first successful result:
    /// OAuth2 identity photo, Gravatar, Libravatar, Appwrite Initials, built-in
    /// static fallback.
    ///
    /// Passing `userId` — `current()` for the authenticated user — resolves
    /// the photo from everything known about that user: identity photos, email,
    /// and name. An explicit `emailHash` or `name` then overrides just that value,
    /// and the user's remaining sources stay in the chain. Without `userId`,
    /// passing `emailHash` and/or `name` resolves the avatar from those values
    /// alone: the hash is looked up on Gravatar and Libravatar, the name is
    /// rendered as initials, and the session user stays out of the chain so their
    /// own photo never shadows the avatar being asked for. When nothing is passed,
    /// the photo resolves for the currently authenticated user. Emails are only
    /// ever accepted pre-hashed, so no address ends up in a URL.
    ///
    /// - Parameters:
    ///   - width: Int (optional)
    ///   - height: Int (optional)
    ///   - quality: Int (optional)
    ///   - output: String (optional)
    ///   - rating: String (optional)
    ///   - userId: String (optional)
    ///   - emailHash: String (optional)
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getPhoto(
        width: Int? = nil,
        height: Int? = nil,
        quality: Int? = nil,
        output: String? = nil,
        rating: String? = nil,
        userId: String? = nil,
        emailHash: String? = nil,
        name: String? = nil
    ) async throws -> ByteBuffer {
        let apiPath: String = "/avatars/photo"

        let apiParams: [String: Any?] = [
            "width": width,
            "height": height,
            "quality": quality,
            "output": output,
            "rating": rating,
            "userId": userId,
            "emailHash": emailHash,
            "name": name,
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
    /// Converts a given plain text to a QR code image. You can use the query
    /// parameters to change the size and style of the resulting image.
    ///
    /// - Parameters:
    ///   - text: String
    ///   - size: Int (optional)
    ///   - margin: Int (optional)
    ///   - download: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getQR(
        text: String,
        size: Int? = nil,
        margin: Int? = nil,
        download: Bool? = nil
    ) async throws -> ByteBuffer {
        let apiPath: String = "/avatars/qr"

        let apiParams: [String: Any?] = [
            "text": text,
            "size": size,
            "margin": margin,
            "download": download,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "image/png",
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Use this endpoint to capture a screenshot of any website URL. This endpoint
    /// uses a headless browser to render the webpage and capture it as an image.
    ///
    /// You can configure the browser viewport size, theme, user agent,
    /// geolocation, permissions, and more. Capture either just the viewport or the
    /// full page scroll.
    ///
    /// When width and height are specified, the image is resized accordingly. If
    /// both dimensions are 0, the API provides an image at original size. If
    /// dimensions are not specified, the default viewport size is 1280x720px.
    ///
    /// - Parameters:
    ///   - url: String
    ///   - headers: Any (optional)
    ///   - viewportWidth: Int (optional)
    ///   - viewportHeight: Int (optional)
    ///   - scale: Double (optional)
    ///   - theme: AppwriteEnums.BrowserTheme (optional)
    ///   - userAgent: String (optional)
    ///   - fullpage: Bool (optional)
    ///   - locale: String (optional)
    ///   - timezone: AppwriteEnums.Timezone (optional)
    ///   - latitude: Double (optional)
    ///   - longitude: Double (optional)
    ///   - accuracy: Double (optional)
    ///   - touch: Bool (optional)
    ///   - permissions: [AppwriteEnums.BrowserPermission] (optional)
    ///   - sleep: Int (optional)
    ///   - width: Int (optional)
    ///   - height: Int (optional)
    ///   - quality: Int (optional)
    ///   - output: AppwriteEnums.ImageFormat (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getScreenshot(
        url: String,
        headers: Any? = nil,
        viewportWidth: Int? = nil,
        viewportHeight: Int? = nil,
        scale: Double? = nil,
        theme: AppwriteEnums.BrowserTheme? = nil,
        userAgent: String? = nil,
        fullpage: Bool? = nil,
        locale: String? = nil,
        timezone: AppwriteEnums.Timezone? = nil,
        latitude: Double? = nil,
        longitude: Double? = nil,
        accuracy: Double? = nil,
        touch: Bool? = nil,
        permissions: [AppwriteEnums.BrowserPermission]? = nil,
        sleep: Int? = nil,
        width: Int? = nil,
        height: Int? = nil,
        quality: Int? = nil,
        output: AppwriteEnums.ImageFormat? = nil
    ) async throws -> ByteBuffer {
        let apiPath: String = "/avatars/screenshots"

        let apiParams: [String: Any?] = [
            "url": url,
            "headers": headers,
            "viewportWidth": viewportWidth,
            "viewportHeight": viewportHeight,
            "scale": scale,
            "theme": theme?.rawValue,
            "userAgent": userAgent,
            "fullpage": fullpage,
            "locale": locale,
            "timezone": timezone?.rawValue,
            "latitude": latitude,
            "longitude": longitude,
            "accuracy": accuracy,
            "touch": touch,
            "permissions": permissions?.map { $0.rawValue },
            "sleep": sleep,
            "width": width,
            "height": height,
            "quality": quality,
            "output": output?.rawValue,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "image/png",
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
}
