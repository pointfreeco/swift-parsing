extension Parsers {
  /// A parser of a collection that returns a base parser's output as well as the index range of the
  /// parsed input.
  public struct Indexed<Base>: Parser
  where Base: Parser, Base.Input: Collection {
    public let base: Base

    @inlinable
    init(_ base: Base) {
      self.base = base
    }

    @inlinable
    public func parse(
      _ input: inout Base.Input
    ) throws -> (output: Base.Output, indices: Range<Base.Input.Index>) {
      let startIndex = input.startIndex
      let output = try base.parse(&input)
      return (output, startIndex..<input.startIndex)
    }
  }
}

extension Parser where Input: Collection {
  /// A parser of a collection that returns a base parser's output as well as the index range of the
  /// parsed input.
  @inlinable
  public func indexed() -> Parsers.Indexed<Self> {
    Parsers.Indexed(self)
  }
}
