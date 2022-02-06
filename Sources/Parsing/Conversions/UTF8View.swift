extension Conversion where Self == Conversions.SubstringToUTF8View {
  @inlinable
  public static var utf8: Self { .init() }
}

extension Conversion where Output == Substring {
  @inlinable
  public var utf8: Conversions.Map<Self, Conversions.SubstringToUTF8View> { self.map(.utf8) }
}

extension Conversions {
  public struct SubstringToUTF8View: Conversion {
    @inlinable
    public init() {}

    @inlinable
    public func apply(_ input: Substring) -> Substring.UTF8View {
      input.utf8
    }

    @inlinable
    public func unapply(_ output: Substring.UTF8View) -> Substring {
      Substring(output)
    }
  }
}
