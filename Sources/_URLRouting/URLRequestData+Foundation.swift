import Foundation

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension URLRequestData {
  public init?(request: URLRequest) {
    guard
      let url = request.url,
      let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
    else { return nil }

    self.init(
      method: request.httpMethod,
      path: url.path.split(separator: "/")[...],
      query: Fields(
        components.queryItems?.reduce(into: [:]) { query, item in
          query[item.name, default: []].append(item.value?[...])
        } ?? [:]
      ),
      headers: Fields(
        request.allHTTPHeaderFields?.mapValues {
          $0.split(separator: ",", omittingEmptySubsequences: false).map(Optional.some)[...]
        } ?? [:]
      ),
      body: request.httpBody.map { ArraySlice($0) }
    )
  }

  public init?(url: URL) {
    self.init(request: URLRequest(url: url))
  }

  public init?(string: String) {
    guard let url = URL(string: string)
    else { return nil }
    self.init(url: url)
  }
}

extension URLRequest {
  public init?(data: URLRequestData) {
    var urlComponents = URLComponents()
    urlComponents.scheme = data.scheme
    urlComponents.user = data.user
    urlComponents.password = data.password
    urlComponents.host = data.host.map(String.init)
    urlComponents.port = data.port
    urlComponents.path = "/\(data.path.joined(separator: "/"))"
    if !data.query.isEmpty {
      urlComponents.queryItems = data.query
        .sorted(by: { $0.key < $1.key })
        .flatMap { name, values in
          values.map { URLQueryItem(name: name, value: $0.map(String.init)) }
        }
    }
    guard let url = urlComponents.url else { return nil }
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
