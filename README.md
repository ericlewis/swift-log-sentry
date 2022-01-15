# SwiftLogSentry

[![Build & Test](https://github.com/ericlewis/swift-log-sentry/actions/workflows/ci.yml/badge.svg)](https://github.com/ericlewis/swift-log-sentry/actions/workflows/ci.yml)

A [Sentry](https://sentry.com) logging backend for [SwiftLog](https://github.com/apple/swift-log).

## Getting started

Supports iOS 9+, macOS 10.10+, tvOS 9+, watchOS 2+. 
Before using the logger you need to initialize the Sentry SDK.

#### Adding the dependency

`SwiftLogSentry` is designed for Swift 5. To use the handler, you need to declare your dependency in your `Package.swift`:

```swift
.package(url: "https://github.com/ericlewis/swift-log-sentry.git", from: "0.1.0"),
```

and to your application/library target, add `"SentryLogHandler"` to your `dependencies`, e.g. like this:

```swift
// Target syntax for Swift up to version 5.1
.target(name: "BestExampleApp", dependencies: ["SentryLogHandler"]),

// Target for Swift 5.2
.target(name: "BestExampleApp", dependencies: [
    .product(name: "SentryLogHandler", package: "swift-log-sentry")
],
```

## License

This library is released under the MIT license. See [LICENSE](LICENSE) for details.
