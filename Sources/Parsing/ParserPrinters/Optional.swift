extension Optional: Parser where Wrapped: Parser {
  public func parse(_ input: inout Wrapped.Input) rethrows -> Wrapped.Output? {
    try self?.parse(&input)
  }
}

extension Optional: Printer where Wrapped: Printer {
  public func print(_ output: Wrapped.Output?, to input: inout Wrapped.Input) rethrows {
    guard let output = output else { return }
    try self?.print(output, to: &input)
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

    public func parse(_ input: inout Wrapped.Input) rethrows {
      try self.wrapped?.parse(&input)
    }
  }
}

extension Parsers.OptionalVoid: Printer where Wrapped: Printer {
  public func print(_ output: (), to input: inout Wrapped.Input) rethrows {
    try self.wrapped?.print(to: &input)
  }
}
