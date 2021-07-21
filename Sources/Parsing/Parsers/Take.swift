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
  ///       .take(Double.parser())
  ///       .map(Point.init)
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

  /// Returns a parser that runs this parser and the given parser, returning this parser's outputs
  /// and the given parser's output in a flattened tuple.
  ///
  /// - Parameter parser: A parser to run immediately after this parser.
  /// - Returns: A parser that runs two parsers, returning both outputs in a flattened tuple.
  @inlinable
  public func take<A, B, C, D, E, P>(
    _ parser: P
  ) -> Parsers.Take6<Self, A, B, C, D, E, P>
  where P: Parser, P.Input == Input, Output == (A, B, C, D, E) {
    .init(self, parser)
  }

  /// Returns a parser that runs this parser and the given parser, returning this parser's outputs
  /// and the given parser's output in a flattened tuple.
  ///
  /// - Parameter parser: A parser to run immediately after this parser.
  /// - Returns: A parser that runs two parsers, returning both outputs in a flattened tuple.
  @inlinable
  public func take<A, B, C, D, E, F, P>(
    _ parser: P
  ) -> Parsers.Take7<Self, A, B, C, D, E, F, P>
  where P: Parser, P.Input == Input, Output == (A, B, C, D, E, F) {
    .init(self, parser)
  }

  /// Returns a parser that runs this parser and the given parser, returning this parser's outputs
  /// and the given parser's output in a flattened tuple.
  ///
  /// - Parameter parser: A parser to run immediately after this parser.
  /// - Returns: A parser that runs two parsers, returning both outputs in a flattened tuple.
  @inlinable
  public func take<A, B, C, D, E, F, G, P>(
    _ parser: P
  ) -> Parsers.Take8<Self, A, B, C, D, E, F, G, P>
  where P: Parser, P.Input == Input, Output == (A, B, C, D, E, F, G) {
    .init(self, parser)
  }

  /// Returns a parser that runs this parser and the given parser, returning this parser's outputs
  /// and the given parser's output in a flattened tuple.
  ///
  /// - Parameter parser: A parser to run immediately after this parser.
  /// - Returns: A parser that runs two parsers, returning both outputs in a flattened tuple.
  @inlinable
  public func take<A, B, C, D, E, F, G, H, P>(
    _ parser: P
  ) -> Parsers.Take9<Self, A, B, C, D, E, F, G, H, P>
  where P: Parser, P.Input == Input, Output == (A, B, C, D, E, F, G, H) {
    .init(self, parser)
  }

  /// Returns a parser that runs this parser and the given parser, returning this parser's outputs
  /// and the given parser's output in a flattened tuple.
  ///
  /// - Parameter parser: A parser to run immediately after this parser.
  /// - Returns: A parser that runs two parsers, returning both outputs in a flattened tuple.
  @inlinable
  public func take<A, B, C, D, E, F, G, H, I, P>(
    _ parser: P
  ) -> Parsers.Take10<Self, A, B, C, D, E, F, G, H, I, P>
  where P: Parser, P.Input == Input, Output == (A, B, C, D, E, F, G, H, I) {
    .init(self, parser)
  }

  /// Returns a parser that runs this parser and the given parser, returning this parser's outputs
  /// and the given parser's output in a flattened tuple.
  ///
  /// - Parameter parser: A parser to run immediately after this parser.
  /// - Returns: A parser that runs two parsers, returning both outputs in a flattened tuple.
  @inlinable
  public func take<A, B, C, D, E, F, G, H, I, J, P>(
    _ parser: P
  ) -> Parsers.Take11<Self, A, B, C, D, E, F, G, H, I, J, P>
  where P: Parser, P.Input == Input, Output == (A, B, C, D, E, F, G, H, I, J) {
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

  /// A parser that runs a parser of a tuple of outputs and another parser, one after the other,
  /// and returns a flattened tuple of the first parser's outputs and the second parser's output.
  public struct Take6<ABCDE, A, B, C, D, E, F>: Parser
  where
    ABCDE: Parser,
    ABCDE.Output == (A, B, C, D, E),
    F: Parser,
    ABCDE.Input == F.Input
  {
    public let abcde: ABCDE
    public let f: F

    @inlinable
    public init(
      _ abcde: ABCDE,
      _ f: F
    ) {
      self.abcde = abcde
      self.f = f
    }

    @inlinable
    public func parse(_ input: inout ABCDE.Input) -> (A, B, C, D, E, F.Output)? {
      let original = input
      guard let (a, b, c, d, e) = self.abcde.parse(&input)
      else { return nil }
      guard let f = self.f.parse(&input)
      else {
        input = original
        return nil
      }
      return (a, b, c, d, e, f)
    }
  }

  /// A parser that runs a parser of a tuple of outputs and another parser, one after the other,
  /// and returns a flattened tuple of the first parser's outputs and the second parser's output.
  public struct Take7<ABCDEF, A, B, C, D, E, F, G>: Parser
  where
    ABCDEF: Parser,
    ABCDEF.Output == (A, B, C, D, E, F),
    G: Parser,
    ABCDEF.Input == G.Input
  {
    public let abcdef: ABCDEF
    public let g: G

    @inlinable
    public init(
      _ abcdef: ABCDEF,
      _ g: G
    ) {
      self.abcdef = abcdef
      self.g = g
    }

    @inlinable
    public func parse(_ input: inout ABCDEF.Input) -> (A, B, C, D, E, F, G.Output)? {
      let original = input
      guard let (a, b, c, d, e, f) = self.abcdef.parse(&input)
      else { return nil }
      guard let g = self.g.parse(&input)
      else {
        input = original
        return nil
      }
      return (a, b, c, d, e, f, g)
    }
  }

  /// A parser that runs a parser of a tuple of outputs and another parser, one after the other,
  /// and returns a flattened tuple of the first parser's outputs and the second parser's output.
  public struct Take8<ABCDEFG, A, B, C, D, E, F, G, H>: Parser
  where
    ABCDEFG: Parser,
    ABCDEFG.Output == (A, B, C, D, E, F, G),
    H: Parser,
    ABCDEFG.Input == H.Input
  {
    public let abcdefg: ABCDEFG
    public let h: H

    @inlinable
    public init(
      _ abcdefg: ABCDEFG,
      _ h: H
    ) {
      self.abcdefg = abcdefg
      self.h = h
    }

    @inlinable
    public func parse(_ input: inout ABCDEFG.Input) -> (A, B, C, D, E, F, G, H.Output)? {
      let original = input
      guard let (a, b, c, d, e, f, g) = self.abcdefg.parse(&input)
      else { return nil }
      guard let h = self.h.parse(&input)
      else {
        input = original
        return nil
      }
      return (a, b, c, d, e, f, g, h)
    }
  }

  /// A parser that runs a parser of a tuple of outputs and another parser, one after the other,
  /// and returns a flattened tuple of the first parser's outputs and the second parser's output.
  public struct Take9<ABCDEFGH, A, B, C, D, E, F, G, H, I>: Parser
  where
    ABCDEFGH: Parser,
    ABCDEFGH.Output == (A, B, C, D, E, F, G, H),
    I: Parser,
    ABCDEFGH.Input == I.Input
  {
    public let abcdefgh: ABCDEFGH
    public let i: I

    @inlinable
    public init(
      _ abcdefgh: ABCDEFGH,
      _ i: I
    ) {
      self.abcdefgh = abcdefgh
      self.i = i
    }

    @inlinable
    public func parse(_ input: inout ABCDEFGH.Input) -> (A, B, C, D, E, F, G, H, I.Output)? {
      let original = input
      guard let (a, b, c, d, e, f, g, h) = self.abcdefgh.parse(&input)
      else { return nil }
      guard let i = self.i.parse(&input)
      else {
        input = original
        return nil
      }
      return (a, b, c, d, e, f, g, h, i)
    }
  }

  /// A parser that runs a parser of a tuple of outputs and another parser, one after the other,
  /// and returns a flattened tuple of the first parser's outputs and the second parser's output.
  public struct Take10<ABCDEFGHI, A, B, C, D, E, F, G, H, I, J>: Parser
  where
    ABCDEFGHI: Parser,
    ABCDEFGHI.Output == (A, B, C, D, E, F, G, H, I),
    J: Parser,
    ABCDEFGHI.Input == J.Input
  {
    public let abcdefghi: ABCDEFGHI
    public let j: J

    @inlinable
    public init(
      _ abcdefghi: ABCDEFGHI,
      _ j: J
    ) {
      self.abcdefghi = abcdefghi
      self.j = j
    }

    @inlinable
    public func parse(_ input: inout ABCDEFGHI.Input) -> (A, B, C, D, E, F, G, H, I, J.Output)? {
      let original = input
      guard let (a, b, c, d, e, f, g, h, i) = self.abcdefghi.parse(&input)
      else { return nil }
      guard let j = self.j.parse(&input)
      else {
        input = original
        return nil
      }
      return (a, b, c, d, e, f, g, h, i, j)
    }
  }

  /// A parser that runs a parser of a tuple of outputs and another parser, one after the other,
  /// and returns a flattened tuple of the first parser's outputs and the second parser's output.
  public struct Take11<ABCDEFGHIJ, A, B, C, D, E, F, G, H, I, J, K>: Parser
  where
    ABCDEFGHIJ: Parser,
    ABCDEFGHIJ.Output == (A, B, C, D, E, F, G, H, I, J),
    K: Parser,
    ABCDEFGHIJ.Input == K.Input
  {
    public let abcdefghij: ABCDEFGHIJ
    public let k: K

    @inlinable
    public init(
      _ abcdefghij: ABCDEFGHIJ,
      _ k: K
    ) {
      self.abcdefghij = abcdefghij
      self.k = k
    }

    @inlinable
    public func parse(_ input: inout ABCDEFGHIJ.Input) -> (A, B, C, D, E, F, G, H, I, J, K.Output)?
    {
      let original = input
      guard let (a, b, c, d, e, f, g, h, i, j) = self.abcdefghij.parse(&input)
      else { return nil }
      guard let k = self.k.parse(&input)
      else {
        input = original
        return nil
      }
      return (a, b, c, d, e, f, g, h, i, j, k)
    }
  }
}

