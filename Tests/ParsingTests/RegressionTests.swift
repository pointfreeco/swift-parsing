import Parsing

// https://github.com/pointfreeco/swift-parsing/discussions/290#discussioncomment-5439338
enum ValueOrEmpty {
  case value(Double)
  case empty

  static func parser() -> some Parser<Substring, Self> {
    OneOf {
      Double.parser().map(Self.value)
      "".map { .empty }
    }
  }
}

// https://github.com/pointfreeco/swift-url-routing/discussions/120#discussioncomment-18238093
#if CasePaths
  import CasePaths

  @CasePathable
  enum FooRoute {
    case index
    case book(Int)
  }

  struct IndexRouter: ParserPrinter {
    var body: some ParserPrinter<Substring, FooRoute> {
      ParsePrint(.case(\FooRoute.Cases.index)) { "index" }
    }
  }

  struct BookRouter: ParserPrinter {
    var body: some ParserPrinter<Substring, FooRoute> {
      ParsePrint(.case(\FooRoute.Cases.book)) { Int.parser() }
    }
  }
#endif
