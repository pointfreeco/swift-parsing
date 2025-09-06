extension ParserPrinter {
  /// Wraps this parser with a type eraser.
  ///
  /// This form of _type erasure_ preserves abstraction across API boundaries, such as different
  /// modules.
  ///
  /// When you expose your composed parser-printers as the ``AnyParserPrinter`` type, you can change
  /// the underlying implementation over time without affecting existing clients.
  ///
  /// Equivalent to passing `self` to ``AnyParserPrinter/init(_:)``.
  ///
  /// - Returns: An ``AnyParserPrinter`` wrapping this parser-printer.
  @inlinable
  public func eraseToAnyParserPrinter() -> AnyParserPrinter<Input, Output> {
    AnyParserPrinter(self)
  }
}

/// A type-erased parser-printer of `Output` from `Input`.
///
/// This parser-printer forwards its `parse(_:)` and `print(_:to:)` methods to an arbitrary
/// underlying parser-printer having the same `Input` and `Output` types, hiding the specifics of
/// the underlying ``ParserPrinter``.
///
/// Use `AnyParserPrinter` to wrap a parser whose type has details you don't want to expose across
/// API boundaries, such as different modules. When you use type erasure this way, you can change
/// the underlying parser over time without affecting existing clients.
@preconcurrency // Don't know if this could ever be removed, maybe with a new type AnySendableParserPrinter?
public struct AnyParserPrinter<Input, Output>: ParserPrinter {
  @usableFromInline let parser: (inout Input) throws -> Output
  @usableFromInline let printer: (Output, inout Input) throws -> Void

  /// Creates a type-erasing parser-printer to wrap the given parser-printer.
  ///
  /// Equivalent to calling ``ParserPrinter/eraseToAnyParserPrinter()`` on the parser-printer.
  ///
  /// - Parameter parser: A parser to wrap with a type eraser.
  @inlinable
  public init<P: ParserPrinter>(_ parserPrinter: P) where P.Input == Input, P.Output == Output {
    self.init(parse: parserPrinter.parse(_:), print: parserPrinter.print(_:into:))
  }

  /// Creates a parser-printer that wraps the given closures in its ``parse(_:)`` and
  /// `print(_:to:)` methods.
  ///
  /// - Parameters:
  ///   - parse: A closure that attempts to parse an output from an input. `parse` is executed each
  ///     time the ``parse(_:)`` method is called on the resulting parser-printer.
  ///   - print: A closure that attempts to print an output into an input. `print` is executed each
  ///     time the ``print(_:)`` method is called on the resulting parser-printer.
  @inlinable
  public init(
    parse: @escaping (inout Input) throws -> Output,
    print: @escaping (Output, inout Input) throws -> Void
  ) {
    self.parser = parse
    self.printer = print
  }

  @inlinable
  public func parse(_ input: inout Input) throws -> Output {
    try self.parser(&input)
  }

  @inlinable
  public func print(_ output: Output, into input: inout Input) throws {
    try self.printer(output, &input)
  }
}
