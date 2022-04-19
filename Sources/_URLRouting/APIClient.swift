import CasePaths
import Foundation
import Parsing

public struct APIClient<Route> {
  var request: (Route) async throws -> (Data, URLResponse)

  public init(request: @escaping (Route) async throws -> (Data, URLResponse)) {
    self.request = request
  }

  public func request<D: Decodable>(
    _ route: Route,
    as type: D.Type = D.self,
    decoder: JSONDecoder = .init()
  ) async throws -> D
  {
    let (data, _) = try await self.request(route)
    return try JSONDecoder().decode(type, from: data)
  }
}

extension APIClient {
  @available(macOS 12.0, *)
  public static func live<R: ParserPrinter>(
    router: R
  ) -> Self
  where R.Input == URLRequestData, R.Output == Route
  {
    Self { route in
      try await URLSession.shared.data(for: router.request(for: route))
    }
  }
}

struct Failure: Error {}
extension APIClient {
  public static var failing: Self {
    Self(
      request: { _ in
        throw Failure()
      }
    )
  }

  public mutating func override(
    route matchingRoute: Route,
    withResponse response: Result<(data: Data, response: URLResponse), URLError>
  )
  where Route: Equatable
  {
    //    let fulfill = expectation(description: "route")
    self.request = { [self] route in
      if route == matchingRoute {
        //        fulfill()
        return try response.get()
      } else {
        return try await self.request(route)
      }
    }
  }

  public mutating func override<Value>(
    routeCase matchingRoute: CasePath<Route, Value>,
    withResponse response: @escaping (Value) -> Result<
    (data: Data, response: URLResponse), URLError
    >
  ) {
    //    let fulfill = expectation(description: "route")
    self.request = { [self] route in
      if let value = matchingRoute.extract(from: route) {
        //        fulfill()
        return try response(value).get()
      } else {
        return try await self.request(route)
      }
    }
  }
}
