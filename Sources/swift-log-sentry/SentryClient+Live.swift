import Sentry

extension SentryClient {
  public static let live = SentryClient { crumb in
    SentrySDK.addBreadcrumb(crumb)
  }
}
