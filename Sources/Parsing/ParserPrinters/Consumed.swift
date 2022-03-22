public struct Consumed<Upstream: Parser>: Parser
where
  Upstream.Input: Collection,
  Upstream.Input.SubSequence == Upstream.Input
{
  public let upstream: Upstream

  @inlinable
  public init(@ParserBuilder _ build: () -> Upstream) {
    self.upstream = build()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) rethrows -> Upstream.Input {
    let original = input
    _ = try self.upstream.parse(&input)
    return original[..<input.startIndex]
  }
}

extension Consumed: ParserPrinter where Upstream: ParserPrinter {
  @inlinable
  public func print(_ output: Upstream.Input, into input: inout Upstream.Input) rethrows {
    let upstreamOutput: Upstream.Output
    do {
      upstreamOutput = try self.upstream.parse(output)
    } catch {
      throw PrintingError.failed(summary: "TODO", input: input)
    }
    try self.upstream.print(upstreamOutput, into: &input)
  }
}
