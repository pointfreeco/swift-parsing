/// A parser that attempts to run a number of parsers to accumulate their outputs.
///
/// A general entry point into ``ParserBuilder`` syntax, which can be used to build complex parsers
/// from simpler ones.
///
/// ```swift
/// let point = Parse {
///   "("
///   Int.parser()
///   ","
///   Int.parser()
///   ")"
/// }
///
/// try point.parse("(2,-4)")  // (2, -4)
///
/// try point.parse("(42,blob)")
/// // error: unexpected input
/// //  --> input:1:5
/// // 1 | (42,blob)
/// //   |     ^ expected integer
/// ```
public struct Parse<Parsers: Parser>: Parser {
  public let parsers: Parsers

  /// An entry point into ``ParserBuilder`` syntax.
  ///
  /// Used to combine the non-void outputs from multiple parsers into a single output by running
  /// each parser in sequence and bundling the results up into a tuple.
  ///
  /// For example, the following parser parses a double, skips a comma, and then parses another
  /// double before returning a tuple of each double.
  ///
  /// ```swift
  /// let coordinate = Parse {
  ///   Double.parser()
  ///   ","
  ///   Double.parser()
  /// }
  ///
  /// try coordinate.parse("1,2")  // (1.0, 2.0)
  /// ```
  ///
  /// - Parameter with: A parser builder that will accumulate non-void outputs in a tuple.
  @inlinable
  public init(@ParserBuilder<Parsers.Input> with build: () -> Parsers) {
    self.parsers = build()
  }

  /// A parser builder that bakes in a transformation of the tuple output.
  ///
  /// Equivalent to calling ``Parser/map(_:)-4hsj5`` on the result of a `Parse.init` builder.
  ///
  /// For example, the following parser:
  ///
  /// ```swift
  /// Parse {
  ///   Double.parser()
  ///   ","
  ///   Double.parser()
  /// }
  /// .map(Coordinate.init(x:y:))
  /// ```
  ///
  /// Can be rewritten as:
  ///
  /// ```swift
  /// Parse(Coordinate.init(x:y:)) {
  ///   Double.parser()
  ///   ","
  ///   Double.parser()
  /// }
  /// ```
  ///
  /// - Parameters:
  ///   - transform: A transform to apply to the output of the parser builder.
  ///   - with: A parser builder that will accumulate non-void outputs in a tuple.
  @inlinable
  public init<Upstream, NewOutput>(
    _ transform: @escaping (Upstream.Output) -> NewOutput,
    @ParserBuilder<Upstream.Input> with build: () -> Upstream
  ) where Parsers == Parsing.Parsers.Map<Upstream, NewOutput> {
    self.parsers = build().map(transform)
  }

  /// A parser builder that replaces a void output with a given value.
  ///
  /// Equivalent to calling ``Parser/map(_:)-2e6si`` on the result of a `Parse.init` builder.
  ///
  /// For example, the following parser:
  ///
  /// ```swift
  /// Parse { "admin" }.map { Role.admin }
  /// ```
  ///
  /// Can be rewritten as:
  ///
  /// ```swift
  /// Parse(Role.admin) { "admin" }
  /// ```
  @inlinable
  public init<Upstream, NewOutput>(
    _ output: NewOutput,
    @ParserBuilder<Upstream.Input> with build: () -> Upstream
  ) where Parsers == Parsing.Parsers.MapConstant<Upstream, NewOutput> {
    self.parsers = build().map { output }
  }

  /// A parser builder that bakes in a conversion of the tuple output.
  ///
  /// Equivalent to calling ``Parser/map(_:)-18m9d`` on the result of a `Parse.init` builder.
  ///
  /// For example, the following parser:
  ///
  /// ```swift
  /// ParsePrint {
  ///   Double.parser()
  ///   ","
  ///   Double.parser()
  /// }
  /// .map(.memberwise(Coordinate.init(x:y:)))
  /// ```
  ///
  /// Can be rewritten as:
  ///
  /// ```swift
  /// ParsePrint(.memberwise(Coordinate.init(x:y:))) {
  ///   Double.parser()
  ///   ","
  ///   Double.parser()
  /// }
  /// ```
  ///
  /// - Parameters:
  ///   - conversion: A conversion to apply to the output of the parser builder.
  ///   - with: A parser builder that will accumulate non-void outputs in a tuple.
  @inlinable
  public init<Upstream, Downstream>(
    _ conversion: Downstream,
    @ParserBuilder<Upstream.Input> with build: () -> Upstream
  ) where Parsers == Parsing.Parsers.MapConversion<Upstream, Downstream> {
    self.parsers = build().map(conversion)
  }

  @inlinable
  public func parse(_ input: inout Parsers.Input) rethrows -> Parsers.Output {
    try self.parsers.parse(&input)
  }
}

extension Parse: ParserPrinter where Parsers: ParserPrinter {
  @inlinable
  public func print(_ output: Parsers.Output, into input: inout Parsers.Input) rethrows {
    try self.parsers.print(output, into: &input)
  }
}

/// An entry to ``ParserBuilder`` syntax that requires the builder to be a printer.
///
/// Although you can build printers with the ``Parse`` entry point, as long as everything in the
/// builder context is a printer, it doesn't proper connote its intentions. By using ``ParsePrint``
/// you can make your intentions clearer:
///
/// ```swift
/// let welcoming = ParsePrint {
///   "Hello "
///   Int.parser()
///   "!"
/// }
///
/// try welcoming.parse("Hello 42!") // 42
/// try welcoming.print(1729) // "Hello 1729"
/// ```
///
/// The ``ParsePrint`` entry point can also help you catch errors earlier if you accidentally use
/// an operator that is not printer-friendly:
///
/// ```swift
/// let welcoming = ParsePrint {
///   "Hello "
///   Prefix { $0 != "!" }.map(String.init)
///   "!"
/// }
/// ```
///
/// > Generic struct `ParsePrint` requires that `Parsers.Map<Prefix<Substring>, String>` conform
/// > to `ParserPrinter`
///
/// `ParsePrint` is a type alias for the ``Parse`` parser with its underlying parser constrained to
/// ``ParserPrinter``.
public struct ParsePrint<ParserPrinters: ParserPrinter>: ParserPrinter {
  public let parserPrinters: ParserPrinters

  @inlinable
  public init(@ParserBuilder<ParserPrinters.Input> with build: () -> ParserPrinters) {
    self.parserPrinters = build()
  }

  @inlinable
  public init<Upstream, NewOutput>(
    _ output: NewOutput,
    @ParserBuilder<Upstream.Input> with build: () -> Upstream
  ) where ParserPrinters == Parsers.MapConstant<Upstream, NewOutput> {
    self.parserPrinters = build().map { output }
  }

  @inlinable
  public init<Upstream, Downstream>(
    _ conversion: Downstream,
    @ParserBuilder<Upstream.Input> with build: () -> Upstream
  ) where ParserPrinters == Parsers.MapConversion<Upstream, Downstream> {
    self.parserPrinters = build().map(conversion)
  }

  @inlinable
  public func parse(_ input: inout ParserPrinters.Input) rethrows -> ParserPrinters.Output {
    try self.parserPrinters.parse(&input)
  }

  @inlinable
  public func print(
    _ output: ParserPrinters.Output, into input: inout ParserPrinters.Input
  ) throws {
    try self.parserPrinters.print(output, into: &input)
  }
}
