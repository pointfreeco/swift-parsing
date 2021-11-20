extension RawRepresentable {
  @inlinable
  public static func parser() -> Parsers.RawRepresentableParser<Self> {
    .init()
  }
}

extension Parsers {
  public struct RawRepresentableParser<Output>: Parser
  where
    Output: RawRepresentable
  {
    @inlinable
    public init() {}

    @inlinable
    public func parse(_ input: inout Output.RawValue) -> Output? {
      .init(rawValue: input)
    }
  }
}

extension Parsers.RawRepresentableParser: Printer {
  @inlinable
  public func print(_ output: Output) -> Output.RawValue? {
    output.rawValue
  }
}
