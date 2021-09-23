// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Appwrite",
    products: [
        .library(
            name: "Appwrite",
            targets: ["Appwrite"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.0.0"),
        .package(url: "https://github.com/abnegate/swockets.git", .branch("develop"))
    ],
    targets: [
        .target(
            name: "Appwrite",
            dependencies: [
                .product(name: "AsyncHTTPClient", package: "async-http-client"),
                "Swockets"
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)