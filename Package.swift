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
            url: "https://github.com/c-villain/YandexMapsMobile/releases/download/4.2.2/YandexMapsMobile.xcframework.zip",
            checksum: "5f2bd884971ee00130f9096d27c8f3edc8e58ec7965761314ffeaf3156defc95"
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
