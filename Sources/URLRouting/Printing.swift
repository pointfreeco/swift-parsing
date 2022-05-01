import Foundation
import Parsing

extension ParserPrinter where Input == URLRequestData {
  /// Prepends a router with a base URL for the purpose of printing.
  ///
  /// Useful for printing absolute URLs to a specific scheme, domain, and path prefix.
  ///
  /// ```swift
  /// let apiRouter = router.baseURL("https://api.pointfree.co/v1")
  ///
  /// try apiRouter.print(.episodes(.episode(1, .index))
  /// // https://api.pointfree.co/v1/episodes/1
  /// ```
  ///
  /// - Parameter urlString: A base URL string.
  /// - Returns: A parser-printer that prepends a base URL to whatever this parser-printer prints.
  @inlinable
  public func baseURL(_ urlString: String) -> BaseURLPrinter<Self> {
    guard let defaultRequestData = URLRequestData(string: urlString)
    else { fatalError("Invalid base URL: \(urlString.debugDescription)") }
    return BaseURLPrinter(defaultRequestData: defaultRequestData, upstream: self)
  }

  /// Prepends a router with default request data for the purpose of printing.
  ///
  /// ```swift
  /// let authenticatedRouter = router
  ///   .baseRequestData(.init(headers: ["X-PointFree-Session": ["deadbeef"]]))
  /// ```
  ///
  /// - Parameter requestData: Default request data to print into.
  /// - Returns: A parser-printer that prints into some default request data.
  @inlinable
  public func baseRequestData(_ requestData: URLRequestData) -> BaseURLPrinter<Self> {
    BaseURLPrinter(defaultRequestData: requestData, upstream: self)
  }
}

public struct BaseURLPrinter<Upstream: ParserPrinter>: ParserPrinter
where Upstream.Input == URLRequestData {
  @usableFromInline
  let defaultRequestData: URLRequestData

  @usableFromInline
  let upstream: Upstream

  @usableFromInline
  init(defaultRequestData: URLRequestData, upstream: Upstream) {
    self.defaultRequestData = defaultRequestData
    self.upstream = upstream
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) rethrows -> Upstream.Output {
    try self.upstream.parse(&input)
  }

  @inlinable
  public func print(_ output: Upstream.Output, into input: inout URLRequestData) rethrows {
    try self.upstream.print(output, into: &input)
    if let scheme = self.defaultRequestData.scheme { input.scheme = scheme }
    if let user = self.defaultRequestData.user { input.user = user }
    if let password = self.defaultRequestData.password { input.password = password }
    if let host = self.defaultRequestData.host { input.host = host }
    if let port = self.defaultRequestData.port { input.port = port }
    input.path.prepend(contentsOf: self.defaultRequestData.path)
    input.query.fields.merge(self.defaultRequestData.query.fields) { $1 + $0 }
    input.headers.fields.merge(self.defaultRequestData.headers.fields) { $1 + $0 }
  }
}
