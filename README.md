# SwiftLogSentry

[![Build & Test](https://github.com/ericlewis/swift-log-sentry/actions/workflows/ci.yml/badge.svg)](https://github.com/ericlewis/swift-log-sentry/actions/workflows/ci.yml)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fericlewis%2Fswift-log-sentry%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/ericlewis/swift-log-sentry)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fericlewis%2Fswift-log-sentry%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/ericlewis/swift-log-sentry)

A [Sentry](https://sentry.com) logging backend for [SwiftLog](https://github.com/apple/swift-log), 
it works by creating and adding a [Breadcrumb](https://docs.sentry.io/platforms/apple/guides/ios/enriching-events/breadcrumbs/) for log events.

## Features

- Supports [metadata](https://github.com/apple/swift-log#logging-metadata) by inserting the key value pairs in the data property on a Breadcrumb. 
- Log levels roughly map with minor differences.
- Supports line, file, and function reporting via the data property.
- 100% test coverage.

## Getting started

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

This library is released under the MIT license. See [LICENSE](LICENSE.md) for details.
