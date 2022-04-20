import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension Parser where Input == URLRequestData {
  @inlinable
  public func match(request: URLRequest) throws -> Output {
    guard let data = URLRequestData(request: request)
    else { throw RoutingError() }
    return try self.parse(data)
  }

  @inlinable
  public func match(url: URL) throws -> Output {
    guard let data = URLRequestData(url: url)
    else { throw RoutingError() }
    return try self.parse(data)
  }

  @inlinable
  public func match(path: String) throws -> Output {
    guard let data = URLRequestData(string: path)
    else { throw RoutingError() }
    return try self.parse(data)
  }
}

extension ParserPrinter where Input == URLRequestData {
  @inlinable
  public func request(for route: Output) throws -> URLRequest {
    guard let request = try URLRequest(data: self.print(route))
    else { throw RoutingError() }
    return request
  }

  @inlinable
  public func url(for route: Output) -> URL {
    do {
      return try URLComponents(data: self.print(route)).url ?? URL(string: "#route-not-found")!
    } catch {
      breakpoint(
        """
        ---
        Could not generate a URL for route:

          \(route)

        The router has not been configured to parse this output and so it cannot print it back \
        into a URL. A '#route-not-found' fragment has been printed instead.

        \(error)
        ---
        """
      )
      return URL(string: "#route-not-found")!
    }
  }

  @inlinable
  public func path(for route: Output) -> String {
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
      return try components.string ?? "#route-not-found"
    } catch {
      breakpoint(
        """
        ---
        Could not generate a URL for route:

          \(route)

        The router has not been configured to parse this output and so it cannot print it back \
        into a URL. A '#route-not-found' fragment has been printed instead.

        \(error)
        ---
        """
      )
      return "#route-not-found"
    }
  }
}
