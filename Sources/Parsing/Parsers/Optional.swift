extension Optional {
  /// A parser that parses `nil` when this parser fails.
  ///
  /// Use this parser when you are parsing into an output data model that contains `nil`.
  ///
  /// If you are optionally parsing input that should coalesce into some default, you can skip the
  /// optionality and instead use ``Parser/orElse(_:)`` with an ``Always`` parser, given a default.
  @inlinable
  public static func parser<P>(of parser: P) -> Parsers.OptionalParser<P>
  where P: Parser, P.Output == Wrapped {
    .init(parser)
  }
}

extension Parsers {
  /// A parser that parses `nil` when its upstream parser fails.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// `Optional.parser(of:)`, which constructs this type.
  public struct OptionalParser<Upstream>: Parser where Upstream: Parser {
    public let upstream: Upstream

    @inlinable
    public init(_ upstream: Upstream) {
      self.upstream = upstream
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) -> Upstream.Output?? {
      .some(self.upstream.parse(&input))
    }
  }
}

extension Parsers.OptionalParser: Printer
where
  Upstream: Printer,
  Upstream.Input: Appendable
{
  public func print(_ output: Upstream.Output?) -> Upstream.Input? {
    guard let output = output
    else { return .init() }

    return self.upstream.print(output)
  }
}
