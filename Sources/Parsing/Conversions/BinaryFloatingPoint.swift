import Foundation

extension Conversion where Self == Conversions.FixedWidthIntegerToBinaryFloatingPoint<Int, Double> {
  @inlinable
  public static var double: Self { .init() }
}

extension Conversion where Output == Int {
  @inlinable
  public var double:
    Conversions.Map<
      Self, Conversions.FixedWidthIntegerToBinaryFloatingPoint<Int, Double>
    >
  { self.map(.double) }
}

extension Conversions {
  public struct FixedWidthIntegerToBinaryFloatingPoint<
    Input: FixedWidthInteger, Output: BinaryFloatingPoint
  >: Conversion {
    @usableFromInline
    init() {}

    @inlinable
    public func apply(_ input: Input) -> Output {
      .init(input)
    }

    @inlinable
    public func unapply(_ output: Output) -> Input {
      .init(output)
    }
  }
}
