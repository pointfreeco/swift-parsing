/// Parses a request's method.
///
/// Used to require a particular method at a particular endpoint.
///
/// ```swift
/// Route(.case(SiteRoute.login)) {
///   Method.post  // Only route POST requests
///   ...
/// }
/// ```
public struct Method: ParserPrinter {
  @usableFromInline
  let name: String

  /// A parser of GET requests.
  ///
  /// Recognizes both HEAD and GET HTTP methods.
  ///
  /// > Note: If you are using a ``Route`` parser you do not need to specify `Method.get` (it is the
  /// > default).
  public static let get = OneOf {
    Self("HEAD")
    Self("GET")  // NB: Prefer printing "GET"
  }

  /// A parser of POST requests.
  public static let post = Self("POST")

  /// A parser of PUT requests.
  public static let put = Self("PUT")

  /// A parser of PATCH requests.
  public static let patch = Self("PATCH")

  /// A parser of DELETE requests.
  public static let delete = Self("DELETE")

  /// Initializes a request method parser with a method name.
  ///
  /// - Parameter name: A method name.
  @inlinable
  public init(_ name: String) {
    self.name = name.uppercased()
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) throws {
    guard let method = input.method else { throw RoutingError() }
    try self.name.parse(method)
    input.method = nil
  }

  @inlinable
  public func print(_ output: (), into input: inout URLRequestData) {
    input.method = self.name
  }
}
