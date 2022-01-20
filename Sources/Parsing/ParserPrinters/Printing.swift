extension Parser where Input: Appendable {
  @inlinable
  public func printing(_ input: Input) -> Parsers.Printing<Self> {
    .init(upstream: self, input: input)
  }
}
// .printing(" "[...].utf8)

extension Parser where Input: AppendableCollection {
  @inlinable
  public func printing<Input>(_ input: Input) -> Parsers.Printing<Self>
  where Input: Collection, Input.Element == Self.Input.Element {
    .init(upstream: self, input: input)
  }
}
// .printing(" ".utf8)

extension Parsers {
  public struct Printing<Upstream>: ParserPrinter
  where
    Upstream: Parser,
    Upstream.Input: Appendable
  {
    public let upstream: Upstream
    public let input: Upstream.Input

    @inlinable
    public init(
      upstream: Upstream,
      input: Upstream.Input
    ) {
      self.upstream = upstream
      self.input = input
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) rethrows {
      _ = try self.upstream.parse(&input)
    }

    @inlinable
    public func print(_ output: (), to input: inout Upstream.Input) {
      input.append(contentsOf: self.input)
    }
  }
}

extension Parsers.Printing where Upstream.Input: AppendableCollection {
  @inlinable
  public init<Input>(
    upstream: Upstream,
    input: Input
  ) where
    Input: Collection,
    Input.Element == Upstream.Input.Element
  {
    self.upstream = upstream
    self.input = .init(input)
  }
}
