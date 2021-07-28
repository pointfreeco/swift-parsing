import Foundation
import Parsing

public struct Request: Appendable, Equatable, Hashable {
  public var method: String? = nil
  public var path: [Substring] = []
  public var query: [QueryItem] = []
  public var headers: [Header] = []
  public var body: Data = Data() // FIXME: Should this be `[UInt8]`?

  public init(
    method: String? = nil,
    path: [Substring] = [],
    query: [QueryItem] = [],
    headers: [Header] = [],
    body: Data = Data()
  ) {
    self.method = method
    self.path = path
    self.query = query
    self.headers = headers
    self.body = body
  }

  public init() {}

  public mutating func append(contentsOf other: Request) {
    self.method = self.method ?? other.method
    self.path = self.path + other.path
    self.query = self.query + other.query
    self.headers = self.headers + other.headers
    self.body = self.body + other.body
  }

  public struct QueryItem: Equatable, Hashable {
    public var name: String
    public var value: String

    public init(
      name: String,
      value: String
    ) {
      self.name = name
      self.value = value
    }
  }

  public struct Header: Equatable, Hashable {
    public var name: String
    public var value: String

    public init(
      name: String,
      value: String
    ) {
      self.name = name
      self.value = value
    }
  }
}

public struct Method: Parser {
  public static let get = OneOfMany(Self("GET"), Self("HEAD"))
  public static let post = Self("POST")
  public static let put = Self("PUT")
  public static let patch = Self("PATCH")
  public static let delete = Self("DELETE")

  public let name: String

  public init(_ name: String) {
    self.name = name
  }

  public func parse(_ input: inout Request) -> Void? {
    guard (input.method ?? "GET").caseInsensitiveCompare(self.name) == .orderedSame
    else { return nil }
    input.method = nil
    return ()
  }
}

extension Method: Printer {
  public func print(_ output: ()) -> Request? {
    Request(method: self.name)
  }
}

public struct PathComponent<ComponentParser>: Parser
where
  ComponentParser: Parser, ComponentParser.Input == Substring
{
  public let componentParser: ComponentParser

  public init(_ componentParser: ComponentParser) {
    self.componentParser = componentParser
  }

  public init(_ literal: String) where ComponentParser == StartsWith<Substring> {
    self.init(StartsWith(literal))
  }

  public func parse(_ input: inout Request) -> ComponentParser.Output? {
    guard
      var component = input.path.first,
      let output = self.componentParser.parse(&component),
      component.isEmpty
    else { return nil }
    input.path.removeFirst()
    return output
  }
}

extension PathComponent: Printer where ComponentParser: Printer {
  public func print(_ output: ComponentParser.Output) -> Request? {
    guard let component = self.componentParser.print(output)
    else { return nil }
    return Request(path: component.isEmpty ? [] : [component])
  }
}

public struct PathEnd: Parser {
  public init() {}

  public func parse(_ input: inout Request) -> Void? {
    input.path.isEmpty ? () : nil
  }
}

extension PathEnd: Printer {
  public func print(_ output: Void) -> Request? {
    .init(path: [])
  }
}

public struct QueryItem<ValueParser>: Parser // TODO: Add `NameParser`?
where
  ValueParser: Parser, ValueParser.Input == Substring
{
  public let name: String
  public let valueParser: ValueParser

  public init(_ name: String, _ valueParser: ValueParser) {
    self.name = name
    self.valueParser = valueParser
  }

  public init(_ name: String)
  where
    ValueParser == Parsers.MapViaParser<Rest<Substring>, Conversion<Substring, String>>
  {
    self.init(name, Rest().map(String.fromSubstring))
  }

  public func parse(_ input: inout Request) -> ValueParser.Output? {
    guard
      let index = input.query.firstIndex(where: { $0.name == self.name })
    else { return nil }
    var value = input.query[index].value[...]
    guard
      let output = self.valueParser.parse(&value),
      value.isEmpty
    else { return nil }
    input.query.remove(at: index)
    return output
  }
}

extension QueryItem: Printer where ValueParser: Printer {
  public func print(_ output: ValueParser.Output) -> Request? {
    guard let input = self.valueParser.print(output)
    else { return nil }
    return Request(query: [.init(name: self.name, value: String(input))])
  }
}

public struct HeaderField<ValueParser>: Parser // TODO: Add `NameParser`?
where
  ValueParser: Parser, ValueParser.Input == Substring
{
  public let name: String
  public let valueParser: ValueParser

  public init(_ name: String, _ valueParser: ValueParser) {
    self.name = name
    self.valueParser = valueParser
  }

  public func parse(_ input: inout Request) -> ValueParser.Output? {
    guard
      let index = input.headers
        .firstIndex(where: { $0.name.caseInsensitiveCompare(self.name) == .orderedSame })
    else { return nil }
    var value = input.headers[index].value[...]
    guard
      let output = self.valueParser.parse(&value),
      value.isEmpty
    else { return nil }
    input.headers.remove(at: index)
    return output
  }
}

