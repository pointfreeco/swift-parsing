extension Printer {
  /// Wraps this parser with a type eraser.
  ///
  /// This form of _type erasure_ preserves abstraction across API boundaries, such as different
  /// modules.
  ///
  /// When you expose your composed printers as the ``AnyPrinter`` type, you can change the
  /// underlying implementation over time without affecting existing clients.
  ///
  /// Equivalent to passing `self` to ``AnyPrinter/init(_:)``.
  ///
  /// - Returns: An ``AnyPrinter`` wrapping this printer.
  @inlinable
  public func eraseToAnyPrinter() -> AnyPrinter<Input, Output> {
    .init(self)
  }
}

/// A type-erased printer of `Output` into `Input`.
///
/// This parser forwards its ``print(_:)`` method to an arbitrary underlying printer having the same
/// `Input` and `Output` types, hiding the specifics of the underlying ``Printer``.
///
/// Use ``AnyPrinter`` to wrap a printer whose type has details you don't want to expose across API
/// boundaries, such as different modules. When you use type erasure this way, you can change the
/// underlying printer over time without affecting existing clients.
///
/// See ``Printers/NonThrowingPrinter`` for a type-erased printer that never throws.
public struct AnyPrinter<Input, Output>: Printer {
  public let printer: (Output, inout Input) throws -> Void

  @inlinable
  public init<P: Printer>(_ printer: P) where P.Input == Input, P.Output == Output {
    self.printer = printer.print
  }

  /// Creates a printer that wraps the given closure in its ``print(_:)`` method.
  ///
  /// - Parameter print: A closure that attempts to print an output into an input. `print` is
  ///   executed each time the ``print(_:)`` method is called on the resulting printer.
  @inlinable
  public init(_ print: @escaping (Output, inout Input) throws -> Void) {
    self.printer = print
  }

  @inlinable
  public func print(_ output: Output, to input: inout Input) throws {
    try self.printer(output, &input)
  }
}
