@resultBuilder
public enum ParserBuilder {
  public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0,
    _ p1: P1,
    _ p2: P2,
    _ p3: P3,
    _ p4: P4
  ) -> Parsers.Take3<Parsers.SkipSecond<Parsers.Take2<Parsers.SkipSecond<P0, P1>, P2>, P3>, P0.Output, P2.Output, P4>
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P1.Output == Void,
    P3.Output == Void
  {
    p0.skip(p1).take(p2).skip(p3).take(p4)
  }

  public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0,
    _ p1: P1,
    _ p2: P2,
    _ p3: P3
  ) -> Parsers.Take2<Parsers.SkipSecond<Parsers.SkipSecond<P0, P1>, P2>, P3>
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P1.Output == Void,
    P2.Output == Void
  {
    p0.skip(p1).skip(p2).take(p3)
  }

  public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0,
    _ p1: P1,
    _ p2: P2,
    _ p3: P3
  ) -> Parsers.SkipSecond<Parsers.SkipFirst<Parsers.SkipSecond<Skip<P0>, P1>, P2>, P3>
  where
P0: Parser,
P1: Parser,
P2: Parser,
P3: Parser,
  P0.Output == Void,
  P1.Output == Void,
  P3.Output == Void
  {
    Skip(p0).skip(p1).take(p2).skip(p3)
  }

  public static func buildBlock<P0, P1, P2>(
    _ p0: P0,
    _ p1: P1,
    _ p2: P2
  ) -> Parsers.SkipFirst<Parsers.SkipSecond<Skip<P0>, P1>, P2>
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P0.Output == Void,
    P1.Output == Void
  {
    Skip(p0).skip(p1).take(p2)
  }

  public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0,
    _ p1: P1,
    _ p2: P2,
    _ p3: P3,
    _ p4: P4
  ) -> Parsers.SkipSecond<Parsers.SkipSecond<Parsers.SkipFirst<Parsers.SkipSecond<Skip<P0>, P1>, P2>, P3>, P4>
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P3: Parser,
    P4: Parser,
    P0.Output == Void,
    P1.Output == Void,
    P3.Output == Void,
    P4.Output == Void
  {
    Skip(p0).skip(p1).take(p2).skip(p3).skip(p4)
  }

  public static func buildBlock<P0, P1, P2>(
    _ p0: P0,
    _ p1: P1,
    _ p2: P2
  )
  -> Parsers.Take3<Parsers.Take2<P0, P1>, P0.Output, P1.Output, P2>
  where
    P0: Parser,
    P1: Parser,
    P2: Parser
  {
    p0.take(p1).take(p2)
  }

  public static func buildBlock<P0, P1, P2>(
    _ p0: P0,
    _ p1: P1,
    _ p2: P2
  )
  -> Parsers.SkipSecond<Parsers.SkipSecond<Skip<P0>, P1>, P2>
  where
    P0: Parser,
    P1: Parser,
    P2: Parser,
    P0.Output == Void,
    P1.Output == Void,
    P2.Output == Void
  {
    Skip(p0).skip(p1).skip(p2)
  }

  public static func buildBlock<P0, P1, P2>(
    _ p0: P0,
    _ p1: P1,
    _ p2: P2
  )
  -> Parsers.Take2<Parsers.SkipSecond<P0, P1>, P2>
  where
    P0: Parser,
    P1: Parser,
    P2: Parser
  {
    p0.skip(p1).take(p2)
  }

  public static func buildBlock<P0, P1>(
    _ p0: P0,
    _ p1: P1
  )
  -> Parsers.Take2<P0, P1>
  where
    P0: Parser,
    P1: Parser
  {
    p0.take(p1)
  }

  public static func buildBlock<P0, P1>(
    _ p0: P0,
    _ p1: P1
  )
  -> Parsers.SkipSecond<Skip<P0>, P1>
  where
    P0: Parser,
    P1: Parser,
    P0.Output == Void,
    P1.Output == Void
  {
    Skip(p0).skip(p1)
  }

  public static func buildBlock<P0>(
    _ p0: P0
  )
  -> P0
  where
    P0: Parser
  {
    p0
  }
}

@resultBuilder
public enum OneOfBuilder {
  public static func buildBlock<P0, P1, P2>(
    _ p0: P0,
    _ p1: P1,
    _ p2: P2
  )
  -> Parsers.OneOf<Parsers.OneOf<P0, P1>, P2>
  {
    p0.orElse(p1).orElse(p2)
  }

  public static func buildBlock<P0, P1, P2, P3, P4>(
    _ p0: P0,
    _ p1: P1,
    _ p2: P2,
    _ p3: P3,
    _ p4: P4
  )
  -> Parsers.OneOf<Parsers.OneOf<Parsers.OneOf<Parsers.OneOf<P0, P1>, P2>, P3>, P4>
  {
    p0.orElse(p1).orElse(p2).orElse(p3).orElse(p4)
  }
}

extension OneOfBuilder {
  public static func buildBlock<P0, P1>(
    _ p0: P0,
    _ p1: P1
  )
  -> Parsers.OneOf<P0, P1>
  {
    p0.orElse(p1)
  }
}

public struct Parse<Upstream>: Parser where Upstream: Parser {
  public let upstream: Upstream
  public init(@ParserBuilder build: () -> Upstream) {
    self.upstream = build()
  }
  public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
    self.upstream.parse(&input)
  }
}

extension Parse {
  public init<Other, Output>(
    _ transform: @escaping (Other.Output) -> Output,
    @ParserBuilder other: () -> Other
  )
  where Upstream == Parsers.Map<Other, Output>
  {
    self.upstream = other().map(transform)
  }

  public init<Other, Output>(
    _ output: Output,
    @ParserBuilder other: () -> Other
  )
  where
    Upstream == Parsers.Map<Other, Output>,
    Other.Output == Void
  {
    self.upstream = other().map { output }
  }
}

extension Many where Result == [Upstream.Output] {
  public init(
  @ParserBuilder upstream: () -> Upstream,
  @ParserBuilder separatedBy separator: () -> Separator
  ) {
    self.init(upstream(), separator: separator())
  }
}

extension Parsers.OneOf {
  public init(@OneOfBuilder build: () -> Self) {
    self = build()
  }
}

public typealias OneOf = Parsers.OneOf
