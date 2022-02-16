extension Parser {
  /// Returns a parser that transforms the error of this parser can throw with a given closure.
  ///
  /// This method is similar to ``replaceError(with:)``, but it doesn't offer the same compile-time
  /// guarantee, as you can either return some `Output` value, or throw another error. 
  ///
  /// - Parameter transform: A closure that transforms errors that this parser's throws.
  /// - Returns: A parser of with a transformed error.
  @inlinable
  public func transformError(
    _ transform: @escaping (Error) throws -> Self.Output
  ) -> Parsers.TransformError<Self, Output> {
    .init(upstream: self, transform: transform)
  }
}

extension Parsers {
  /// A parser that transforms the error of another parser with a given closure.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/transformError(_:)`` operation, which constructs this type.
  public struct TransformError<Upstream: Parser, Output>: Parser {
    /// The parser from which this parser receives output.
    public let upstream: Upstream

    /// The closure that transforms a thrown error from the upstream parser.
    public let transform: (Error) throws -> Upstream.Output

    @inlinable
    public init(upstream: Upstream, transform: @escaping (Error) throws -> Upstream.Output) {
      self.upstream = upstream
      self.transform = transform
    }

    @inlinable
    @inline(__always)
    public func parse(_ input: inout Upstream.Input) rethrows -> Upstream.Output {
      let original = input
      do {
        return try self.upstream.parse(&input)
      } catch {
        input = original
        return try self.transform(error)
      }
    }
  }
}
