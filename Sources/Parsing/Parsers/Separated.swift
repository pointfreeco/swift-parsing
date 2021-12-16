import Foundation
struct Separated<Separator, Downstream>: Parser where Separator: Parser, Downstream: Parser, Separator.Input == Downstream.Input {
  public let downstream: Downstream

  @inlinable
  func parse(_ input: inout Separator.Input) -> Downstream.Output? {
    downstream.parse(&input)
  }
}

extension Separated {
  @inlinable
  public init<A, B>(
    by separator: Separator,
    @SeparatedParsersBuilder<Separator.Input> parsers: () -> (A, B)
  )
    where Downstream == Separated2<A, B, Separator>
  {
    let parsers = parsers()
    downstream = Separated2(parsers.0, parsers.1, separator: separator)
  }

  @inlinable
  public init<A, B, C>(
    by separator: Separator,
    @SeparatedParsersBuilder<Separator.Input> parsers: () -> (A, B, C)
  )
    where Downstream == Separated3<A, B, C, Separator>
  {
    let parsers = parsers()
    downstream = Separated3(parsers.0, parsers.1, parsers.2, separator: separator)
  }

  @inlinable
  public init<A, B, C, D>(
    by separator: Separator,
    @SeparatedParsersBuilder<Separator.Input> parsers: () -> (A, B, C, D)
  )
    where Downstream == Separated4<A, B, C, D, Separator>
  {
    let parsers = parsers()
    downstream = Separated4(parsers.0, parsers.1, parsers.2, parsers.3, separator: separator)
  }

  @inlinable
  public init<A, B, C, D, E>(
    by separator: Separator,
    @SeparatedParsersBuilder<Separator.Input> parsers: () -> (A, B, C, D, E)
  )
    where Downstream == Separated5<A, B, C, D, E, Separator>
  {
    let parsers = parsers()
    downstream = Separated5(parsers.0, parsers.1, parsers.2, parsers.3, parsers.4, separator: separator)
  }

  @inlinable
  public init<A, B, C, D, E, F>(
    by separator: Separator,
    @SeparatedParsersBuilder<Separator.Input> parsers: () -> (A, B, C, D, E, F)
  )
    where Downstream == Separated6<A, B, C, D, E, F, Separator>
  {
    let parsers = parsers()
    downstream = Separated6(parsers.0, parsers.1, parsers.2, parsers.3, parsers.4, parsers.5, separator: separator)
  }

  @inlinable
  public init<A, B, C, D, E, F, G>(
    by separator: Separator,
    @SeparatedParsersBuilder<Separator.Input> parsers: () -> (A, B, C, D, E, F, G)
  )
    where Downstream == Separated7<A, B, C, D, E, F, G, Separator>
  {
    let parsers = parsers()
    downstream = Separated7(parsers.0, parsers.1, parsers.2, parsers.3, parsers.4, parsers.5, parsers.6, separator: separator)
  }

  @inlinable
  public init<A, B, C, D, E, F, G, H>(
    by separator: Separator,
    @SeparatedParsersBuilder<Separator.Input> parsers: () -> (A, B, C, D, E, F, G, H)
  )
    where Downstream == Separated8<A, B, C, D, E, F, G, H, Separator>
  {
    let parsers = parsers()
    downstream = Separated8(parsers.0, parsers.1, parsers.2, parsers.3, parsers.4, parsers.5, parsers.6, parsers.7, separator: separator)
  }

  @inlinable
  public init<A, B, C, D, E, F, G, H, I>(
    by separator: Separator,
    @SeparatedParsersBuilder<Separator.Input> parsers: () -> (A, B, C, D, E, F, G, H, I)
  )
    where Downstream == Separated9<A, B, C, D, E, F, G, H, I, Separator>
  {
    let parsers = parsers()
    downstream = Separated9(parsers.0, parsers.1, parsers.2, parsers.3, parsers.4, parsers.5, parsers.6, parsers.7, parsers.8, separator: separator)
  }

