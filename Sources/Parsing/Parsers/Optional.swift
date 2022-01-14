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
