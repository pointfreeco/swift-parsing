public struct URLRequestData: Equatable {
  public var body: ArraySlice<UInt8>?
  public var headers: Fields
  public var host: String?
  public var method: String?
  public var password: String?
  public var path: ArraySlice<Substring>
  public var port: Int?
  public var query: Fields
  public var scheme: String?
  public var user: String?

  public init(
    method: String? = nil,
    scheme: String? = nil,
    user: String? = nil,
    password: String? = nil,
    host: String? = nil,
    port: Int? = nil,
    path: ArraySlice<Substring> = [],
    query: Fields = [:],
    headers: Fields = [:],
    body: ArraySlice<UInt8>? = nil
  ) {
    self.body = body
    self.headers = headers
    self.host = host
    self.method = method
    self.password = password
    self.path = path
    self.query = query
    self.scheme = scheme
    self.user = user
  }

  public struct Fields: Equatable {
    public var fields: [String: ArraySlice<Substring?>]

    public init(_ fields: [String: ArraySlice<Substring?>]) {
      self.fields = fields
    }
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
    self.headers.append(contentsOf: other.headers)
    self.method = self.method ?? other.method
    self.path.append(contentsOf: other.path)
    self.query.append(contentsOf: other.query)
  }
}

extension URLRequestData: Codable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.body = try container.decodeIfPresent([UInt8].self, forKey: .body)?[...]
    self.headers = try container.decodeIfPresent(Fields.self, forKey: .headers) ?? [:]
    self.host = try container.decodeIfPresent(String.self, forKey: .host)
    self.method = try container.decodeIfPresent(String.self, forKey: .method)
    self.password = try container.decodeIfPresent(String.self, forKey: .password)
    self.path = try container.decodeIfPresent([String].self, forKey: .path)?.map { $0[...] }[...]
      ?? []
    self.port = try container.decodeIfPresent(Int.self, forKey: .port)
    self.query = try container.decodeIfPresent(Fields.self, forKey: .query) ?? [:]
    self.scheme = try container.decodeIfPresent(String.self, forKey: .scheme)
    self.user = try container.decodeIfPresent(String.self, forKey: .user)
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(self.body.map(Array.init), forKey: .body)
    if !self.headers.isEmpty { try container.encode(self.headers, forKey: .headers) }
    try container.encodeIfPresent(self.host, forKey: .host)
    try container.encodeIfPresent(self.method, forKey: .method)
    try container.encodeIfPresent(self.password, forKey: .password)
    if !self.path.isEmpty { try container.encode(self.path.map(String.init), forKey: .path) }
    try container.encodeIfPresent(self.port, forKey: .port)
    if !self.query.isEmpty { try container.encode(self.query, forKey: .query) }
    try container.encodeIfPresent(self.scheme, forKey: .scheme)
    try container.encodeIfPresent(self.user, forKey: .user)
  }

  private enum CodingKeys: CodingKey {
    case body
    case headers
    case host
    case method
    case password
    case path
    case port
    case query
    case scheme
    case user
  }
}

extension URLRequestData: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(self.body)
    hasher.combine(self.method)
    hasher.combine(self.headers)
    hasher.combine(self.host)
    hasher.combine(self.password)
    hasher.combine(self.path)
    hasher.combine(self.port)
    hasher.combine(self.query)
    hasher.combine(self.scheme)
    hasher.combine(self.user)
  }
}

extension URLRequestData.Fields {
  public subscript(name: String) -> ArraySlice<Substring?>? {
    _read { yield self.fields[name] }
    _modify { yield &self.fields[name] }
  }

  public subscript(
    name: String, default defaultValue: @autoclosure () -> ArraySlice<Substring?>
  ) -> ArraySlice<Substring?> {
    _read { yield self.fields[name, default: defaultValue()] }
    _modify { yield &self.fields[name, default: defaultValue()] }
  }
}

extension URLRequestData.Fields: Appendable {
  public init() {
    self.init([:])
  }

  public mutating func append(contentsOf other: URLRequestData.Fields) {
    self.fields.merge(other.fields, uniquingKeysWith: +)
  }
}

extension URLRequestData.Fields: Codable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    self.init(try container.decode([String: [String?]].self).mapValues { $0.map { $0?[...] }[...] })
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(self.fields.mapValues { $0.map { $0.map(String.init) } })
  }
}

extension URLRequestData.Fields: Collection {
  public typealias Element = Dictionary<String, ArraySlice<Substring?>>.Element
  public typealias Index = Dictionary<String, ArraySlice<Substring?>>.Index

  public var startIndex: Index {
    self.fields.startIndex
  }

  public var endIndex: Index {
    self.fields.endIndex
  }

  public subscript(position: Index) -> Element {
    self.fields[position]
  }

  public func index(after i: Index) -> Index {
    self.fields.index(after: i)
  }
}

extension URLRequestData.Fields: ExpressibleByDictionaryLiteral {
  public init(dictionaryLiteral elements: (String, ArraySlice<Substring?>)...) {
    self.init(.init(uniqueKeysWithValues: elements))
  }
}

extension URLRequestData.Fields: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(self.fields)
  }
}
