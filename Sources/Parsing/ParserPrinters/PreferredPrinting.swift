extension Printer {
  public func preferredPrinting(_ input: Input) -> PreferredPrinting<Self, Input> {
    .init(upstream: self, preferredInput: input)
  }
}

public struct PreferredPrinting<Upstream, Input> {
  public let upstream: Upstream
  public let preferredInput: Input
}

extension PreferredPrinting: Parser
where
  Upstream: Parser,
  Upstream.Input == Input
{
  public func parse(_ input: inout Input) -> ()? {
    self.upstream.parse(&input).map { _ in () }
  }
}

extension PreferredPrinting: Printer
where
  Upstream: Printer,
  Upstream.Input == Input
{
  public func print(_ output: ()) -> Input? {
    self.preferredInput
  }
}
