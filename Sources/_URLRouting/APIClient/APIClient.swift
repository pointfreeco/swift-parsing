import Foundation
import Parsing
import XCTestDynamicOverlay

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

public struct APIClient<Route> {
  var request: (Route) async throws -> (Data, URLResponse)

  public init(request: @escaping (Route) async throws -> (Data, URLResponse)) {
    self.request = request
  }

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

  public func override(
    _ route: Route,
    with response: @escaping () throws -> Result<(data: Data, response: URLResponse), URLError>
  ) -> Self where Route: Equatable {
    self.override({ $0 == route }, with: response)
  }

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
