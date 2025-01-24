import Conversions

public struct From<Upstream: Conversion, DownstreamInput, Downstream: Parser>: Parser
where Upstream.Output == DownstreamInput, Downstream.Input == DownstreamInput {
  @usableFromInline
  let conversion: Upstream

  @usableFromInline
  let parser: Downstream

  @inlinable
  public init(_ conversion: Upstream, @ParserBuilder<DownstreamInput> _ parser: () -> Downstream) {
    self.conversion = conversion
    self.parser = parser()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) rethrows -> Downstream.Output {
    var parserInput = try self.conversion.apply(input)
    let output = try self.parser.parse(&parserInput)
    input = try self.conversion.unapply(parserInput)
    return output
  }
}

extension From: ParserPrinter where Downstream: ParserPrinter {
  @inlinable
  public func print(_ output: Downstream.Output, into input: inout Upstream.Input) rethrows {
    var parserInput = try self.conversion.apply(input)
    try self.parser.print(output, into: &parserInput)
    input = try self.conversion.unapply(parserInput)
  }
}

// TODO: Do we want to ship this?
extension Parsers {
  public struct Identity<InputOutput>: ParserPrinter {
    @usableFromInline
    init() {}

    @inlinable
    public func parse(_ input: inout InputOutput) -> InputOutput {
      input
    }

    @inlinable
    public func print(_ output: InputOutput, into input: inout InputOutput) {
      input = output
    }
  }
}

extension From {
  @inlinable
  public init(_ conversion: Upstream) where Downstream == Parsers.Identity<Upstream.Output> {
    self.conversion = conversion
    self.parser = .init()
  }
}
