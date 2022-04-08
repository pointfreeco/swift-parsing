/// A parser that attempts to run a number of parsers to accumulate output associated with a
/// particular URL endpoint.
///
/// `Route` is a domain-specific version of `Parse`, suited to URL request routing.
public struct Route<Parsers: Parser>: Parser where Parsers.Input == URLRequestData {
  @usableFromInline
  let parsers: Parsers

  @inlinable
  public init<Upstream, NewOutput>(
    _ transform: @escaping (Upstream.Output) -> NewOutput,
    @ParserBuilder with build: () -> Upstream
  )
  where
    Upstream.Input == URLRequestData,
    Parsers == Parsing.Parsers.Map<Upstream, NewOutput>
  {
    self.parsers = build().map(transform)
  }

  @inlinable
  public init<Upstream, NewOutput>(
    _ output: NewOutput,
    @ParserBuilder with build: () -> Upstream
  )
  where
    Upstream.Input == URLRequestData,
    Parsers == Parsing.Parsers.MapConstant<Upstream, NewOutput>
  {
    self.parsers = build().map { output }
  }

  @inlinable
  public init<NewOutput>(
    _ output: NewOutput
  )
  where
    Parsers == Parsing.Parsers.MapConstant<Always<URLRequestData, Void>, NewOutput>
  {
    self.init(output) {
      Always<URLRequestData, Void>(())
    }
  }

  @inlinable
  public init<C: Conversion, P: Parser>(
    _ conversion: C,
    @ParserBuilder to parsers: () -> P
  )
  where
    P.Input == URLRequestData,
    Parsers == Parsing.Parsers.MapConversion<P, C>
  {
    self.parsers = parsers().map(conversion)
  }

  @inlinable
  public init<C: Conversion>(
    _ conversion: C
  ) where Parsers == Parsing.Parsers.MapConversion<Always<URLRequestData, Void>, C> {
    self.init(conversion) {
      Always<URLRequestData, Void>(())
    }
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) throws -> Parsers.Output {
    let output = try self.parsers.parse(&input)
    if input.method != nil {
      try Method.get.parse(&input)
    }
    try PathEnd().parse(input)
    return output
  }
}

extension Route: ParserPrinter where Parsers: ParserPrinter {
  @inlinable
  public func print(_ output: Parsers.Output, into input: inout URLRequestData) rethrows {
    try self.parsers.print(output, into: &input)
  }
}