extension HeaderField: Printer where ValueParser: Printer {
  public func print(_ output: ValueParser.Output) -> Request? {
    guard let input = self.valueParser.print(output)
    else { return nil }
    return Request(headers: [.init(name: self.name, value: String(input))])
  }
}

public struct Body<BodyParser>: Parser
where
  BodyParser: Parser,
  // FIXME: Should this be `: Collection where Self == SubSequence, .Element == UInt8`?
  BodyParser.Input == Data
{
  public let bodyParser: BodyParser

  public init(_ bodyParser: BodyParser) {
    self.bodyParser = bodyParser
  }

  public func parse(_ input: inout Request) -> BodyParser.Output? {
    guard let output = self.bodyParser.parse(&input.body)
    else { return nil }
    input.body = Data()
    return output
  }
}

extension Body: Printer where BodyParser: Printer {
  public func print(_ output: BodyParser.Output) -> Request? {
    guard let input = self.bodyParser.print(output)
    else { return nil }
    return Request(body: input)
  }
}

// ...

extension URLRequest {
  public init?(_ request: Request) {
    var urlComponents = URLComponents()
    urlComponents.path = request.path.joined(separator: "/")
    if !request.query.isEmpty {
      urlComponents.queryItems = request.query.map { URLQueryItem(name: $0.name, value: $0.value) }
    }
    guard let url = urlComponents.url else { return nil }
    self.init(url: url)
    self.httpMethod = request.method
    for header in request.headers {
      self.addValue(header.value, forHTTPHeaderField: header.name)
    }
    self.httpBody = request.body
  }
}

extension Request {
  public init(_ request: URLRequest) {
    let urlComponents = request.url
      .flatMap { URLComponents(url: $0, resolvingAgainstBaseURL: false) }
    self.init(
      method: request.httpMethod,
      path: urlComponents?.path.split(separator: "/") ?? [],
      query: urlComponents?.queryItems?.map { .init(name: $0.name, value: $0.value ?? "") } ?? [],
      headers: request.allHTTPHeaderFields?.map { .init(name: $0, value: $1) } ?? [],
      body: request.httpBody ?? .init()
    )
  }
}

// ...

struct User: Codable {
  let email: String
  let password: String
}

enum Route {
  case home
  case episodes(limit: Int?, offset: Int?)
  case episode(Int)
  case search(String)
  case signUp(User)
}

let home = Method.get
  .skip(PathEnd())
  .map(/Route.home)

let episodes = Method.get
  .skip(PathComponent("episodes"))
  .skip(PathEnd())
  .take(Optional.parser(of: QueryItem("limit", Int.parser(isSigned: false))))
  .take(Optional.parser(of: QueryItem("offset", Int.parser(isSigned: false))))
  .map(/Route.episodes)

let episode = Method.get
  .skip(PathComponent("episodes"))
  .take(PathComponent(Int.parser(isSigned: false)))
  .skip(PathEnd())
  .map(/Route.episode)

let search = Method.get
  .skip(PathComponent("search"))
  .skip(PathEnd())
  .take(QueryItem("q"))
  .map(/Route.search)

let signUp = Method.post
  .skip(PathComponent("sign-up"))
  .skip(PathEnd())
  .take(Body(User.fromJSON))
  .map(/Route.signUp)

let router = home
  .orElse(episodes)
  .orElse(episode)
  .orElse(search)
  .orElse(signUp)

router.parse(Request(URLRequest(url: URL(string: "/?ga=1")!)))
router.parse(Request(URLRequest(url: URL(string: "/episodes/1?ga=1")!)))
router.parse(Request(URLRequest(url: URL(string: "/episodes?limit=10")!)))
router.parse(Request(URLRequest(url: URL(string: "/episodes")!)))
router.parse(Request(URLRequest(url: URL(string: "/search?ga=1")!)))
router.parse(Request(URLRequest(url: URL(string: "/search?q=point%20free&ga=1")!)))
router.parse(Request(URLRequest(url: URL(string: "/search")!)))
router.parse(Request(URLRequest(url: URL(string: "/search?q=")!)))

var req = URLRequest(url: URL(string: "/sign-up")!)
req.httpMethod = "post"
req.httpBody = Data(#"{"email":"support@pointfree.co","password":"blob8108"}"#.utf8)
router.parse(.init(req))

URLRequest(router.print(.search("blob"))!)!
URLRequest(router.print(.search(""))!)!
URLRequest(router.print(.episode(42))!)!
URLRequest(router.print(.episodes(limit: 10, offset: 10))!)!
URLRequest(router.print(.episodes(limit: 10, offset: nil))!)!
URLRequest(router.print(.episodes(limit: nil, offset: nil))!)!
String(
  decoding: URLRequest(router.print(.signUp(User(email: "blob@pf.co", password: "1234")))!)!.httpBody!,
  as: UTF8.self
)

Many(QueryItem("xs", Int.parser()))
  .parse(Request(URLRequest(url: URL(string: "?xs=1&xs=2&xs=3")!)))

Many(QueryItem("xs[]", Int.parser()))
  .parse(Request(URLRequest(url: URL(string: "?xs[]=1&xs[]=2&xs[]=3")!)))
