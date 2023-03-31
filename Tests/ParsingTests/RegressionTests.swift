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
