@resultBuilder
public enum ParserBuilder {
  public static func buildBlock<P0: Parser>(_ r0: P0) -> P0 {
    r0
  }

  public static func buildEither<P: Parser>(first component: P) -> P {
    component
  }

  public static func buildEither<P: Parser>(second component: P) -> P {
    component
  }

//  public static func buildEither<P0: Parser, P1: Parser>(first component: P0) -> Conditional<P0, P1>
//  where P0.Input == P1.Input {
//    Conditional.first(component)
//  }
//
//  public static func buildEither<P0: Parser, P1: Parser>(second component: P1) -> Conditional<P0, P1>
//  where P0.Input == P1.Input {
//    Conditional.second(component)
//  }

  public static func buildLimitedAvailability<P: Parser>(_ component: P) -> Parsers.OptionalParser<P> {
    .init(component)
  }

  public static func buildBlock<P0: Parser, P1: Parser>(
    _ p0: P0, _ p1: P1
  ) -> OneOf<P0, P1> {
    .init(p0, p1)
  }

  public static func buildBlock<P0: Parser, P1: Parser, P2: Parser>(
    _ p0: P0, _ p1: P1, _ p2: P2
  ) -> OneOf3<P0, P1, P2> {
    .init(p0, p1, p2)
  }
}

extension Parser {
  init(@ParserBuilder build: () -> Self) {
    self = build()
  }
}

public struct Parse<Upstream: Parser>: Parser {
  public let upstream: Upstream

  init(@ParserBuilder build: () -> Upstream) {
    self.upstream = build()
  }

  public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
    self.upstream.parse(&input)
  }
}

func f() {
  let x = Int.parser(of: Substring.self)
  let y = x.flatMap(build: {
    if $0 > 10 {
      Int.parser()
    } else {
      Int.parser()
    }
  })

  "hello"
    .orElse("world")
    .orElse("or not")

  _OneOf {
    "hello"
    "world"
    "or not"
  }

  let m = Parse {
    Optionally {
      "hello"
    } // -> Match(matched(Value)|missed)
    .ignoreOutput()
    "world"

    Parsers.Pipe {
      Prefix<Substring>(2)
    } into: {
      UInt8.parser(isSigned: false, radix: 16)
      End<Substring>()
    }
  }

//  let x = build {
//    _OneOf {
//      Int.parser(of: Substring.self)
//      Int.parser()
//    }
//    Bool.parser()
//  }

//  let hexPrimary = Prefix<Input>(2)
//    .pipe {
//      UInt8.parser(isSigned: false, radix: 16)
//      End<Input>()
//    }
//
//  let hexColor = build {
//    "#"
//    hexPrimary
//    hexPrimary
//    hexPrimary
//  }

}
