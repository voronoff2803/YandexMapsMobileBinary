// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YandexMapsMobileBinary",
    products: [
        .library(
            name: "YandexMapsMobileBinary",
            type: .static,
            targets: ["YandexMapsMobileBinary"]),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "YandexMapsMobile",
            url: "https://github.com/evssar/YandexMapsMobileBinary/releases/download/4.1.0/YandexMapsMobile.xcframework.zip",
            checksum: "c68c29a3b1ad79b3908684df2134722eec71459e650efc8b5f0ea75ee7458484"
        ),
        .target(
            name: "YandexMapsMobileBinary",
            dependencies: [
                "YandexMapsMobile"
            ],
            resources: [
                .process("Resources/YandexMapsMobile.bundle"),
            ],
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreLocation"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("Security"),
                .linkedFramework("OpenGLES"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedFramework("CoreGraphics"),
                .linkedLibrary("resolv"),
                .linkedLibrary("c++"),
                .unsafeFlags(["-ObjC"])
            ]
        ),
        .testTarget(
            name: "YandexMapsMobileBinaryTests",
            dependencies: ["YandexMapsMobileBinary"]),
    ]
)
