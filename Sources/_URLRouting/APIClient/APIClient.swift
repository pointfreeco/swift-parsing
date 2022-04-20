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
public struct APIClient<Route> {
  var request: (Route) async throws -> (Data, URLResponse)

  public init(request: @escaping (Route) async throws -> (Data, URLResponse)) {
    self.request = request
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
    _ route: Route,
    as type: Value.Type = Value.self,
    decoder: JSONDecoder = .init()
  ) async throws -> Value {
    let (data, _) = try await self.request(route)
    return try JSONDecoder().decode(type, from: data)
  }
}

extension APIClient {
  /// Constructs a "live" API client that makes a request to a server using a `URLSession`.
  ///
  /// This client makes live requests by using the router to turn routes into URL requests,
  /// and then using `URLSession` to make the request.
  ///
  /// - Parameters:
  ///   - router: <#router description#>
  ///   - session: <#session description#>
  /// - Returns: <#description#>
  @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
  public static func live<R: ParserPrinter>(router: R, session: URLSession = .shared) -> Self
  where R.Input == URLRequestData, R.Output == Route {
    Self { route in
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
    }
  }
}

extension APIClient {
  /// An ``APIClient`` that immediately throws an error when a request is made.
  ///
  /// This client is useful when testing a feature that uses only a small subset of the available
  /// routes in the API client. You can creating a failing API client, and then
  /// ``override(_:with:)-2vsua`` certain routes that return mocked data.
  public static var failing: Self {
    Self {
      let message = """
        Failed to respond to route: \($0)

        Use 'ApiClient.override' to supply a default response for this route.
        """
      XCTFail(message)
      throw UnimplementedEndpoint(message: message)
    }
  }

  /// Constructs a new ``APIClient`` that returns a certain response for a specified route, and all
  /// other routes are passed through to the receiver.
  ///
  /// - Parameters:
  ///   - route: The route you want to override.
  ///   - response: The response to return for the route.
  /// - Returns: A new ``APIClient``.
  public func override(
    _ route: Route,
    with response: @escaping () throws -> Result<(data: Data, response: URLResponse), URLError>
  ) -> Self where Route: Equatable {
    self.override({ $0 == route }, with: response)
  }

  /// Constructs a new ``APIClient`` that returns a certain response for specific routes, and all
  /// other routes are passed through to the receiver.
  ///
  /// - Parameters:
  ///   - extract: A closure that determines which routes should be overridden.
  ///   - response: A closure that determines the response for when a route is overridden.
  /// - Returns: A new ``APIClient``.
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

  /// <#Description#>
  /// - Parameters:
  ///   - predicate: <#predicate description#>
  ///   - response: <#response description#>
  /// - Returns: A new ``APIClient``.
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
  /// This method is most useful when used in conjection with ``APIClient/override(_:with:)-6149z``
  /// where you start with a ``APIClient/failing`` API client and then override certain routes to
  /// return mocked responses:
  ///
  /// ```swift
  /// let apiClient = APIClient<SiteRoute>.failing
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
