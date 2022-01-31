extension Conversion where Self == Conversions.SubstringToUTF8View {
  @inlinable
  public static var utf8: Self { .init() }
}

extension Conversions {
  public struct SubstringToUTF8View: Conversion {
    @usableFromInline
    init() {}

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
