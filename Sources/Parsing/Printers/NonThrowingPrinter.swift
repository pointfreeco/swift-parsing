//extension Printers {
//  /// A type-erased printer of `Output` into `Input` that never throws.
//  ///
//  /// See ``AnyPrinter`` for the throwing equivalent.
//  public struct NonThrowingPrinter<Input, Output>: Printer {
//    public let printer: (Output, inout Input) -> Void
//
//    /// Creates a printer that wraps the given closure in its ``print(_:)`` method.
//    ///
//    /// - Parameter print: A closure that attempts to print an output into an input. `print` is
//    ///   executed each time the ``print(_:)`` method is called on the resulting printer.
//    @inlinable
//    public init(_ print: @escaping (Output, inout Input) -> Void) {
//      self.printer = print
//    }
//
//    @inlinable
//    public func print(_ output: Output, into input: inout Input) {
//      self.printer(output, &input)
//    }
//  }
//}
