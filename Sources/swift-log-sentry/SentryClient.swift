import Sentry

public struct SentryClient {
  public var addBreadcrumb: (_ crumb: Breadcrumb) -> Void

  public init(addBreadcrumb: @escaping (_ crumb: Breadcrumb) -> Void) {
    self.addBreadcrumb = addBreadcrumb
  }
}
