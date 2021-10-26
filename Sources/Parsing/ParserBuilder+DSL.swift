extension ParserBuilder {
  public static func buildBlock<T0, T1>(
    _ x0: T0, _ x1: T1
  ) -> Parsers.Take2<T0, T1> {
    Parsers.Take2(x0, x1)
  }

  public static func buildBlock<T0, T1>(
    _ x0: T0, _ x1: T1
  ) -> Parsers.SkipFirst<T0, T1>
  where T0.Output == Void {
    Parsers.SkipFirst(x0, x1)
  }

  public static func buildBlock<T0, T1>(
    _ x0: T0, _ x1: T1
  ) -> Parsers.SkipSecond<T0, T1>
  where T1.Output == Void {
    Parsers.SkipSecond(x0, x1)
  }

  public static func buildBlock<T0, T1, T2>(
    _ x0: T0, _ x1: T1, _ x2: T2
  ) -> Zip3<T0, T1, T2> {
    Zip3(x0, x1, x2)
  }

  public static func buildBlock<T0, T1, T2>(
    _ x0: T0, _ x1: T1, _ x2: T2
  ) -> Parsers.Map<Zip3<T0, T1, T2>, (T0.Output, T2.Output)>
  where T1.Output == Void {
    Zip3(x0, x1, x2).map { x0, x1, x2 in (x0, x2) }
  }

  public static func buildBlock<T0, T1, T2, T3>(
    _ x0: T0, _ x1: T1, _ x2: T2, _ x3: T3
  ) -> Parsers.Map<Zip4<T0, T1, T2, T3>, (T1.Output, T2.Output, T3.Output)>
  where T0.Output == Void {
    Zip4(x0, x1, x2, x3).map { _, x1, x2, x3 in (x1, x2, x3) }
  }
}

public struct Zip3<A, B, C>: Parser
where A: Parser, B: Parser, C: Parser, A.Input == B.Input, A.Input == C.Input
{
  let a: A
  let b: B
  let c: C

  public init(_ a: A, _ b: B, _ c: C) {
    self.a = a
    self.b = b
    self.c = c
  }

  public func parse(_ input: inout A.Input) -> (A.Output, B.Output, C.Output)? {
    let original = input
    guard
      let a = self.a.parse(&input),
      let b = self.b.parse(&input),
      let c = self.c.parse(&input)
    else {
      input = original
      return nil
    }
    return (a, b, c)
  }
}

public struct Zip4<A, B, C, D>: Parser
where A: Parser, B: Parser, C: Parser, D: Parser, A.Input == B.Input, A.Input == C.Input, A.Input == D.Input
{
  let a: A
  let b: B
  let c: C
  let d: D

  public init(_ a: A, _ b: B, _ c: C, _ d: D) {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
  }

  public func parse(_ input: inout A.Input) -> (A.Output, B.Output, C.Output, D.Output)? {
    let original = input
    guard
      let a = self.a.parse(&input),
      let b = self.b.parse(&input),
      let c = self.c.parse(&input),
      let d = self.d.parse(&input)
    else {
      input = original
      return nil
    }
    return (a, b, c, d)
  }
}
