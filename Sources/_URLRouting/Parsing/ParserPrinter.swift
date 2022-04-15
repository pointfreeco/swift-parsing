import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension ParserPrinter where Input == URLRequestData {
  @inlinable
  public func request(for route: Output) -> URLRequest? {
    try? URLRequest(data: self.print(route))
  }

  @inlinable
  public func url(to route: Output) -> URL {
    do {
      return try URLComponents(data: self.print(route)).url ?? URL(string: "#route-not-found")!
    } catch {
      return URL(string: "#route-not-found")!
    }
  }

  @inlinable
  public func path(to route: Output) -> String {
    do {
      let data = try self.print(route)
      var components = URLComponents()
      components.path = "/\(data.path.joined(separator: "/"))"
      if !data.query.isEmpty {
        components.queryItems = data.query
          .sorted(by: { $0.key < $1.key })
          .flatMap { name, values in
            values.map { URLQueryItem(name: name, value: $0.map(String.init)) }
          }
      }
      return try URLComponents(data: self.print(route)).string ?? "#route-not-found"
    } catch {
      return "#route-not-found"
    }
  }
}
