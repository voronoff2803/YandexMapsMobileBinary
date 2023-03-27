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
            url: "https://maps-ios-pods-public.s3.yandex.net/YandexMapsMobile-4.3.1-full.framework.zip",
            checksum: "bc1a2fa1320a2e98103944020f6ff28c4114294c2d4963779d18c2de88527cb1"
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
