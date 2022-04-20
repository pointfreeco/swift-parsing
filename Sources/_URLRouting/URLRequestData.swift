import Foundation

/// A parseable URL request.
///
/// Models a URL request in manner that can be incrementally parsed in an efficient way, by storing
/// its various fields as subsequences for parsers to consume.
public struct URLRequestData: Equatable, _EmptyInitializable {
  /// The request body.
  public var body: Data?

  /// The request headers.
  ///
  /// Modeled as ``Fields`` for efficient incremental parsing.
  ///
  /// To incrementally parse from these fields, use the ``Headers`` parser.
  public var headers: Fields = .init([:], isNameCaseSensitive: false)

  /// The host subcomponent of the request URL
  public var host: String?

  /// An HTTP method, _e.g._ `"GET"` or `"POST"`.
  ///
  /// To parse, use the ``Method`` parser.
  public var method: String?

  /// The password subcomponent of the request URL.
  public var password: String?

  /// An array of the request URL's path components.
  ///
  /// Modeled as an `ArraySlice` of `Substring`s for efficient incremental parsing.
  public var path: ArraySlice<Substring> = []

  /// The port subcomponent of the request URL.
  public var port: Int?

  /// The query subcomponent of the request URL.
  ///
  /// Modeled as ``Fields`` for efficient incremental parsing.
  ///
  /// To incrementally parse from these fields, use the ``Headers`` parser.
  public var query: Fields = .init([:], isNameCaseSensitive: true)

  /// The scheme, _e.g._ `"https"` or `"http"`.
  public var scheme: String?

  /// The user subcomponent of the request URL.
  public var user: String?

  /// Initializes an empty URL request.
  public init() {}

  /// Initializes a URL request.
  ///
  /// - Parameters:
  ///   - method: The HTTP method, _e.g._ `"GET"` or `"POST"`.
  ///   - scheme: The scheme, _e.g._ `"https"` or `"http"`.
  ///   - user: The user subcomponent of the request URL.
  ///   - password: The password subcomponent of the request URL.
  ///   - host: The host subcomponent of the request URL.
  ///   - port: The port subcomponent of the request URL.
  ///   - path: An array of the request URL's path components.
  ///   - query: The query subcomponent of the request URL.
  ///   - headers: The request headers.
  ///   - body: The request body.
  @inlinable
  public init(
    method: String? = nil,
    scheme: String? = nil,
    user: String? = nil,
    password: String? = nil,
    host: String? = nil,
    port: Int? = nil,
    path: String = "",
    query: [String: [String?]] = [:],
    headers: [String: [String?]] = [:],
    body: Data? = nil
  ) {
    self.body = body
    self.headers = .init(headers.mapValues { $0.map { $0?[...] }[...] }, isNameCaseSensitive: false)
    self.host = host
    self.method = method
    self.password = password
    self.path = path.split(separator: "/")[...]
    self.port = port
    self.query = .init(query.mapValues { $0.map { $0?[...] }[...] }, isNameCaseSensitive: true)
    self.scheme = scheme
    self.user = user
  }

  /// A wrapper around a dictionary of strings to array slices of substrings.
  ///
  /// Used by ``URLRequestData`` to model query parameters and headers in a way that can be
  /// efficiently parsed.
  public struct Fields {
    public var fields: [String: ArraySlice<Substring?>]

    @usableFromInline var isNameCaseSensitive: Bool

    @inlinable
    public init(
      _ fields: [String: ArraySlice<Substring?>] = [:],
      isNameCaseSensitive: Bool
    ) {
      self.fields = [:]
      self.fields.reserveCapacity(fields.count)
      self.isNameCaseSensitive = isNameCaseSensitive
      for (key, value) in fields {
        self[key] = value
      }
    }

    @inlinable
    public subscript(name: String) -> ArraySlice<Substring?>? {
      _read { yield self.fields[self.isNameCaseSensitive ? name : name.lowercased()] }
      _modify { yield &self.fields[self.isNameCaseSensitive ? name : name.lowercased()] }
    }

    @inlinable
    public subscript(
      name: String, default defaultValue: @autoclosure () -> ArraySlice<Substring?>
    ) -> ArraySlice<Substring?> {
      _read {
        yield self.fields[
          self.isNameCaseSensitive ? name : name.lowercased(), default: defaultValue()
        ]
      }
      _modify {
        yield &self.fields[
          self.isNameCaseSensitive ? name : name.lowercased(), default: defaultValue()
        ]
      }
    }
  }
}

extension URLRequestData: Codable {
  @inlinable
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.init(
      method: try container.decodeIfPresent(String.self, forKey: .method),
      scheme: try container.decodeIfPresent(String.self, forKey: .scheme),
      user: try container.decodeIfPresent(String.self, forKey: .user),
      password: try container.decodeIfPresent(String.self, forKey: .password),
      host: try container.decodeIfPresent(String.self, forKey: .host),
      port: try container.decodeIfPresent(Int.self, forKey: .port),
      path: try container.decodeIfPresent(String.self, forKey: .path) ?? "",
      query: try container.decodeIfPresent([String: [String?]].self, forKey: .query) ?? [:],
      headers: try container.decodeIfPresent([String: [String?]].self, forKey: .headers) ?? [:],
      body: try container.decodeIfPresent(Data.self, forKey: .body)
    )
  }

  @inlinable
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(self.body.map(Array.init), forKey: .body)
    if !self.headers.isEmpty {
      try container.encode(
        self.headers.fields.mapValues { $0.map { $0.map(String.init) } },
        forKey: .headers
      )
    }
    try container.encodeIfPresent(self.host, forKey: .host)
    try container.encodeIfPresent(self.method, forKey: .method)
    try container.encodeIfPresent(self.password, forKey: .password)
    if !self.path.isEmpty { try container.encode(self.path.joined(separator: "/"), forKey: .path) }
    try container.encodeIfPresent(self.port, forKey: .port)
    if !self.query.isEmpty {
      try container.encode(
        self.query.fields.mapValues { $0.map { $0.map(String.init) } },
        forKey: .query
      )
    }
    try container.encodeIfPresent(self.scheme, forKey: .scheme)
    try container.encodeIfPresent(self.user, forKey: .user)
  }

  @usableFromInline
  enum CodingKeys: CodingKey {
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
  @inlinable
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

extension URLRequestData.Fields: Collection {
  public typealias Element = Dictionary<String, ArraySlice<Substring?>>.Element
  public typealias Index = Dictionary<String, ArraySlice<Substring?>>.Index

  @inlinable
  public var startIndex: Index {
    self.fields.startIndex
  }

  @inlinable
  public var endIndex: Index {
    self.fields.endIndex
  }

  @inlinable
  public subscript(position: Index) -> Element {
    self.fields[position]
  }

  @inlinable
  public func index(after i: Index) -> Index {
    self.fields.index(after: i)
  }
}

extension URLRequestData.Fields: ExpressibleByDictionaryLiteral {
  @inlinable
  public init(dictionaryLiteral elements: (String, ArraySlice<Substring?>)...) {
    self.init(.init(elements) { $0 + $1 }, isNameCaseSensitive: true)
  }
}

extension URLRequestData.Fields: Equatable {
  @inlinable
  public static func == (lhs: Self, rhs: Self) -> Bool {
    guard lhs.count == rhs.count else { return false }
    for key in lhs.fields.keys {
      guard lhs[key] == rhs[key] else { return false }
    }
    return true
  }
}

extension URLRequestData.Fields: Hashable {
  @inlinable
  public func hash(into hasher: inout Hasher) {
    hasher.combine(self.fields)
  }
}
