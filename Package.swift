// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Appwrite",
    platforms: [
        .iOS("15.0"),
        .macOS("12.0"),
        .watchOS("8.0"),
        .tvOS("15.0"),
    ],
    products: [
        .library(
            name: "Appwrite",
            targets: [
                "Appwrite",
                "AppwriteEnums",
                "AppwriteModels",
                "JSONCodable"
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.33.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.94.0"),
    ],
    targets: [
        .target(
            name: "Appwrite",
            dependencies: [
                .product(name: "AsyncHTTPClient", package: "async-http-client"),
                .product(name: "NIOWebSocket", package: "swift-nio"),
                "AppwriteModels",
                "AppwriteEnums",
                "JSONCodable"
            ]
        ),
        .target(
            name: "AppwriteModels",
            dependencies: [
                "AppwriteEnums",
                "JSONCodable"
            ]
        ),
        .target(
            name: "AppwriteEnums"
        ),
        .target(
            name: "JSONCodable"
        ),
        .testTarget(
            name: "AppwriteTests",
            dependencies: [
                "Appwrite"
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
