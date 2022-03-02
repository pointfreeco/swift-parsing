extension Optional: Parser where Wrapped: Parser {
  public func parse(_ input: inout Wrapped.Input) rethrows -> Wrapped.Output? {
    guard let self = self
    else { return nil }
    return try self.parse(&input)
  }
}

extension Optional: Printer where Wrapped: Printer {
  public func print(_ output: Wrapped.Output?, into input: inout Wrapped.Input) rethrows {
    guard let output = output else { return }
    try self?.print(output, into: &input)
  }
}

extension Parsers {
  /// A parser that attempts to run a given void parser, succeeding with void.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// `if` statements in parser builder blocks:
  ///
  /// ```swift
  /// Parse {
  ///   "Hello"
  ///   if useComma {
  ///     ","
  ///   }
  ///   " "
  ///   Rest()
  /// }
  /// ```
  public struct OptionalVoid<Wrapped: Parser>: Parser where Wrapped.Output == Void {
    let wrapped: Wrapped?

    public init(wrapped: Wrapped?) {
      self.wrapped = wrapped
    }

    public func parse(_ input: inout Wrapped.Input) rethrows {
      guard let wrapped = self.wrapped
      else { return }

      try wrapped.parse(&input)
    }
  }
}

extension Parsers.OptionalVoid: Printer where Wrapped: Printer {
  public func print(_ output: (), into input: inout Wrapped.Input) rethrows {
    try self.wrapped?.print(into: &input)
  }
}