extension Parsers.Take2: Printer
where
  A: Printer,
  B: Printer,
  Input: Appendable
{
  public func print(_ output: (A.Output, B.Output)) -> A.Input? {
    guard
      var a = self.a.print(output.0),
      let b = self.b.print(output.1)
    else { return nil }

    a.append(contentsOf: b)
    return a
  }
}

extension Parsers.Take3: Printer
where
  AB: Printer,
  C: Printer,
  Input: Appendable
{
  public func print(_ output: (A, B, C.Output)) -> AB.Input? {
    guard
      var ab = self.ab.print((output.0, output.1)),
      let c = self.c.print(output.2)
    else { return nil }

    ab.append(contentsOf: c)
    return ab
  }
}

extension Parsers.Take4: Printer
where
  ABC: Printer,
  D: Printer,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D.Output)) -> ABC.Input? {
    guard
      var abc = self.abc.print((output.0, output.1, output.2)),
      let d = self.d.print(output.3)
    else { return nil }

    abc.append(contentsOf: d)
    return abc
  }
}

extension Parsers.Take5: Printer
where
  ABCD: Printer,
  E: Printer,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D, E.Output)) -> ABCD.Input? {
    guard
      var abcd = self.abcd.print((output.0, output.1, output.2, output.3)),
      let e = self.e.print(output.4)
    else { return nil }

    abcd.append(contentsOf: e)
    return abcd
  }
}

