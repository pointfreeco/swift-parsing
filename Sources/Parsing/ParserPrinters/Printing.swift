extension Parser {
  @inlinable
  public func printing(_ input: Input) -> Parsers.Printing<Self> {
    .init(upstream: self, input: input)
  }
}

extension Parser where Input: AppendableCollection {
  @inlinable
  public func printing<Input>(_ input: Input) -> Parsers.Printing<Self>
  where Input: Collection, Input.Element == Self.Input.Element {
    .init(upstream: self, input: input)
  }
}

extension Parsers {
  public struct Printing<Upstream>: ParserPrinter where Upstream: Parser {
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
    public func print(_ output: ()) -> Upstream.Input? {
      self.input
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
