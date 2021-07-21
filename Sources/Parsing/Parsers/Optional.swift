extension Optional {
  @inlinable
  public static func parser<P>(of parser: P) -> Parsers.OptionalParser<P>
  where P: Parser, P.Output == Wrapped {
    .init(parser)
  }
}

extension Parsers {
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

    // SEGFAULT: output.flatMap(self.upstream.print) ?? .init()
  }
}
