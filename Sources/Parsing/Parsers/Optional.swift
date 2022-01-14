extension Optional: Parser where Wrapped: Parser {
  public func parse(_ input: inout Wrapped.Input) -> Wrapped.Output?? {
    switch self {
    case let .some(parser):
      guard let output = parser.parse(&input)
      else { return .none }
      return output
    case .none:
      return .some(nil)
    }
  }
}

extension Parsers {
  public struct OptionalVoid<Wrapped>: Parser where Wrapped: Parser, Wrapped.Output == Void {
    let wrapped: Wrapped?

    public init(upstream: Wrapped?) {
      self.wrapped = upstream
    }

    public func parse(_ input: inout Wrapped.Input) -> Void? {
      switch self.wrapped {
      case let .some(parser):
        return parser.parse(&input)
      case .none:
        return ()
      }
    }
  }
}
