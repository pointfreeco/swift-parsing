extension Parser {
  /// Makes this parser print with a given printer.
  ///
  /// Useful for providing a default for printing.
  ///
  /// For example, a parser-printer may want to parse any amount of whitespace, but prefer printing
  /// a single space:
  ///
  /// ```swift
  /// let spaces = Skip { Prefix(while: \.isWhitespace) }.printing(" ")
  ///
  /// var input = "     123"[...]
  /// try spaces.parse(&input)  // ()
  /// input                     // "123"
  ///
  /// try spaces.print(into: &input)
  /// input                     // " 123"
  /// ```
  ///
  /// - Parameter printer: A printer.
  /// - Returns: A parser-printer that parses using this parser, and prints using the given printer.
  @inlinable
  public func printing<P>(_ printer: P) -> Parsers.OverridePrinting<Self, P> {
    .init(parser: self, printer: printer)
  }

  @inlinable
  public func printing(
    _ print: @escaping (Output, inout Input) -> Void
  ) -> Parsers.Print<Self> {
    .init(parser: self, printer: print)
  }

  @inlinable
  public func printing(
    _ print: @escaping (Output, inout Input) throws -> Void
  ) -> Parsers.TryPrint<Self> {
    .init(parser: self, printer: print)
  }
}

extension Parsers {
  /// A parser-printer that parses with the given parser and prints with the given parser-printer.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/printing(_:)-1lyhy`` operator, which constructs this type.
  public struct OverridePrinting<Parser: Parsing.Parser, Printer: ParserPrinter>: ParserPrinter
  where
    Parser.Input == Printer.Input,
    Parser.Output == Printer.Output
  {
    public let parser: Parser
    public let printer: Printer

    @inlinable
    public init(
      parser: Parser,
      printer: Printer
    ) {
      self.parser = parser
      self.printer = printer
    }

    @inlinable
    public func parse(_ input: inout Parser.Input) rethrows -> Parser.Output {
      try self.parser.parse(&input)
    }

    @inlinable
    public func print(_ output: Parser.Output, into input: inout Parser.Input) rethrows {
      try self.printer.print(output, into: &input)
    }
  }
  
  @preconcurrency
  public struct Print<Upstream: Parser>: ParserPrinter {
    public let parser: Upstream
    public let printer: (Upstream.Output, inout Upstream.Input) -> Void

    @inlinable
    public init(
      parser: Upstream,
      printer: @escaping (Upstream.Output, inout Upstream.Input) -> Void
    ) {
      self.parser = parser
      self.printer = printer
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) rethrows -> Upstream.Output {
      try self.parser.parse(&input)
    }

    @inlinable
    public func print(_ output: Upstream.Output, into input: inout Upstream.Input) {
      self.printer(output, &input)
    }
  }
  
  @preconcurrency
  public struct TryPrint<Upstream: Parser>: ParserPrinter {
    public let parser: Upstream
    public let printer: (Upstream.Output, inout Upstream.Input) throws -> Void

    @inlinable
    public init(
      parser: Upstream,
      printer: @escaping (Upstream.Output, inout Upstream.Input) throws -> Void
    ) {
      self.parser = parser
      self.printer = printer
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) rethrows -> Upstream.Output {
      try self.parser.parse(&input)
    }

    @inlinable
    public func print(_ output: Upstream.Output, into input: inout Upstream.Input) throws {
      try self.printer(output, &input)
    }
  }
}

extension Parsers.OverridePrinting: Sendable where Parser: Sendable, Printer: Sendable { }
