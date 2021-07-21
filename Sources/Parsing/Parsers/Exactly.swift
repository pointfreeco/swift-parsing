public struct Exactly<Output>: ParserPrinter
where
  Output: Equatable
{
  public let output: Output

  public init(
    _ output: Output
  ) where Output: Equatable {
    self.output = output
  }

  public func parse(_ input: inout Void) -> Output? {
    self.output
  }

  public func print(_ output: Output) -> Void? {
    self.output == output ? () : nil
  }
}
