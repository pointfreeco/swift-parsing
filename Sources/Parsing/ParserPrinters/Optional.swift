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

extension Optional: Printer where Wrapped: Printer, Wrapped.Input: Appendable {
  public func print(_ output: Wrapped.Output?) -> Wrapped.Input? {
    switch self {
    case let .some(printer):
      return output.flatMap(printer.print)
    case .none:
      return .init()
    }
  }
}

extension Parsers {
  public struct OptionalVoid<Wrapped>: Parser
  where
    Wrapped: Parser,
    Wrapped.Output == Void
  {
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

extension Parsers.OptionalVoid: Printer
where
  Wrapped: Printer,
  Wrapped.Input: Appendable
{
  public func print(_ output: ()) -> Wrapped.Input? {
    switch self.wrapped {
    case let .some(printer):
      return printer.print()
    case .none:
      return .init()
    }
  }
}
