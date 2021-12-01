public struct URLRequestData: Equatable { // TODO: Codable & Hashable
  public var body: ArraySlice<UInt8>?
  public var headers: Fields
  public var method: String?
  public var path: ArraySlice<Substring>
  public var query: Fields

  public init(
    method: String? = nil,
    path: ArraySlice<Substring> = [],
    query: Fields = [:],
    headers: Fields = [:],
    body: ArraySlice<UInt8>? = nil
  ) {
    self.method = method
    self.path = path
    self.query = query
    self.headers = headers
    self.body = body
  }

  public struct Fields: Equatable { // TODO: Codable & Hashable
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