extension Parsers.Take6: Printer
where
  ABCDE: Printer,
  F: Printer,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D, E, F.Output)) -> ABCDE.Input? {
    guard
      var abcde = self.abcde.print((output.0, output.1, output.2, output.3, output.4)),
      let f = self.f.print(output.5)
    else { return nil }

    abcde.append(contentsOf: f)
    return abcde
  }
}

extension Parsers.Take7: Printer
where
  ABCDEF: Printer,
  G: Printer,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D, E, F, G.Output)) -> ABCDEF.Input? {
    guard
      var abcdef = self.abcdef.print((output.0, output.1, output.2, output.3, output.4, output.5)),
      let g = self.g.print(output.6)
    else { return nil }

    abcdef.append(contentsOf: g)
    return abcdef
  }
}

extension Parsers.Take8: Printer
where
  ABCDEFG: Printer,
  H: Printer,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D, E, F, G, H.Output)) -> ABCDEFG.Input? {
    guard
      var abcdefg = self.abcdefg.print(
        (output.0, output.1, output.2, output.3, output.4, output.5, output.6)
      ),
      let h = self.h.print(output.7)
    else { return nil }

    abcdefg.append(contentsOf: h)
    return abcdefg
  }
}

extension Parsers.Take9: Printer
where
  ABCDEFGH: Printer,
  I: Printer,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D, E, F, G, H, I.Output)) -> ABCDEFGH.Input? {
    guard
      var abcdefgh = self.abcdefgh.print(
        (output.0, output.1, output.2, output.3, output.4, output.5, output.6, output.7)
      ),
      let i = self.i.print(output.8)
    else { return nil }

    abcdefgh.append(contentsOf: i)
    return abcdefgh
  }
}

extension Parsers.Take10: Printer
where
  ABCDEFGHI: Printer,
  J: Printer,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D, E, F, G, H, I, J.Output)) -> ABCDEFGHI.Input? {
    guard
      var abcdefghi = self.abcdefghi.print(
        (output.0, output.1, output.2, output.3, output.4, output.5, output.6, output.7, output.8)
      ),
      let j = self.j.print(output.9)
    else { return nil }

    abcdefghi.append(contentsOf: j)
    return abcdefghi
  }
}

extension Parsers.Take11: Printer
where
  ABCDEFGHIJ: Printer,
  K: Printer,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D, E, F, G, H, I, J, K.Output)) -> ABCDEFGHIJ.Input? {
    guard
      var abcdefghij = self.abcdefghij.print((
        output.0,
        output.1,
        output.2,
        output.3,
        output.4,
        output.5,
        output.6,
        output.7,
        output.8,
        output.9
      )),
      let k = self.k.print(output.10)
    else { return nil }

    abcdefghij.append(contentsOf: k)
    return abcdefghij
  }
}

