import Foundation

extension Conversion where Self == Conversions.BytesToData {
  @inlinable
  public static var data: Self { .init() }
}

extension Conversions {
  // FIXME: Can this be more generic (on `Input` *and* `Output`)?
  public struct BytesToData: Conversion {
    @usableFromInline
    init () {}

    @inlinable
    public func apply(_ input: ArraySlice<UInt8>) -> Data {
      .init(input)
    }

    @inlinable
    public func unapply(_ output: Data) -> ArraySlice<UInt8> {
      .init(output)
    }
  }
}
