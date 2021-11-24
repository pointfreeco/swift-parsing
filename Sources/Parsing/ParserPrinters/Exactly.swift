public struct Exactly<Output>: ParserPrinter
where
  Output: Equatable
{
  public let output: Output

  @inlinable
  public init(
    _ output: Output
  ) {
    self.output = output
  }

  @inlinable
  public func parse(_ input: inout Void) -> Output? {
    self.output
  }

  @inlinable
  public func print(_ output: Output) -> Void? {
    self.output == output ? () : nil
  }
}
