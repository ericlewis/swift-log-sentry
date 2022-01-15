// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-log-sentry",
    platforms: [
      .iOS(.v9),
      .macOS(.v10_10),
      .tvOS(.v9),
      .watchOS(.v2)
    ],
    products: [
        .library(
            name: "SentryLogHandler",
            targets: ["swift-log-sentry"]),
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
      .package(url: "https://github.com/getsentry/sentry-cocoa.git", from: "7.0.0"),
    ],
    targets: [
        .target(
            name: "swift-log-sentry",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
                .product(name: "Sentry", package: "sentry-cocoa"),
            ]),
        .testTarget(
            name: "swift-log-sentryTests",
            dependencies: [
              "swift-log-sentry",
              .product(name: "Logging", package: "swift-log"),
              .product(name: "Sentry", package: "sentry-cocoa"),
            ]),
    ]
)
