/// A type-erased parser-printer of `Output` from `Input`.
///
/// This parser-printer forwards its `parse(_:)` and `print(_:to:)` methods to an arbitrary
/// underlying parser-printer having the same `Input` and `Output` types, hiding the specifics of
/// the underlying ``ParserPrinter``.
///
/// Use `AnyParserPrinter` to wrap a parser whose type has details you don't want to expose across
/// API boundaries, such as different modules. When you use type erasure this way, you can change
/// the underlying parser over time without affecting existing clients.
public struct AnyParserPrinter<Input, Output>: ParserPrinter {
  @usableFromInline let parser: (inout Input) throws -> Output
  @usableFromInline let printer: (Output, inout Input) throws -> Void

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