  @inlinable
  public init<A, B, C, D, E, F, G, H, I, J>(
    by separator: Separator,
    @SeparatedParsersBuilder<Separator.Input> parsers: () -> (A, B, C, D, E, F, G, H, I, J)
  )
    where Downstream == Separated10<A, B, C, D, E, F, G, H, I, J, Separator>
  {
    let parsers = parsers()
    downstream = Separated10(parsers.0, parsers.1, parsers.2, parsers.3, parsers.4, parsers.5, parsers.6, parsers.7, parsers.8, parsers.9, separator: separator)
  }

  @inlinable
  public init<A, B, C, D, E, F, G, H, I, J, K>(
    by separator: Separator,
    @SeparatedParsersBuilder<Separator.Input> parsers: () -> (A, B, C, D, E, F, G, H, I, J, K)
  )
    where Downstream == Separated11<A, B, C, D, E, F, G, H, I, J, K, Separator>
  {
    let parsers = parsers()
    downstream = Separated11(parsers.0, parsers.1, parsers.2, parsers.3, parsers.4, parsers.5, parsers.6, parsers.7, parsers.8, parsers.9, parsers.10, separator: separator)
  }
}

@resultBuilder
public enum SeparatedParsersBuilder<Input> {
  public static func buildBlock<A, B>(_ a: A, _ b: B)
    -> (A, B)
    where
    A: Parser,
    B: Parser,
    A.Input == Input,
    A.Input == B.Input
  {
    (a, b)
  }

  public static func buildBlock<A, B, C>(_ a: A, _ b: B, _ c: C)
    -> (A, B, C)
    where
    A: Parser,
    B: Parser,
    C: Parser,
    A.Input == Input,
    A.Input == B.Input,
    A.Input == C.Input
  {
    (a, b, c)
  }

  public static func buildBlock<A, B, C, D>(_ a: A, _ b: B, _ c: C, _ d: D)
    -> (A, B, C, D)
    where
    A: Parser,
    B: Parser,
    C: Parser,
    D: Parser,
    A.Input == Input,
    A.Input == B.Input,
    A.Input == C.Input,
    A.Input == D.Input
  {
    (a, b, c, d)
  }

  public static func buildBlock<A, B, C, D, E>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E)
    -> (A, B, C, D, E)
    where
    A: Parser,
    B: Parser,
    C: Parser,
    D: Parser,
    E: Parser,
    A.Input == Input,
    A.Input == B.Input,
    A.Input == C.Input,
    A.Input == D.Input,
    A.Input == E.Input
  {
    (a, b, c, d, e)
  }

  public static func buildBlock<A, B, C, D, E, F>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F)
    -> (A, B, C, D, E, F)
    where
    A: Parser,
    B: Parser,
    C: Parser,
    D: Parser,
    E: Parser,
    F: Parser,
    A.Input == Input,
    A.Input == B.Input,
    A.Input == C.Input,
    A.Input == D.Input,
    A.Input == E.Input,
    A.Input == F.Input
  {
    (a, b, c, d, e, f)
  }

  public static func buildBlock<A, B, C, D, E, F, G>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G)
    -> (A, B, C, D, E, F, G)
    where
    A: Parser,
    B: Parser,
    C: Parser,
    D: Parser,
    E: Parser,
    F: Parser,
    G: Parser,
    A.Input == Input,
    A.Input == B.Input,
    A.Input == C.Input,
    A.Input == D.Input,
    A.Input == E.Input,
    A.Input == F.Input,
    A.Input == G.Input
  {
    (a, b, c, d, e, f, g)
  }

  public static func buildBlock<A, B, C, D, E, F, G, H>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H)
    -> (A, B, C, D, E, F, G, H)
    where
    A: Parser,
    B: Parser,
    C: Parser,
    D: Parser,
    E: Parser,
    F: Parser,
    G: Parser,
    H: Parser,
    A.Input == Input,
    A.Input == B.Input,
    A.Input == C.Input,
    A.Input == D.Input,
    A.Input == E.Input,
    A.Input == F.Input,
    A.Input == G.Input,
    A.Input == H.Input
  {
    (a, b, c, d, e, f, g, h)
  }

  public static func buildBlock<A, B, C, D, E, F, G, H, I>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I)
    -> (A, B, C, D, E, F, G, H, I)
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
    A.Input == Input,
    A.Input == B.Input,
    A.Input == C.Input,
    A.Input == D.Input,
    A.Input == E.Input,
    A.Input == F.Input,
    A.Input == G.Input,
    A.Input == H.Input,
    A.Input == I.Input
  {
    (a, b, c, d, e, f, g, h, i)
  }

  public static func buildBlock<A, B, C, D, E, F, G, H, I, J>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J)
    -> (A, B, C, D, E, F, G, H, I, J)
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
    A.Input == Input,
    A.Input == B.Input,
    A.Input == C.Input,
    A.Input == D.Input,
    A.Input == E.Input,
    A.Input == F.Input,
    A.Input == G.Input,
    A.Input == H.Input,
    A.Input == I.Input,
    A.Input == J.Input
  {
    (a, b, c, d, e, f, g, h, i, j)
  }

  public static func buildBlock<A, B, C, D, E, F, G, H, I, J, K>(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K)
    -> (A, B, C, D, E, F, G, H, I, J, K)
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
    A.Input == Input,
    A.Input == B.Input,
    A.Input == C.Input,
    A.Input == D.Input,
    A.Input == E.Input,
    A.Input == F.Input,
    A.Input == G.Input,
    A.Input == H.Input,
    A.Input == I.Input,
    A.Input == J.Input,
    A.Input == K.Input
  {
    (a, b, c, d, e, f, g, h, i, j, k)
  }
}

