// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ApiCore",
    products: [
        .library(name: "ApiCore", targets: ["ApiCore"]),
        .library(name: "FileCore", targets: ["FileCore"]),
        .library(name: "ImageCore", targets: ["ImageCore"]),
        .library(name: "ResourceCache", targets: ["ResourceCache"]),
        .library(name: "ApiCoreTestTools", targets: ["ApiCoreTestTools"])
    ],
    dependencies: [
        .package(name: "Vapor", url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(name: "Core", url: "https://github.com/vapor/core.git", from: "3.4.1"),
        .package(name: "Crypto", url: "https://github.com/vapor/crypto.git", from: "3.2.0"),
        .package(name: "Fluent", url: "https://github.com/vapor/fluent.git", from: "3.0.0"),
        .package(name: "FluentPostgreSQL", url: "https://github.com/vapor/fluent-postgresql.git", from: "1.0.0"),
        .package(name: "JWT", url: "https://github.com/vapor/jwt.git", from: "3.0.0"),
        .package(name: "Leaf", url: "https://github.com/vapor/leaf.git", from: "3.0.0"),
        .package(url: "https://github.com/twostraws/SwiftGD.git", .upToNextMinor(from: "2.3.0")),
        .package(url: "https://github.com/lynnzc/S3.git", from: "3.0.0"),
        .package(url: "https://github.com/LiveUI/MailCore.git", from: "0.2.3"),
        .package(url: "https://github.com/LiveUI/ErrorsCore.git", from: "0.1.0"),
        .package(url: "https://github.com/LiveUI/VaporTestTools.git", from: "0.1.5"),
        .package(url: "https://github.com/LiveUI/FluentTestTools.git", from: "0.1.0"),
        .package(url: "https://github.com/vapor-community/Imperial.git", from: "0.12.0")
    ],
    targets: [
        .target(
            name: "ApiCoreApp",
            dependencies: [
                "Vapor",
                "ApiCore"
            ]
        ),
        .target(
            name: "ResourceCache",
            dependencies: [
                "Vapor"
            ]
        ),
        .target(name: "ApiCoreRun", dependencies: [
                "ApiCoreApp"
            ]
        ),
        .target(name: "ApiCore", dependencies: [
                "Vapor",
                "Fluent",
                "Crypto",
                .product(name: "Random", package: "Crypto"),
                "FluentPostgreSQL",
                "ErrorsCore",
                "JWT",
                "MailCore",
                "Leaf",
                "FileCore",
                "ImageCore",
                "Imperial",
                "ResourceCache"
            ]
        ),
        .target(name: "FileCore", dependencies: [
                "Vapor",
                "ErrorsCore",
                "S3"
            ]
        ),
        .target(name: "ImageCore", dependencies: [
                "Vapor",
                "ErrorsCore",
                "SwiftGD",
                .product(name: "COperatingSystem", package: "Core")
            ]
        ),
        .target(
            name: "ApiCoreTestTools",
            dependencies: [
                "Vapor",
                "ApiCore",
                "VaporTestTools",
                "FluentTestTools",
                .product(name: "MailCoreTestTools", package: "MailCore")
            ]
        ),
        .testTarget(name: "ApiCoreTests", dependencies: [
                "Vapor",
                "ErrorsCore",
                "ApiCore",
                "MailCore",
                "VaporTestTools",
                "FluentTestTools",
                "ApiCoreTestTools",
                .product(name: "MailCoreTestTools", package: "MailCore")
            ]
        )
    ]
)
