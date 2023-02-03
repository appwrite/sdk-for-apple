import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteModels

/// The Avatars service aims to help you complete everyday tasks related to your app image, icons, and avatars.
open class Avatars: Service {

    ///
    /// Get Browser Icon
    ///
    /// You can use this endpoint to show different browser icons to your users.
    /// The code argument receives the browser code as it appears in your user [GET
    /// /account/sessions](/docs/client/account#accountGetSessions) endpoint. Use
    /// width, height and quality arguments to change the output settings.
    /// 
    /// When one dimension is specified and the other is 0, the image is scaled
    /// with preserved aspect ratio. If both dimensions are 0, the API provides an
    /// image at source quality. If dimensions are not specified, the default size
    /// of image returned is 100x100px.
    ///
    /// @param String code
    /// @param Int width
    /// @param Int height
    /// @param Int quality
    /// @throws Exception
    /// @return array
    ///
    open func getBrowser(
        code: String,
        width: Int? = nil,
        height: Int? = nil,
        quality: Int? = nil
    ) async throws -> ByteBuffer {
        let path: String = "/avatars/browsers/{code}"
            .replacingOccurrences(of: "{code}", with: code)

        let params: [String: Any?] = [
            "width": width,
            "height": height,
            "quality": quality
        ]

        return try await client.call(
            method: "GET",
            path: path,
            params: params
        )
    }

    ///
    /// Get Credit Card Icon
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
    ///
    /// @param String code
    /// @param Int width
    /// @param Int height
    /// @param Int quality
    /// @throws Exception
    /// @return array
    ///
    open func getCreditCard(
        code: String,
        width: Int? = nil,
        height: Int? = nil,
        quality: Int? = nil
    ) async throws -> ByteBuffer {
        let path: String = "/avatars/credit-cards/{code}"
            .replacingOccurrences(of: "{code}", with: code)

        let params: [String: Any?] = [
            "width": width,
            "height": height,
            "quality": quality
        ]

        return try await client.call(
            method: "GET",
            path: path,
            params: params
        )
    }

    ///
    /// Get Favicon
    ///
    /// Use this endpoint to fetch the favorite icon (AKA favicon) of any remote
    /// website URL.
    /// 
    ///
    /// @param String url
    /// @throws Exception
    /// @return array
    ///
    open func getFavicon(
        url: String
    ) async throws -> ByteBuffer {
        let path: String = "/avatars/favicon"

        let params: [String: Any?] = [
            "url": url
        ]

        return try await client.call(
            method: "GET",
            path: path,
            params: params
        )
    }

    ///
    /// Get Country Flag
    ///
    /// You can use this endpoint to show different country flags icons to your
    /// users. The code argument receives the 2 letter country code. Use width,
    /// height and quality arguments to change the output settings. Country codes
    /// follow the [ISO 3166-1](http://en.wikipedia.org/wiki/ISO_3166-1) standard.
    /// 
    /// When one dimension is specified and the other is 0, the image is scaled
    /// with preserved aspect ratio. If both dimensions are 0, the API provides an
    /// image at source quality. If dimensions are not specified, the default size
    /// of image returned is 100x100px.
    /// 
    ///
    /// @param String code
    /// @param Int width
    /// @param Int height
    /// @param Int quality
    /// @throws Exception
    /// @return array
    ///
    open func getFlag(
        code: String,
        width: Int? = nil,
        height: Int? = nil,
        quality: Int? = nil
    ) async throws -> ByteBuffer {
        let path: String = "/avatars/flags/{code}"
            .replacingOccurrences(of: "{code}", with: code)

        let params: [String: Any?] = [
            "width": width,
            "height": height,
            "quality": quality
        ]

        return try await client.call(
            method: "GET",
            path: path,
            params: params
        )
    }

    ///
    /// Get Image from URL
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
    ///
    /// @param String url
    /// @param Int width
    /// @param Int height
    /// @throws Exception
    /// @return array
    ///
    open func getImage(
        url: String,
        width: Int? = nil,
        height: Int? = nil
    ) async throws -> ByteBuffer {
        let path: String = "/avatars/image"

        let params: [String: Any?] = [
            "url": url,
            "width": width,
            "height": height
        ]

        return try await client.call(
            method: "GET",
            path: path,
            params: params
        )
    }

    ///
    /// Get User Initials
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
    ///
    /// @param String name
    /// @param Int width
    /// @param Int height
    /// @param String background
    /// @throws Exception
    /// @return array
    ///
    open func getInitials(
        name: String? = nil,
        width: Int? = nil,
        height: Int? = nil,
        background: String? = nil
    ) async throws -> ByteBuffer {
        let path: String = "/avatars/initials"

        let params: [String: Any?] = [
            "name": name,
            "width": width,
            "height": height,
            "background": background
        ]

        return try await client.call(
            method: "GET",
            path: path,
            params: params
        )
    }

    ///
    /// Get QR Code
    ///
    /// Converts a given plain text to a QR code image. You can use the query
    /// parameters to change the size and style of the resulting image.
    /// 
    ///
    /// @param String text
    /// @param Int size
    /// @param Int margin
    /// @param Bool download
    /// @throws Exception
    /// @return array
    ///
    open func getQR(
        text: String,
        size: Int? = nil,
        margin: Int? = nil,
        download: Bool? = nil
    ) async throws -> ByteBuffer {
        let path: String = "/avatars/qr"

        let params: [String: Any?] = [
            "text": text,
            "size": size,
            "margin": margin,
            "download": download
        ]

        return try await client.call(
            method: "GET",
            path: path,
            params: params
        )
    }


}