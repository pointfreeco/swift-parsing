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
  @available(macOS 12, iOS 15, watchOS 8, tvOS 15, *)
  public static func live<R: ParserPrinter>(router: R, session: URLSession = .shared) -> Self
  where R.Input == URLRequestData, R.Output == Route {
    Self { route in
      try await session.data(for: router.request(for: route))
    }
  }
}

private struct UnimplementedEndpoint: LocalizedError {
  let message: String

  var errorDescription: String? {
    self.message
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
  public static func ok<T: Encodable>(_ value: T, encoder: JSONEncoder = .init()) throws -> Self {
    .success((try encoder.encode(value), .init()))
  }
}
