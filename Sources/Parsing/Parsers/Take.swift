extension Parser {
  /// Returns a parser that runs this parser and the given parser, returning both outputs in a
  /// tuple.
  ///
  /// This operator is used to gather up multiple values and can bundle them into a single data type
  /// when used alongside the `map` operator.
  ///
  /// In the following example, two `Double`s are parsed using `take` before they are combined into
  /// a `Point`.
  ///
  ///     struct Point { var x, y: Double }
  ///
  ///     var input = "-1.5,1"[...].utf8
  ///     let output = Double.parser()
  ///       .skip(StartsWith(","))
  ///       .take(CGPoint.parser())
  ///       .parse(&input) // => Point(x: -1.5, y: 1)
  ///     precondition(Substring(input) == "")
  ///
  /// - Parameter parser: A parser to run immediately after this parser.
  /// - Returns: A parser that runs two parsers, returning both outputs in a tuple.
  @inlinable
  public func take<P>(
    _ parser: P
  ) -> Parsers.Take2<Self, P>
  where P: Parser, P.Input == Input {
    .init(self, parser)
  }

  /// Returns a parser that runs this parser and the given parser, returning this parser's outputs
  /// and the given parser's output in a flattened tuple.
  ///
  /// - Parameter parser: A parser to run immediately after this parser.
  /// - Returns: A parser that runs two parsers, returning both outputs in a flattened tuple.
  @inlinable
  public func take<A, B, P>(
    _ parser: P
  ) -> Parsers.Take3<Self, A, B, P>
  where P: Parser, P.Input == Input, Output == (A, B) {
    .init(self, parser)
  }

  /// Returns a parser that runs this parser and the given parser, returning this parser's outputs
  /// and the given parser's output in a flattened tuple.
  ///
  /// - Parameter parser: A parser to run immediately after this parser.
  /// - Returns: A parser that runs two parsers, returning both outputs in a flattened tuple.
  @inlinable
  public func take<A, B, C, P>(
    _ parser: P
  ) -> Parsers.Take4<Self, A, B, C, P>
  where P: Parser, P.Input == Input, Output == (A, B, C) {
    .init(self, parser)
  }

  /// Returns a parser that runs this parser and the given parser, returning this parser's outputs
  /// and the given parser's output in a flattened tuple.
  ///
  /// - Parameter parser: A parser to run immediately after this parser.
  /// - Returns: A parser that runs two parsers, returning both outputs in a flattened tuple.
  @inlinable
  public func take<A, B, C, D, P>(
    _ parser: P
  ) -> Parsers.Take5<Self, A, B, C, D, P>
  where P: Parser, P.Input == Input, Output == (A, B, C, D) {
    .init(self, parser)
  }
}

extension Parsers {
  /// A parser that runs two parsers, one after the other, and returns both outputs in a tuple.
  public struct Take2<A, B>: Parser
  where
    A: Parser,
    B: Parser,
    A.Input == B.Input
  {
    public let a: A
    public let b: B

    @inlinable
    public init(_ a: A, _ b: B) {
      self.a = a
      self.b = b
    }

    @inlinable
    public func parse(_ input: inout A.Input) -> (A.Output, B.Output)? {
      let original = input
      guard let a = self.a.parse(&input)
      else { return nil }
      guard let b = self.b.parse(&input)
      else {
        input = original
        return nil
      }
      return (a, b)
    }
  }

  /// A parser that runs a parser of a tuple of outputs and another parser, one after the other,
  /// and returns a flattened tuple of the first parser's outputs and the second parser's output.
  public struct Take3<AB, A, B, C>: Parser
  where
    AB: Parser,
    AB.Output == (A, B),
    C: Parser,
    AB.Input == C.Input
  {
    public let ab: AB
    public let c: C

    @inlinable
    public init(
      _ ab: AB,
      _ c: C
    ) {
      self.ab = ab
      self.c = c
    }

    @inlinable
    public func parse(_ input: inout AB.Input) -> (A, B, C.Output)? {
      let original = input
      guard let (a, b) = self.ab.parse(&input)
      else { return nil }
      guard let c = self.c.parse(&input)
      else {
        input = original
        return nil
      }
      return (a, b, c)
    }
  }

  /// A parser that runs a parser of a tuple of outputs and another parser, one after the other,
  /// and returns a flattened tuple of the first parser's outputs and the second parser's output.
  public struct Take4<ABC, A, B, C, D>: Parser
  where
    ABC: Parser,
    ABC.Output == (A, B, C),
    D: Parser,
    ABC.Input == D.Input
  {
    public let abc: ABC
    public let d: D

    @inlinable
    public init(
      _ abc: ABC,
      _ d: D
    ) {
      self.abc = abc
      self.d = d
    }

    @inlinable
    public func parse(_ input: inout ABC.Input) -> (A, B, C, D.Output)? {
      let original = input
      guard let (a, b, c) = self.abc.parse(&input)
      else { return nil }
      guard let d = self.d.parse(&input)
      else {
        input = original
        return nil
      }
      return (a, b, c, d)
    }
  }

  /// A parser that runs a parser of a tuple of outputs and another parser, one after the other,
  /// and returns a flattened tuple of the first parser's outputs and the second parser's output.
  public struct Take5<ABCD, A, B, C, D, E>: Parser
  where
    ABCD: Parser,
    ABCD.Output == (A, B, C, D),
    E: Parser,
    ABCD.Input == E.Input
  {
    public let abcd: ABCD
    public let e: E

    @inlinable
    public init(
      _ abcd: ABCD,
      _ e: E
    ) {
      self.abcd = abcd
      self.e = e
    }

    @inlinable
    public func parse(_ input: inout ABCD.Input) -> (A, B, C, D, E.Output)? {
      let original = input
      guard let (a, b, c, d) = self.abcd.parse(&input)
      else { return nil }
      guard let e = self.e.parse(&input)
      else {
        input = original
        return nil
      }
      return (a, b, c, d, e)
    }
  }
}
