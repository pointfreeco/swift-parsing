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

public func build<P: Parser>(@ParserBuilder build: () -> P) -> P {
  build()
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
  let x = build {
    _OneOf {
      Int.parser(of: Substring.self)
      Int.parser()
    }
    Bool.parser()
  }
}
