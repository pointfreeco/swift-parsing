public struct URLRequestData: Equatable {
  public var body: ArraySlice<UInt8>?
  public var headers: [String: ArraySlice<Substring?>]
  public var method: String?
  public var path: ArraySlice<Substring>
  public var query: [String: ArraySlice<Substring?>]

  public init(
    method: String? = nil,
    path: ArraySlice<Substring> = [],
    query: [String: ArraySlice<Substring?>] = [:],
    headers: [String: ArraySlice<Substring?>] = [:],
    body: ArraySlice<UInt8>? = nil
  ) {
    self.method = method
    self.path = path
    self.query = query
    self.headers = headers
    self.body = body
  }
}

extension URLRequestData: Appendable {
  public init() {
    self.init(method: nil, path: [], query: [:], headers: [:], body: nil)
  }

  public mutating func append(contentsOf other: URLRequestData) {
    if let body = other.body {
      if self.body != nil {
        self.body?.append(contentsOf: other.body ?? [])
      } else {
        self.body = body
      }
    }
    self.headers.merge(other.headers, uniquingKeysWith: { lhs, rhs in lhs })
    self.method = self.method ?? other.method
    self.path.append(contentsOf: other.path)
    self.query.merge(other.query, uniquingKeysWith: +)
  }
}
