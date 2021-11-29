/// A parser that waits for a call to its ``parse(_:)`` method before running the given closure to
/// create a parser for the given input.
public final class Lazy<LazyParser>: Parser where LazyParser: Parser {
  @usableFromInline
  var lazyParser: LazyParser?

  @inlinable
  var parser: LazyParser {
    guard let parser = self.lazyParser else {
      let parser = self.createParser()
      self.lazyParser = parser
      return parser
    }
    return parser
  }

  public let createParser: () -> LazyParser

  @inlinable
  public init(createParser: @escaping () -> LazyParser) {
    self.createParser = createParser
  }

  @inlinable
  public func parse(_ input: inout LazyParser.Input) -> LazyParser.Output? {
    self.parser.parse(&input)
  }
}

extension Lazy: Decodable where LazyParser: Decodable {
  public convenience init(from decoder: Decoder) throws {
    let lazyParser = try LazyParser(from: decoder)
    self.init { lazyParser }
  }
}

extension Lazy: Encodable where LazyParser: Encodable {
  public func encode(to encoder: Encoder) throws {
    try self.parser.encode(to: encoder)
  }
}

extension Lazy: Equatable where LazyParser: Equatable {
  public static func == (lhs: Lazy, rhs: Lazy) -> Bool {
    lhs.parser == rhs.parser
  }
}

extension Lazy: Hashable where LazyParser: Hashable {
  public func hash(into hasher: inout Hasher) {
    self.parser.hash(into: &hasher)
  }
}

extension Parsers {
  public typealias Lazy = Parsing.Lazy  // NB: Convenience type alias for discovery
}