func test() {
  let x = Separated(by: CharacterSet.decimalDigits) {
    CharacterSet.symbols
    CharacterSet.symbols
    CharacterSet.symbols
  }
}

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
  init(_ a: A, _ b: B,
       separator: Separator)
  {
    self.a = a
    self.b = b
    self.separator = separator
  }

  @inlinable
  public func parse(_ input: inout Separator.Input)
    -> (A.Output, B.Output)?
  {
    a
      .skip(separator)
      .take(b)
      .parse(&input)
  }
}

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
  init(_ a: A, _ b: B, _ c: C,
       separator: Separator)
  {
    self.a = a
    self.b = b
    self.c = c
    self.separator = separator
  }

  @inlinable
  public func parse(_ input: inout Separator.Input)
    -> (A.Output, B.Output, C.Output)?
  {
    a
      .skip(separator)
      .take(b)
      .skip(separator)
      .take(c)
      .parse(&input)
  }
}

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
  init(_ a: A, _ b: B, _ c: C, _ d: D,
       separator: Separator)
  {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.separator = separator
  }

  @inlinable
  public func parse(_ input: inout Separator.Input)
    -> (A.Output, B.Output, C.Output, D.Output)?
  {
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
  init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E,
       separator: Separator)
  {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
    self.separator = separator
  }

  @inlinable
  public func parse(_ input: inout Separator.Input)
    -> (A.Output, B.Output, C.Output, D.Output, E.Output)?
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
      .parse(&input)
  }
}

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
  init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F,
       separator: Separator)
  {
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
    -> (A.Output, B.Output, C.Output, D.Output, E.Output, F.Output)?
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
      .parse(&input)
  }
}

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
  init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G,
       separator: Separator)
  {
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
    -> (A.Output, B.Output, C.Output, D.Output, E.Output, F.Output, G.Output)?
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
      .parse(&input)
  }
}

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
  init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H,
       separator: Separator)
  {
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
    -> (A.Output, B.Output, C.Output, D.Output, E.Output, F.Output, G.Output, H.Output)?
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
      .parse(&input)
  }
}

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
  init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I,
       separator: Separator)
  {
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
    -> (A.Output, B.Output, C.Output, D.Output, E.Output, F.Output, G.Output, H.Output, I.Output)?
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
      .parse(&input)
  }
}

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
  init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J,
       separator: Separator)
  {
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
  init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K,
       separator: Separator)
  {
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
