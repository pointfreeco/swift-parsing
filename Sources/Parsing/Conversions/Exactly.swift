extension Conversion {
  public static func exactly<Output>(_ output: Output) -> Self
  where Self == Conversions.Exactly<Output> {
    .init(output)
  }
}

extension Conversions {
  public struct Exactly<Output>: Conversion where Output: Equatable {
    public let output: Output

    @inlinable
    public init(
      _ output: Output
    ) where Output: Equatable {
      self.output = output
    }

    @inlinable
    public func apply(_ input: Void) -> Output {
      self.output
    }

    @inlinable
    public func unapply(_ output: Output) throws {
      guard self.output == output
      else { throw ParsingError() }
    }
  }
}
