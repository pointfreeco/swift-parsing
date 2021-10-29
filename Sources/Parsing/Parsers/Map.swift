extension Parser {
  /// Returns a parser that transforms the output of this parser with a given closure.
  ///
  /// This method is similar to `Sequence.map`, `Optional.map`, and `Result.map` in the Swift
  /// standard library, as well as `Publisher.map` in the Combine framework.
  ///
  /// - Parameter transform: A closure that transforms values of this parser's output.
  /// - Returns: A parser of transformed outputs.
  @_disfavoredOverload
  @inlinable
  public func map<NewOutput>(
    _ transform: @escaping (Output) -> NewOutput
  ) -> Parsers.Map<Self, NewOutput> {
    .init(upstream: self, transform: transform)
  }
}

extension Parsers {
  /// A parser that transforms the output of another parser with a given closure.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Parser/map(_:)`` operation, which constructs this type.
  public struct Map<Upstream, Output>: Parser where Upstream: Parser {
    /// The parser from which this parser receives output.
    public let upstream: Upstream

    /// The closure that transforms output from the upstream parser.
    public let transform: (Upstream.Output) -> Output

    @inlinable
    public init(upstream: Upstream, transform: @escaping (Upstream.Output) -> Output) {
      self.upstream = upstream
      self.transform = transform
    }

    @inlinable
    @inline(__always)
    public func parse(_ input: inout Upstream.Input) -> Output? {
      self.upstream.parse(&input).map(self.transform)
    }
  }
}

extension Parsers {
  public struct MapViaParser<Upstream, Transform>: Parser
  where
    Upstream: Parser,
    Transform: Parser,
    Upstream.Output == Transform.Input
  {
    public let upstream: Upstream
    public let transform: Transform

    @inlinable
    public init(
      upstream: Upstream,
      transform: Transform
    ) {
      self.upstream = upstream
      self.transform = transform
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) -> Transform.Output? {
      let original = input

      guard var output = self.upstream.parse(&input)
      else { return nil }

      guard let newOutput = self.transform.parse(&output)
      else {
        input = original
        return nil
      }

      return newOutput
    }
  }
}

extension Parsers.MapViaParser: Printer
where
  Upstream: Printer,
  Transform: Printer
{
  @inlinable
  public func print(_ output: Transform.Output) -> Upstream.Input? {
    self.transform.print(output).flatMap(self.upstream.print)
  }
}

extension Printer {
  @inlinable
  public func map<P>(_ transform: P) -> Parsers.MapViaParser<Self, P>
  where
    P: Parser, Self.Output == P.Input
  {
    .init(upstream: self, transform: transform)
  }
}

