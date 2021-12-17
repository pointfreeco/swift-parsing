/// A parser that runs a sequence of 2 parsers separated from each other by another `Separator`
/// parser, and returns a flattened tuple of outputs of the 2 parsers when all 2 parsers did
/// succeed to parse the input.
///
/// This parser produces the same result as:
/// ```
/// parser1
///   .skip(separator)
///   .take(parser2)
/// ```
public struct Separated2<A, B, Separator>: Parser
  where
  A: Parser,
  B: Parser,
  A.Input == B.Input,
  Separator: Parser,
  A.Input == Separator.Input
{
  public let a: A
  public let b: B
  public let separator: Separator

  @inlinable
  public init(_ a: A, _ b: B,
       separator: Separator) {
    self.a = a
    self.b = b
    self.separator = separator
  }

  @inlinable
  public func parse(_ input: inout Separator.Input)
    -> (A.Output, B.Output)? {
    a
      .skip(separator)
      .take(b)
      .parse(&input)
  }
}

/// A parser that runs a sequence of 3 parsers separated from each other by another `Separator`
/// parser, and returns a flattened tuple of outputs of the 3 parsers when all 3 parsers did
/// succeed to parse the input.
///
/// This parser produces the same result as:
/// ```
/// parser1
///   .skip(separator)
///   .take(parser2)
///   .skip(separator)
///   .take(parser3)
/// ```
public struct Separated3<A, B, C, Separator>: Parser
  where
  A: Parser,
  B: Parser,
  C: Parser,
  A.Input == B.Input,
  A.Input == C.Input,
  Separator: Parser,
  A.Input == Separator.Input
{
  public let a: A
  public let b: B
  public let c: C
  public let separator: Separator

  @inlinable
  public init(_ a: A, _ b: B, _ c: C,
       separator: Separator) {
    self.a = a
    self.b = b
    self.c = c
    self.separator = separator
  }

  @inlinable
  public func parse(_ input: inout Separator.Input)
    -> (A.Output, B.Output, C.Output)? {
    a
      .skip(separator)
      .take(b)
      .skip(separator)
      .take(c)
      .parse(&input)
  }
}

/// A parser that runs a sequence of 4 parsers separated from each other by another `Separator`
/// parser, and returns a flattened tuple of outputs of the 4 parsers when all 4 parsers did
/// succeed to parse the input.
///
/// This parser produces the same result as:
/// ```
/// parser1
///   .skip(separator)
///   .take(parser2)
///   .skip(separator)
///   .take(parser3)
///   …
/// ```
public struct Separated4<A, B, C, D, Separator>: Parser
  where
  A: Parser,
  B: Parser,
  C: Parser,
  D: Parser,
  A.Input == B.Input,
  A.Input == C.Input,
  A.Input == D.Input,
  Separator: Parser,
  A.Input == Separator.Input
{
  public let a: A
  public let b: B
  public let c: C
  public let d: D
  public let separator: Separator

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D,
       separator: Separator) {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.separator = separator
  }

  @inlinable
  public func parse(_ input: inout Separator.Input)
    -> (A.Output, B.Output, C.Output, D.Output)? {
    a
      .skip(separator)
      .take(b)
      .skip(separator)
      .take(c)
      .skip(separator)
      .take(d)
      .parse(&input)
  }
}

/// A parser that runs a sequence of 5 parsers separated from each other by another `Separator`
/// parser, and returns a flattened tuple of outputs of the 5 parsers when all 5 parsers did
/// succeed to parse the input.
///
/// This parser produces the same result as:
/// ```
/// parser1
///   .skip(separator)
///   .take(parser2)
///   .skip(separator)
///   .take(parser3)
///   …
/// ```
public struct Separated5<A, B, C, D, E, Separator>: Parser
  where
  A: Parser,
  B: Parser,
  C: Parser,
  D: Parser,
  E: Parser,
  A.Input == B.Input,
  A.Input == C.Input,
  A.Input == D.Input,
  A.Input == E.Input,
  Separator: Parser,
  A.Input == Separator.Input
{
  public let a: A
  public let b: B
  public let c: C
  public let d: D
  public let e: E
  public let separator: Separator

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E,
       separator: Separator) {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
    self.separator = separator
  }

  @inlinable
  public func parse(_ input: inout Separator.Input)
    -> (A.Output, B.Output, C.Output, D.Output, E.Output)? {
    a
      .skip(separator)
      .take(b)
      .skip(separator)
      .take(c)
      .skip(separator)
      .take(d)
      .skip(separator)
      .take(e)
      .parse(&input)
  }
}

