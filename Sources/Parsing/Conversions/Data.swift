import Foundation

extension Conversion where Self == Conversions.BytesToData<ArraySlice<UInt8>> {
  /// A conversion from `ArraySlice<UInt8>` to `Data`.
  @inlinable
  public static var data: Self { .init() }
}

extension Conversion where Output == ArraySlice<UInt8> {
  /// Transforms this conversion to `ArraySlice<UInt8>` into a conversion to `Data`.
  @inlinable
  public var data: Conversions.Map<Self, Conversions.BytesToData<Output>> {
    self.map(.data)
  }
}

extension Conversion where Self == Conversions.BytesToData<Substring.UTF8View> {
  /// A conversion from `Substring.UTF8View` to `Data`.
  @inlinable
  public static var data: Self { .init() }
}

extension Conversion where Output == Substring.UTF8View {
  /// Transforms this conversion to `Substring.UTF8View` into a conversion to `Data`.
  @inlinable
  public var data: Conversions.Map<Self, Conversions.BytesToData<Output>> {
    self.map(.data)
  }
}

extension Conversions {
  public struct BytesToData<Input>: Conversion
  where
    Input: PrependableCollection,
    Input.Element == UInt8
  {
    @usableFromInline
    init () {}

    @inlinable
    public func apply(_ input: Input) -> Data {
      .init(input)
    }

    @inlinable
    public func unapply(_ output: Data) -> Input {
      .init(output)
    }
  }
}
