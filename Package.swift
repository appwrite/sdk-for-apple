// swift-tools-version:6.1

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
                "JSONCodable",
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.36.1"),
        // swift-distributed-tracing 1.6.0 makes ServiceContext ambiguous inside async-http-client.
        .package(url: "https://github.com/apple/swift-distributed-tracing.git", "1.0.0"..<"1.6.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.102.0"),
        .package(url: "https://github.com/swift-server-community/mqtt-nio.git", from: "2.13.0"),
    ],
    targets: [
        .target(
            name: "Appwrite",
            dependencies: [
                .product(name: "AsyncHTTPClient", package: "async-http-client"),
                .product(name: "NIOWebSocket", package: "swift-nio"),
                .product(name: "NIOCore", package: "swift-nio"),
                .product(name: "MQTTNIO", package: "mqtt-nio"),
                "AppwriteModels",
                "AppwriteEnums",
                "JSONCodable",
            ]
        ),
        .target(
            name: "AppwriteModels",
            dependencies: [
                "AppwriteEnums",
                "JSONCodable",
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
                "Appwrite",
                .product(name: "NIOCore", package: "swift-nio"),
                .product(name: "NIOEmbedded", package: "swift-nio"),
                .product(name: "NIOWebSocket", package: "swift-nio"),
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