/// A parser that runs a sequence of 6 parsers separated from each other by another `Separator`
/// parser, and returns a flattened tuple of outputs of the 6 parsers when all 6 parsers did
/// succeed to parse the input.
///
/// This parser produces the same result as:
/// ```
/// parser1
///   .skip(separator)
///   .take(parser2)
///   .skip(separator)
///   .take(parser3)
///   …
/// ```
public struct Separated6<A, B, C, D, E, F, Separator>: Parser
  where
  A: Parser,
  B: Parser,
  C: Parser,
  D: Parser,
  E: Parser,
  F: Parser,
  A.Input == B.Input,
  A.Input == C.Input,
  A.Input == D.Input,
  A.Input == E.Input,
  A.Input == F.Input,
  Separator: Parser,
  A.Input == Separator.Input
{
  public let a: A
  public let b: B
  public let c: C
  public let d: D
  public let e: E
  public let f: F
  public let separator: Separator

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F,
       separator: Separator) {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
    self.f = f
    self.separator = separator
  }

  @inlinable
  public func parse(_ input: inout Separator.Input)
    -> (A.Output, B.Output, C.Output, D.Output, E.Output, F.Output)? {
    a
      .skip(separator)
      .take(b)
      .skip(separator)
      .take(c)
      .skip(separator)
      .take(d)
      .skip(separator)
      .take(e)
      .skip(separator)
      .take(f)
      .parse(&input)
  }
}

/// A parser that runs a sequence of 7 parsers separated from each other by another `Separator`
/// parser, and returns a flattened tuple of outputs of the 7 parsers when all 7 parsers did
/// succeed to parse the input.
///
/// This parser produces the same result as:
/// ```
/// parser1
///   .skip(separator)
///   .take(parser2)
///   .skip(separator)
///   .take(parser3)
///   …
/// ```
public struct Separated7<A, B, C, D, E, F, G, Separator>: Parser
  where
  A: Parser,
  B: Parser,
  C: Parser,
  D: Parser,
  E: Parser,
  F: Parser,
  G: Parser,
  A.Input == B.Input,
  A.Input == C.Input,
  A.Input == D.Input,
  A.Input == E.Input,
  A.Input == F.Input,
  A.Input == G.Input,
  Separator: Parser,
  A.Input == Separator.Input
{
  public let a: A
  public let b: B
  public let c: C
  public let d: D
  public let e: E
  public let f: F
  public let g: G
  public let separator: Separator

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G,
       separator: Separator) {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
    self.f = f
    self.g = g
    self.separator = separator
  }

  @inlinable
  public func parse(_ input: inout Separator.Input)
    -> (A.Output, B.Output, C.Output, D.Output, E.Output, F.Output, G.Output)? {
    a
      .skip(separator)
      .take(b)
      .skip(separator)
      .take(c)
      .skip(separator)
      .take(d)
      .skip(separator)
      .take(e)
      .skip(separator)
      .take(f)
      .skip(separator)
      .take(g)
      .parse(&input)
  }
}

/// A parser that runs a sequence of 8 parsers separated from each other by another `Separator`
/// parser, and returns a flattened tuple of outputs of the 8 parsers when all 8 parsers did
/// succeed to parse the input.
///
/// This parser produces the same result as:
/// ```
/// parser1
///   .skip(separator)
///   .take(parser2)
///   .skip(separator)
///   .take(parser3)
///   …
/// ```
public struct Separated8<A, B, C, D, E, F, G, H, Separator>: Parser
  where
  A: Parser,
  B: Parser,
  C: Parser,
  D: Parser,
  E: Parser,
  F: Parser,
  G: Parser,
  H: Parser,
  A.Input == B.Input,
  A.Input == C.Input,
  A.Input == D.Input,
  A.Input == E.Input,
  A.Input == F.Input,
  A.Input == G.Input,
  A.Input == H.Input,
  Separator: Parser,
  A.Input == Separator.Input
{
  public let a: A
  public let b: B
  public let c: C
  public let d: D
  public let e: E
  public let f: F
  public let g: G
  public let h: H
  public let separator: Separator

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H,
       separator: Separator) {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
    self.f = f
    self.g = g
    self.h = h
    self.separator = separator
  }

  @inlinable
  public func parse(_ input: inout Separator.Input)
    -> (A.Output, B.Output, C.Output, D.Output, E.Output, F.Output, G.Output, H.Output)? {
    a
      .skip(separator)
      .take(b)
      .skip(separator)
      .take(c)
      .skip(separator)
      .take(d)
      .skip(separator)
      .take(e)
      .skip(separator)
      .take(f)
      .skip(separator)
      .take(g)
      .skip(separator)
      .take(h)
      .parse(&input)
  }
}

