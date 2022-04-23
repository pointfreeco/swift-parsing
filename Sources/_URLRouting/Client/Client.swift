import Foundation
import Parsing
import XCTestDynamicOverlay

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

/// A type that can make requests to a server, download the response, and decode the response
/// into a model.
///
/// You do not typically construct this type directly from its initializer, and instead use the
/// ``live(router:session:)`` static method for creating an API client from a parser-printer, or
/// use the ``failing`` static variable for creating an API client that throws an error when a
/// request is made and then use ``override(_:with:)-6149z`` to override certain routes with mocked
/// responses.
///
/// ChildRoute
/// AuthenticatedRoute
///
public struct URLRoutingClient<Route, ChildRoute> {
  var request: (Route) async throws -> (Data, URLResponse)
  var toRoute: (ChildRoute) -> Route

  public init(
    request: @escaping (Route) async throws -> (Data, URLResponse),
    toRoute: @escaping (ChildRoute) -> Route
  ) {
    self.request = request
    self.toRoute = toRoute
  }

  /// Makes a request to a route.
  ///
  /// - Parameters:
  ///   - route: The route to request.
  ///   - type: The type of value to decode the response into.
  ///   - decoder: A JSON decoder.
  /// - Returns: The decoded value.
  @available(iOS 13, macOS 10.15, tvOS 13, watchOS 6, *)
  public func request<Value: Decodable>(
    _ route: ChildRoute,
    as type: Value.Type = Value.self,
    decoder: JSONDecoder = .init()
  ) async throws -> (value: Value, response: URLResponse) {
    let (data, response) = try await self.request(self.toRoute(route))
    do {
      return (try decoder.decode(type, from: data), response)
    } catch {
      throw URLRoutingDecodingError(bytes: data, response: response, underlyingError: error)
    }
  }
}

public struct URLRoutingDecodingError: Error {
  public let bytes: Data
  public let response: URLResponse
  public let underlyingError: Error
}

extension URLRoutingClient {
  /// Constructs a "live" API client that makes a request to a server using a `URLSession`.
  ///
  /// This client makes live requests by using the router to turn routes into URL requests,
  /// and then using `URLSession` to make the request.
  ///
  /// - Parameters:
  ///   - router: A router.
  ///   - session: A URL session.
  /// - Returns: A live API client that makes requests through a URL session.
  @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
  public static func live<R: ParserPrinter>(
    router: R,
    prepare: @escaping (ChildRoute) -> Route,
    session: URLSession = .shared
  ) -> Self
  where R.Input == URLRequestData, R.Output == Route {
    Self(
      request: { route in
        let request = try router.request(for: route)

#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
        if #available(macOS 12, iOS 15, tvOS 15, watchOS 8, *) {
          return try await session.data(for: request)
        }
#endif
        var dataTask: URLSessionDataTask?
        let cancel: () -> Void = { dataTask?.cancel() }

        return try await withTaskCancellationHandler(
          handler: { cancel() },
          operation: {
            try await withCheckedThrowingContinuation { continuation in
              dataTask = session.dataTask(with: request) { data, response, error in
                guard
                  let data = data,
                  let response = response
                else {
                  continuation.resume(throwing: error ?? URLError(.badServerResponse))
                  return
                }

                continuation.resume(returning: (data, response))
              }
              dataTask?.resume()
            }
          }
        )
      },
      toRoute: prepare
    )
  }
}

extension URLRoutingClient {
  /// An ``APIClient`` that immediately throws an error when a request is made.
  ///
  /// This client is useful when testing a feature that uses only a small subset of the available
  /// routes in the API client. You can creating a failing API client, and then
  /// ``override(_:with:)-2vsua`` certain routes that return mocked data.
  public static func failing(prepare: @escaping (ChildRoute) -> Route) -> Self {
    Self {
      let message = """
        Failed to respond to route: \(debugPrint($0))

        Use 'ApiClient.override' to supply a default response for this route.
        """
      XCTFail(message)
      throw UnimplementedEndpoint(message: message)
    } toRoute: { prepare($0) }
  }

  /// Constructs a new ``URLRoutingClient`` that returns a certain response for a specified route, and all
  /// other routes are passed through to the receiver.
  ///
  /// - Parameters:
  ///   - route: The route you want to override.
  ///   - response: The response to return for the route.
  /// - Returns: A new ``URLRoutingClient``.
  public func override(
    _ route: Route,
    with response: @escaping () throws -> Result<(data: Data, response: URLResponse), URLError>
  ) -> Self where Route: Equatable {
    self.override({ $0 == route }, with: response)
  }

