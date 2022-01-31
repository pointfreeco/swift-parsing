extension Conversion where Self == Conversions.UnicodeScalarViewToSubstring {
  @inlinable
  public static var substring: Self { .init() }
}

extension Conversion where Self == Conversions.UTF8ViewToSubstring {
  @inlinable
  public static var substring: Self { .init() }
}

extension Conversions {
  public struct UnicodeScalarViewToSubstring: Conversion {
    @usableFromInline
    init() {}

    @inlinable
    public func apply(_ input: Substring.UnicodeScalarView) -> Substring {
      Substring(input)
    }

    @inlinable
    public func unapply(_ output: Substring) -> Substring.UnicodeScalarView {
      output.unicodeScalars
    }
  }

  public struct UTF8ViewToSubstring: Conversion {
    @usableFromInline
    init() {}

    @inlinable
    public func apply(_ input: Substring.UTF8View) -> Substring {
      Substring(input)
    }

    @inlinable
    public func unapply(_ output: Substring) -> Substring.UTF8View {
      output.utf8
    }
  }
}
