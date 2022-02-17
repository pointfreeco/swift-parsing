extension Parsers {
  /// A type-erased parser of `Output` from `Input` that never throws.
  ///
  /// See ``AnyParser`` for the throwing equivalent.
  public struct NonThrowingParser<Input, Output>: Parser {
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

    @inlinable
    public func eraseToAnyParser() -> Self {
      self
    }
  }
}