/// A parser that runs a sequence of 9 parsers separated from each other by another `Separator`
/// parser, and returns a flattened tuple of outputs of the 9 parsers when all 9 parsers did
/// succeed to parse the input.
///
/// This parser produces the same result as:
/// ```
/// parser1
///   .skip(separator)
///   .take(parser2)
///   .skip(separator)
///   .take(parser3)
///   …
/// ```
public struct Separated9<A, B, C, D, E, F, G, H, I, Separator>: Parser
  where
  A: Parser,
  B: Parser,
  C: Parser,
  D: Parser,
  E: Parser,
  F: Parser,
  G: Parser,
  H: Parser,
  I: Parser,
  A.Input == B.Input,
  A.Input == C.Input,
  A.Input == D.Input,
  A.Input == E.Input,
  A.Input == F.Input,
  A.Input == G.Input,
  A.Input == H.Input,
  A.Input == I.Input,
  Separator: Parser,
  A.Input == Separator.Input
{
  public let a: A
  public let b: B
  public let c: C
  public let d: D
  public let e: E
  public let f: F
  public let g: G
  public let h: H
  public let i: I
  public let separator: Separator

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I,
       separator: Separator) {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
    self.f = f
    self.g = g
    self.h = h
    self.i = i
    self.separator = separator
  }

  @inlinable
  public func parse(_ input: inout Separator.Input)
    -> (A.Output, B.Output, C.Output, D.Output, E.Output, F.Output, G.Output, H.Output, I.Output)? {
    a
      .skip(separator)
      .take(b)
      .skip(separator)
      .take(c)
      .skip(separator)
      .take(d)
      .skip(separator)
      .take(e)
      .skip(separator)
      .take(f)
      .skip(separator)
      .take(g)
      .skip(separator)
      .take(h)
      .skip(separator)
      .take(i)
      .parse(&input)
  }
}

/// A parser that runs a sequence of 10 parsers separated from each other by another `Separator`
/// parser, and returns a flattened tuple of outputs of the 10 parsers when all 10 parsers did
/// succeed to parse the input.
///
/// This parser produces the same result as:
/// ```
/// parser1
///   .skip(separator)
///   .take(parser2)
///   .skip(separator)
///   .take(parser3)
///   …
/// ```
public struct Separated10<A, B, C, D, E, F, G, H, I, J, Separator>: Parser
  where
  A: Parser,
  B: Parser,
  C: Parser,
  D: Parser,
  E: Parser,
  F: Parser,
  G: Parser,
  H: Parser,
  I: Parser,
  J: Parser,
  A.Input == B.Input,
  A.Input == C.Input,
  A.Input == D.Input,
  A.Input == E.Input,
  A.Input == F.Input,
  A.Input == G.Input,
  A.Input == H.Input,
  A.Input == I.Input,
  A.Input == J.Input,
  Separator: Parser,
  A.Input == Separator.Input
{
  public let a: A
  public let b: B
  public let c: C
  public let d: D
  public let e: E
  public let f: F
  public let g: G
  public let h: H
  public let i: I
  public let j: J
  public let separator: Separator

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J,
       separator: Separator) {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
    self.f = f
    self.g = g
    self.h = h
    self.i = i
    self.j = j
    self.separator = separator
  }

  @inlinable
  public func parse(_ input: inout Separator.Input)
    -> (A.Output, B.Output, C.Output, D.Output, E.Output, F.Output, G.Output, H.Output, I.Output, J.Output)?
  {
    a
      .skip(separator)
      .take(b)
      .skip(separator)
      .take(c)
      .skip(separator)
      .take(d)
      .skip(separator)
      .take(e)
      .skip(separator)
      .take(f)
      .skip(separator)
      .take(g)
      .skip(separator)
      .take(h)
      .skip(separator)
      .take(i)
      .skip(separator)
      .take(j)
      .parse(&input)
  }
}

/// A parser that runs a sequence of 11 parsers separated from each other by another `Separator`
/// parser, and returns a flattened tuple of outputs of the 11 parsers when all 11 parsers did
/// succeed to parse the input.
///
/// This parser produces the same result as:
/// ```
/// parser1
///   .skip(separator)
///   .take(parser2)
///   .skip(separator)
///   .take(parser3)
///   …
/// ```
public struct Separated11<A, B, C, D, E, F, G, H, I, J, K, Separator>: Parser
  where
  A: Parser,
  B: Parser,
  C: Parser,
  D: Parser,
  E: Parser,
  F: Parser,
  G: Parser,
  H: Parser,
  I: Parser,
  J: Parser,
  K: Parser,
  A.Input == B.Input,
  A.Input == C.Input,
  A.Input == D.Input,
  A.Input == E.Input,
  A.Input == F.Input,
  A.Input == G.Input,
  A.Input == H.Input,
  A.Input == I.Input,
  A.Input == J.Input,
  A.Input == K.Input,
  Separator: Parser,
  A.Input == Separator.Input
{
  public let a: A
  public let b: B
  public let c: C
  public let d: D
  public let e: E
  public let f: F
  public let g: G
  public let h: H
  public let i: I
  public let j: J
  public let k: K
  public let separator: Separator

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K,
       separator: Separator) {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
    self.f = f
    self.g = g
    self.h = h
    self.i = i
    self.j = j
    self.k = k
    self.separator = separator
  }

  @inlinable
  public func parse(_ input: inout Separator.Input)
    -> (A.Output, B.Output, C.Output, D.Output, E.Output, F.Output, G.Output, H.Output, I.Output, J.Output, K.Output)?
  {
    a
      .skip(separator)
      .take(b)
      .skip(separator)
      .take(c)
      .skip(separator)
      .take(d)
      .skip(separator)
      .take(e)
      .skip(separator)
      .take(f)
      .skip(separator)
      .take(g)
      .skip(separator)
      .take(h)
      .skip(separator)
      .take(i)
      .skip(separator)
      .take(j)
      .skip(separator)
      .take(k)
      .parse(&input)
  }
}
