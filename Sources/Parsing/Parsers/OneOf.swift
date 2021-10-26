extension Parser {
  /// A parser that runs this parser and, if it fails, runs the given parser.
  @inlinable
  public func orElse<P>(_ parser: P) -> Parsers.OneOf<Self, P> {
    .init(self, parser)
  }
}

/// A parser that attempts to run a number of parsers till one succeeds.
///
/// This is a more performant version of ``Parser/orElse(_:)`` that can be used when `Upstream` is
/// the same type.
///
/// For example, `OneOfMany` can capture the work of a number of parsers that do similar work and
/// are thus all `Parsers.Map<StartsWith<Input>, Output>`:
///
/// ```swift
/// enum Currency { case eur, gbp, usd }
///
/// let currency = OneOfMany(
///   StartsWith("€").map { Currency.eur },
///   StartsWith("£").map { .gbp },
///   StartsWith("$").map { .usd }
/// )
/// ```
public struct OneOfMany<Upstream>: Parser where Upstream: Parser {
  public let parsers: [Upstream]

  @inlinable
  public init(_ parsers: [Upstream]) {
    self.parsers = parsers
  }

  @inlinable
  public init(_ parsers: Upstream...) {
    self.init(parsers)
  }

  @inlinable
  @inline(__always)
  public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
    for parser in self.parsers {
      if let output = parser.parse(&input) {
        return output
      }
    }
    return nil
  }
}

public typealias OneOf = Parsers.OneOf

extension Parsers {
  /// A parser that runs the first parser and, if it fails, runs the second parser.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/orElse(_:)`` operation, which constructs this type.
  public struct OneOf<A, B>: Parser
  where
    A: Parser,
    B: Parser,
    A.Input == B.Input,
    A.Output == B.Output
  {
    public let a: A
    public let b: B

    @inlinable
    public init(_ a: A, _ b: B) {
      self.a = a
      self.b = b
    }

    @inlinable
    @inline(__always)
    public func parse(_ input: inout A.Input) -> A.Output? {
      if let output = self.a.parse(&input) { return output }
      if let output = self.b.parse(&input) { return output }
      return nil
    }
  }

  public typealias OneOfMany = Parsing.OneOfMany  // NB: Convenience type alias for discovery
}

public struct _OneOf<P>: Parser where P: Parser {
  public let parser: P

  public init(_ parser: P) {
    self.parser = parser
  }

  public init<A, B>(@ParserBuilder build: () -> OneOf<A, B>) where P == OneOf<A, B> {
    self.parser = build()
  }

  public init<A, B, C>(@ParserBuilder build: () -> OneOf3<A, B, C>) where P == OneOf3<A, B, C> {
    self.parser = build()
  }

  public func parse(_ input: inout P.Input) -> P.Output? {
    self.parser.parse(&input)
  }
}

public struct OneOf3<P1, P2, P3>: Parser
where P1: Parser, P2: Parser, P3: Parser,
        P1.Input == P2.Input, P2.Input == P3.Input,
      P1.Output == P2.Output, P2.Output == P3.Output{
  public let p1: P1
  public let p2: P2
  public let p3: P3

  public init(_ p1: P1, _ p2: P2, _ p3: P3) {
    self.p1 = p1
    self.p2 = p2
    self.p3 = p3
  }

  public func parse(_ input: inout P1.Input) -> P1.Output? {
    if let output = self.p1.parse(&input) { return output }
    if let output = self.p2.parse(&input) { return output }
    if let output = self.p3.parse(&input) { return output }
    return nil
  }
}
