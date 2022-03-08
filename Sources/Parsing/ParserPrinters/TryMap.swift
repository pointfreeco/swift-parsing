extension Parser {
  /// Returns a parser that tries to transforms the output of this parser with a given closure.
  ///
  /// Unlike the standard ``map(_:)-4hsj5`` function, the `transform` may throw an error, which is passed on if it occurs during a `parse`.
  ///
  /// This method is similar to `Sequence.map`, `Optional.map`, and `Result.map` in the Swift
  /// standard library, as well as `Publisher.map` in the Combine framework.
  ///
  /// ## Printability
  ///
  /// Mapping a parser with a transform function results in a parser that cannot print. If you need
  /// to transform the output of a parser and retain printability, use the ``Conversion``-based
  /// ``map(_:)-2sblf`` operator instead.
  ///
  /// - Parameter transform: A closure that transforms values of this parser's output.
  /// - Returns: A parser of transformed outputs.
  ///
  ///
  @inlinable
  public func tryMap<NewOutput>(
    _ transform: @escaping (Output) throws -> NewOutput
  ) -> Parsers.TryMap<Self, NewOutput> {
      .init(upstream: self, transform: transform)
  }

  /// Returns a parser that replaces the `Void` output of this parser with the output of a given
  /// closure.
  ///
  /// A printer-friendly version of ``tryMap(_:)-4hsj5`` for `Void` outputs, so long as `NewOutput`
  /// conforms to `Equatable`.
  ///
  /// ```swift
  /// enum Role: String {
  ///   case admin
  ///   case guest
  ///   case member
  /// }
  ///
  /// let role = OneOf {
  ///   "admin".map { Role.admin }
  ///   "guest".map { Role.guest }
  ///   "member".map { Role.member }
  /// }
  ///
  /// try role.parse("admin")  // Role.admin
  /// role.print(.guest)       // "guest"
  /// ```
  ///
  /// - Parameter transform: A closure that returns an output.
  /// - Returns: A parser of outputs.
  @_disfavoredOverload
  @inlinable
  public func tryMap<NewOutput>(
    _ transform: () throws -> NewOutput
  ) rethrows -> Parsers.MapConstant<Self, NewOutput> {
    try .init(upstream: self, output: transform())
  }
}

extension Parsers {
  /// A parser that transforms the output of another parser with a given closure.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/tryMap(_:)-4hsj5`` operation, which constructs this type.
  public struct TryMap<Upstream: Parser, NewOutput>: Parser {
    /// The parser from which this parser receives output.
    public let upstream: Upstream

    /// The closure that transforms output from the upstream parser.
    public let transform: (Upstream.Output) throws -> NewOutput

    @inlinable
    public init(upstream: Upstream, transform: @escaping (Upstream.Output) throws -> NewOutput) {
      self.upstream = upstream
      self.transform = transform
    }

    @inlinable
    @inline(__always)
    public func parse(_ input: inout Upstream.Input) throws -> NewOutput {
        let result = try self.upstream.parse(&input)
//        do {
        return try self.transform(result)
//        } catch {
            // FIXME: very expensive!
//          throw ParsingError.wrap(error, at: input)
//        }
    }
  }
}