  /// Constructs a new ``URLRoutingClient`` that returns a certain response for specific routes, and all
  /// other routes are passed through to the receiver.
  ///
  /// - Parameters:
  ///   - extract: A closure that determines which routes should be overridden.
  ///   - response: A closure that determines the response for when a route is overridden.
  /// - Returns: A new ``URLRoutingClient``.
  public func override<Value>(
    _ extract: @escaping (Route) -> Value?,
    with response: @escaping (Value) throws -> Result<(data: Data, response: URLResponse), URLError>
  ) -> Self {
    var copy = self
    copy.request = { [self] route in
      if let value = extract(route) {
        return try response(value).get()
      } else {
        return try await self.request(route)
      }
    }
    return copy
  }

  /// Constructs a new ``URLRoutingClient`` that returns a certain response for specific routes, and all
  /// other routes are passed through to the receiver.
  ///
  /// - Parameters:
  ///   - predicate: A closure that determines if a route matches.
  ///   - response: A closure that determines the response for when a route matches.
  /// - Returns: A new ``URLRoutingClient``.
  public func override(
    _ predicate: @escaping (Route) -> Bool,
    with response: @escaping () throws -> Result<(data: Data, response: URLResponse), URLError>
  ) -> Self {
    var copy = self
    copy.request = { [self] route in
      if predicate(route) {
        return try response().get()
      } else {
        return try await self.request(route)
      }
    }
    return copy
  }
}

extension Result where Success == (data: Data, response: URLResponse), Failure == URLError {
  /// Constructs a `Result` that represents a HTTP status 200 response.
  ///
  /// This method is most useful when used in conjection with ``URLRoutingClient/override(_:with:)-6149z``
  /// where you start with a ``URLRoutingClient/failing`` API client and then override certain routes to
  /// return mocked responses:
  ///
  /// ```swift
  /// let apiClient = URLRoutingClient<SiteRoute>.failing
  ///   .override(SiteRoute.search, with: { .ok(SearchResponse()) })
  /// ```
  ///
  /// - Parameters:
  ///   - value: The value to encode into data for the response.
  ///   - headerFields: Optional header fields to add to the response.
  ///   - encoder: The `JSONEncoder` to use to encode the value.
  /// - Returns: A result.
  public static func ok<T: Encodable>(
    _ value: T,
    headerFields: [String: String]? = nil,
    encoder: JSONEncoder = .init()
  ) throws -> Self {
    .success(
      (
        try encoder.encode(value),
        HTTPURLResponse(
          url: .init(string: "/")!,
          statusCode: 200,
          httpVersion: nil,
          headerFields: headerFields
        )!
      )
    )
  }
}

private struct UnimplementedEndpoint: LocalizedError {
  let message: String

  var errorDescription: String? {
    self.message
  }
}

private func debugPrint(_ value: Any) -> String {
  func debugTypeHelp(_ type: Any.Type) -> String {
    var name = String(reflecting: type)
    if let index = name.firstIndex(of: ".") {
      name.removeSubrange(...index)
    }
    return
      name
      .replacingOccurrences(
        of: #"<.+>|\(unknown context at \$[[:xdigit:]]+\)\."#,
        with: "",
        options: .regularExpression
      )
  }

  func debugTupleHelp(_ children: Mirror.Children) -> String {
    children.map { label, value in
      let childOutput = debugHelp(value)
      let label =
        label
        .map { $0.firstIndex(where: { $0 != "." && !$0.isNumber }) == nil ? "" : "\($0): " }
        ?? ""
      return "\(label)\(childOutput)"
    }
    .joined(separator: ", ")
  }

  func debugHelp(_ value: Any) -> String {
    let mirror = Mirror(reflecting: value)
    switch (value, mirror.displayStyle) {
    case (_, .enum):
      guard let child = mirror.children.first else {
        let childOutput = "\(value)"
        return childOutput == "\(type(of: value))" ? "" : ".\(childOutput)"
      }
      let childOutput = debugHelp(child.value)
      return ".\(child.label ?? "")\(childOutput.isEmpty ? "" : "(\(childOutput))")"
    case (_, .tuple):
      return debugTupleHelp(mirror.children)
    case (_, .struct):
      return "\(debugTypeHelp(mirror.subjectType))(\(debugTupleHelp(mirror.children)))"
    case let (value as CustomDebugStringConvertible, _):
      return value.debugDescription
    case let (value as CustomStringConvertible, _):
      return value.description
    default:
      return "_"
    }
  }

  return (value as? CustomDebugStringConvertible)?.debugDescription
    ?? "\(debugTypeHelp(type(of: value)))\(debugHelp(value))"
}
