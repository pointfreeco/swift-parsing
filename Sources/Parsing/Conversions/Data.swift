import Foundation

extension Conversion where Self == Conversions.BytesToData<ArraySlice<UInt8>> {
  @inlinable
  public static var data: Self { .init() }
}

extension Conversion where Output == ArraySlice<UInt8> {
  @inlinable
  public var data: Conversions.Map<Self, Conversions.BytesToData<Output>> {
    self.map(.data)
  }
}

extension Conversion where Self == Conversions.BytesToData<Substring.UTF8View> {
  @inlinable
  public static var data: Self { .init() }
}

extension Conversion where Output == Substring.UTF8View {
  @inlinable
  public var data: Conversions.Map<Self, Conversions.BytesToData<Output>> {
    self.map(.data)
  }
}

extension Conversions {
  // FIXME: Can this be more generic (on `Input` *and* `Output`)?
  public struct BytesToData<Input>: Conversion
  where
    Input: AppendableCollection,
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
