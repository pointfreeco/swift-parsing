extension Parser {
  @inlinable
  public func printing<P>(_ printer: P) -> Parsers.Printing<Self, P> {
    .init(upstream: self, printer: printer)
  }
}

extension Parsers {
  public struct Printing<Upstream, Printer>: ParserPrinter
  where
    Upstream: Parser,
    Printer: Parsing.Printer,
    Upstream.Input == Printer.Input,
    Printer.Output == Void
  {
    public let upstream: Upstream
    public let printer: Printer

    @inlinable
    public init(
      upstream: Upstream,
      printer: Printer
    ) {
      self.upstream = upstream
      self.printer = printer
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) rethrows {
      _ = try self.upstream.parse(&input)
    }

    @inlinable
    public func print(_ output: (), to input: inout Upstream.Input) rethrows {
      try self.printer.print(to: &input)
    }
  }
}
