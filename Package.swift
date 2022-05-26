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
            checksum: "b6593b4f27ab358da3f3d5d3354d8ab2f27171db2e62afcb27302ede6473a251"
        ),
        .target(
            name: "YandexMapsMobileBinary",
            dependencies: [
                "YandexMapsMobile"
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
