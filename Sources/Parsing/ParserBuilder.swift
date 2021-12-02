
@resultBuilder
public enum ParserBuilder {
  public static func buildBlock<P0, P1>(
    _ p0: P0,
    _ p1: P1
  )
  -> Parsers.SkipSecond<P0, P1>
  where
  P1.Output == Void
  {
    p0.skip(p1)
  }

  public static func buildBlock<P0, P1, P2>(
    _ p0: P0,
    _ p1: P1,
    _ p2: P2
  )
  -> Parsers.SkipSecond<Parsers.SkipSecond<P0, P1>, P2>
  where
  P1.Output == Void
  {
    p0.skip(p1).skip(p2)
  }

  public static func buildBlock<P0, P1, P2>(
    _ p0: P0,
    _ p1: P1,
    _ p2: P2
  )
  -> Parsers.Take2<Parsers.SkipSecond<P0, P1>, P2>
  where
    P1.Output == Void
  {
    p0.skip(p1).take(p2)
  }

  public static func buildBlock<P0, P1, P2, P3>(
    _ p0: P0,
    _ p1: P1,
    _ p2: P2,
    _ p3: P3
  )
  -> Parsers.Take2<Parsers.SkipSecond<Parsers.SkipSecond<P0, P1>, P2>, P3>
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
}

let tmp = Parse({ $0 + $1 }) {
  Int.parser()
  " "
  Int.parser()
}
//  .map { $0 + $1 }

public struct Parse<Upstream, Output>: Parser where Upstream: Parser {
  let upstream: Upstream
  public let transform: (Upstream.Output) -> Output

  public init(
    _ transform: @escaping (Upstream.Output) -> Output,
    @ParserBuilder build: () -> Upstream
  ) {
    self.transform = transform
    self.upstream = build()
  }

  public func parse(_ input: inout Upstream.Input) -> Output? {
    self.upstream.parse(&input).map(self.transform)
  }
}

extension Parse where Output == Upstream.Output {

  public init(@ParserBuilder build: () -> Upstream) {
    self.init({ $0 }, build: build)
  }
}
