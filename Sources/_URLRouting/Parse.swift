import Parsing

extension Parse {
  @inlinable
  public init<Downstream>(
    _ conversion: Downstream
  ) where Parsers == Parsing.Parsers.MapConversion<Rest<Downstream.Input>, Downstream> {
    self.init { Rest().map(conversion) }
  }
}
