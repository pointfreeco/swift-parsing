/// A parser that parses `nil` when this parser fails.
///
/// Use this parser when you are parsing into an output data model that contains `nil`.
///
/// If you are optionally parsing input that should coalesce into some default, you can skip the
/// optionality and instead use ``Parser/orElse(_:)`` with an ``Always`` parser, given a default.
public struct Optionally<Upstream>: Parser where Upstream: Parser {
  public let upstream: Upstream

  @inlinable
  public init(@ParserBuilder _ build: () -> Upstream) {
    self.upstream = build()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) -> Upstream.Output?? {
    .some(self.upstream.parse(&input))
  }
}

extension Optionally: Printer where Upstream: Printer {
  @inlinable
  public func print(_ output: Upstream.Output?) -> Upstream.Input? {
    output.flatMap(self.upstream.print)
  }
}

extension Optional {
  @inlinable
  public static func parser<P>(of parser: P) -> Optionally<P>
  where P: Parser, P.Output == Wrapped {
    .init { parser }
  }
}

extension Parsers {
  public typealias OptionalParser = Optionally
}
