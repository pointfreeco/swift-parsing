extension Parser {
  /// Returns a parser that discards the output of this parser by returning `Void` instead.
  ///
  /// - Returns: A parser that discards its output.
  @inlinable
  public func ignoreOutput() -> Skip<Self> {
    .init(self)
  }

  /// Returns a parser that runs this parser and the given parser, taking only the output of the
  /// given parser.
  ///
  /// - Parameter parser: A parser to run immediately after this parser.
  /// - Returns: A parser that runs two parsers, ignoring the first's output.
  @inlinable
  public func take<P>(_ parser: P) -> Parsers.SkipFirst<Self, P>
  where P: Parser, P.Input == Input, Output == Void {
    .init(self, parser)
  }

  /// Returns a parser that runs this parser and the given parser, taking only the output of this
  /// parser.
  ///
  /// - Parameter parser: A parser to run immediately after this parser.
  /// - Returns: A parser that runs two parsers, ignoring the second's output.
  @inlinable
  public func skip<P>(_ parser: P) -> Parsers.SkipSecond<Self, P>
  where P: Parser, P.Input == Input {
    .init(self, parser)
  }
}

/// A parser that discards the output of another parser.
public struct Skip<Upstream>: Parser where Upstream: Parser {
  /// The parser from which this parser receives output.
  public let upstream: Upstream

  @inlinable
  public init(_ upstream: Upstream) {
    self.upstream = upstream
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) -> Void? {
    guard self.upstream.parse(&input) != nil else { return nil }
    return ()
  }
}

extension Parsers {
  /// A parser that runs two parsers, one after the other, taking only the output of the second
  /// parser.
  public struct SkipFirst<A, B>: Parser where A: Parser, B: Parser, A.Input == B.Input {
    public let a: A
    public let b: B

    @inlinable
    public init(_ a: A, _ b: B) {
      self.a = a
      self.b = b
    }

    @inlinable
    public func parse(_ input: inout A.Input) -> B.Output? {
      let original = input

      guard self.a.parse(&input) != nil
      else { return nil }

      guard let b = self.b.parse(&input)
      else {
        input = original
        return nil
      }

      return b
    }
  }

  /// A parser that runs two parsers, one after the other, taking only the output of the first
  /// parser.
  public struct SkipSecond<A, B>: Parser where A: Parser, B: Parser, A.Input == B.Input {
    public let a: A
    public let b: B

    @inlinable
    public init(_ a: A, _ b: B) {
      self.a = a
      self.b = b
    }

    @inlinable
    @inline(__always)
    public func parse(_ input: inout A.Input) -> A.Output? {
      let original = input

      guard let a = self.a.parse(&input)
      else { return nil }

      guard self.b.parse(&input) != nil
      else {
        input = original
        return nil
      }

      return a
    }
  }

  public typealias Skip = Parsing.Skip  // NB: Convenience type alias for discovery
}

extension Parsers.SkipFirst: Printer
where
  A: Printer,
  A.Output == Void,
  A.Input: Appendable,
  B: Printer
{
  public func print(_ output: B.Output) -> A.Input? {
    guard
      var input1 = self.a.print(()),
      let input2 = self.b.print(output)
    else { return nil }

    input1.append(contentsOf: input2)
    return input1
  }
}

extension Parsers.SkipSecond: Printer
where
  A: Printer,
  A.Input: Appendable,
  B: Printer,
  B.Output == Void
{
  public func print(_ output: A.Output) -> A.Input? {
    guard
      var input1 = self.a.print(output),
      let input2 = self.b.print(())
    else { return nil }

    input1.append(contentsOf: input2)
    return input1
  }
}

