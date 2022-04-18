import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension URLRequestData {
  /// Initializes parseable request data from a `URLRequest`.
  ///
  /// Useful for converting a `URLRequest` from the Foundation framework into parseable
  /// ``URLRequestData``.
  ///
  /// ```swift
  /// guard let requestData = URLRequestData(request: urlRequest)
  /// else { return }
  ///
  /// let route = try router.parse(requestData)
  /// ```
  ///
  /// - Parameter request: A URL request.
  public init?(request: URLRequest) {
    guard
      let url = request.url,
      let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
    else { return nil }

    self.init(
      method: request.httpMethod,
      scheme: components.scheme,
      user: components.user,
      password: components.password,
      host: components.host,
      port: components.port,
      path: components.path,
      query: components.queryItems?.reduce(into: [:]) { query, item in
        query[item.name, default: []].append(item.value)
      } ?? [:],
      headers: request.allHTTPHeaderFields?.mapValues {
        $0.split(separator: ",", omittingEmptySubsequences: false).map { String($0) }
      } ?? [:],
      body: request.httpBody.map([UInt8].init)
    )
  }

  /// Initializes a parseable URL request from a `URL`.
  public init?(url: URL) {
    self.init(request: URLRequest(url: url))
  }

  /// Initializes a parseable URL request from a URL string.
  public init?(string: String) {
    guard let url = URL(string: string)
    else { return nil }
    self.init(url: url)
  }
}

extension URLComponents {
  /// Initializes `URLComponents` from parseable/printable request data.
  ///
  /// Useful for converting ``URLRequestData`` into a `URL`.
  ///
  /// ```swift
  /// let requestData = try router.print(route)
  /// guard let urlRequest = URLRequest(data: requestData)
  /// else { return }
  /// ```
  ///
  /// - Parameter data: URL request data.
  public init(data: URLRequestData) {
    self.init()
    self.scheme = data.scheme
    self.user = data.user
    self.password = data.password
    self.host = data.host
    self.port = data.port
    self.path = "/\(data.path.joined(separator: "/"))"
    if !data.query.isEmpty {
      self.queryItems = data.query
        .sorted(by: { $0.key < $1.key })
        .flatMap { name, values in
          values.map { URLQueryItem(name: name, value: $0.map(String.init)) }
        }
    }
  }
}

extension URLRequest {
  /// Initializes a `URLRequest` from parseable/printable request data.
  ///
  /// Useful for converting ``URLRequestData`` back into a `URLRequest`.
  ///
  /// ```swift
  /// let requestData = try router.print(route)
  /// guard let urlRequest = URLRequest(data: requestData)
  /// else { return }
  /// ```
  ///
  /// - Parameter data: URL request data.
  public init?(data: URLRequestData) {
    guard let url = URLComponents(data: data).url else { return nil }
    self.init(url: url)
    self.httpMethod = data.method
    for (name, values) in data.headers.sorted(by: { $0.key < $1.key }) {
      for value in values {
        if let value = value {
          self.addValue(String(value), forHTTPHeaderField: name)
        }
      }
    }
    self.httpBody = data.body.map { Data($0) }
  }
}
