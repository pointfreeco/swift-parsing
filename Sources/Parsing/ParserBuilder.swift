@resultBuilder
public enum ParserBuilder {
  @inlinable
  static public func buildBlock<P>(_ parser: P) -> P where P: Parser {
    parser
  }

  @inlinable
  public static func buildEither<P>(first parser: P) -> P where P: Parser {
    parser
  }

  @inlinable
  public static func buildEither<P>(second parser: P) -> P where P: Parser {
    parser
  }

  @inlinable
  public static func buildLimitedAvailability<P>(_ component: P) -> Parsers.OptionalParser<P>
  where P: Parser {
    .init(component)
  }
}

public struct Parse<Upstream>: Parser where Upstream: Parser {
  public let upstream: Upstream

  @inlinable
  public init(@ParserBuilder _ build: () -> Upstream) {
    self.upstream = build()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
    self.upstream.parse(&input)
  }
}

@resultBuilder
public enum OneOfBuilder {
  @inlinable
  public static func buildArray<P>(_ parsers: [P]) -> OneOfMany<P> where P: Parser {
    OneOfMany(parsers)
  }

  @inlinable
  static public func buildBlock<P>(_ parser: P) -> P where P: Parser {
    parser
  }

  @inlinable
  public static func buildEither<P>(first parser: P) -> P where P: Parser {
    parser
  }

  @inlinable
  public static func buildEither<P>(second parser: P) -> P where P: Parser {
    parser
  }

  @inlinable
  public static func buildLimitedAvailability<P>(_ component: P) -> Parsers.OptionalParser<P>
  where P: Parser {
    .init(component)
  }
}

public struct OneOf<Upstream>: Parser where Upstream: Parser {
  public let upstream: Upstream

  @inlinable
  public init(@OneOfBuilder _ build: () -> Upstream) {
    self.upstream = build()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
    self.upstream.parse(&input)
  }
}
