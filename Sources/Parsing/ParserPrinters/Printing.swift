extension Parser {
  /// Makes this parser print with a given printer.
  ///
  /// Useful for providing a default for printing.
  ///
  /// For example, a parser-printer may want to parse any amount of whitespace, but prefer printing
  /// a single space:
  ///
  /// ```swift
  /// let spaces = Prefix { $0.isWhitespace }.printing(" ")
  ///
  /// var input = "     123"[...]
  /// try spaces.parse(&input)  // ()
  /// input                     // "123"
  ///
  /// spaces.print(to: &input)
  /// input                     // "123 "
  /// ```
  ///
  /// - Parameter printer: A printer.
  /// - Returns: A parser-printer that parses using this parser, and prints using the given printer.
  @inlinable
  public func printing<P>(_ printer: P) -> Parsers.Printing<Self, P> {
    .init(parser: self, printer: printer)
  }
}

extension Parsers {
  /// A parser-printer that parses with the given parser and prints with the given printer.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/printing(_:)`` operator, which constructs this type.
  public struct Printing<Parser: Parsing.Parser, Printer: Parsing.Printer>: ParserPrinter
  where
    Parser.Input == Printer.Input,
    Printer.Output == Void
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
    public func parse(_ input: inout Parser.Input) rethrows {
      _ = try self.parser.parse(&input)
    }

    @inlinable
    public func print(_ output: (), to input: inout Parser.Input) rethrows {
      try self.printer.print(to: &input)
    }
  }
}
