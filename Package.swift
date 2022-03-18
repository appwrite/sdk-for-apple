// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Appwrite",
    platforms: [
        .iOS("15.0"),
        .macOS("11.0"),
        .watchOS("6.0"),
        .tvOS("13.0"),
    ],
    products: [
        .library(
            name: "Appwrite",
            targets: ["Appwrite", "AppwriteModels"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.9.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.32.0")
    ],
    targets: [
        .target(
            name: "Appwrite",
            dependencies: [
                .product(name: "AsyncHTTPClient", package: "async-http-client"),
                .product(name: "NIOWebSocket", package: "swift-nio"),
                "AppwriteModels"
            ]
        ),
        .target(
            name: "AppwriteModels"
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