import Foundation
import Logging
import Sentry

public struct SentryLogHandler: LogHandler {
  private let label: String
  private let client: SentryClient

  public var metadata = Logger.Metadata()
  public var logLevel: Logger.Level = .info

  public init(label: String, client: SentryClient = .live) {
    self.label = label
    self.client = client
  }

  public func log(
    level: Logger.Level, message: Logger.Message, metadata: Logger.Metadata?, file: String,
    function: String, line: UInt
  ) {
    let crumb = Breadcrumb()

    crumb.category = label

    switch level {
    case .critical:
      crumb.level = .fatal
    case .debug:
      crumb.level = .debug
    case .info:
      crumb.level = .info
    case .notice:
      crumb.level = .warning
    case .warning:
      crumb.level = .warning
    case .trace:
      crumb.level = .debug
    case .error:
      crumb.level = .error
    }

    crumb.type = "log"
    crumb.message = message.description
    crumb.timestamp = Date()

    crumb.data = (metadata ?? self.metadata).reduce(into: [:]) { data, metadata in
      data[metadata.key] = metadata.value.description
    }

    crumb.data?["file"] = file
    crumb.data?["function"] = function
    crumb.data?["line"] = line

    client.addBreadcrumb(crumb)
  }

  public subscript(metadataKey key: String) -> Logger.Metadata.Value? {
    get { self.metadata[key] }
    set { self.metadata[key] = newValue }
  }
}
