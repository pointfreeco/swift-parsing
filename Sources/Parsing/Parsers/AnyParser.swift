/// A type-erased parser of `Output` from `Input`.
///
/// This parser forwards its ``parse(_:)`` method to an arbitrary underlying parser having the same
/// `Input` and `Output` types, hiding the specifics of the underlying ``Parser``.
///
/// Use ``AnyParser`` to wrap a parser whose type has details you don't want to expose across API
/// boundaries, such as different modules. When you use type erasure this way, you can change the
/// underlying parser over time without affecting existing clients.
public struct AnyParser<Input, Output>: Parser {
  @usableFromInline
  let parser: (inout Input) throws -> Output

  /// Creates a parser that wraps the given closure in its ``parse(_:)`` method.
  ///
  /// - Parameter parse: A closure that attempts to parse an output from an input. `parse` is
  ///   executed each time the ``parse(_:)`` method is called on the resulting parser.
  @inlinable
  public init(_ parse: @escaping (inout Input) throws -> Output) {
    self.parser = parse
  }

  @inlinable
  public func parse(_ input: inout Input) throws -> Output {
    try self.parser(&input)
  }
}

extension Parsers {
  public typealias AnyParser = Parsing.AnyParser  // NB: Convenience type alias for discovery
}
