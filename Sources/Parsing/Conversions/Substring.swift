extension Conversion where Self == Conversions.UnicodeScalarViewToSubstring {
  @inlinable
  public static var substring: Self { .init() }
}

extension Conversion where Output == Substring.UnicodeScalarView {
  @inlinable
  public var substring: Conversions.Map<Self, Conversions.UnicodeScalarViewToSubstring> {
    self.map(.substring)
  }
}

extension Conversion where Self == Conversions.UTF8ViewToSubstring {
  @inlinable
  public static var substring: Self { .init() }
}

extension Conversion where Output == Substring.UTF8View {
  @inlinable
  public var substring: Conversions.Map<Self, Conversions.UTF8ViewToSubstring> {
    self.map(.substring)
  }
}

extension Conversions {
  public struct UnicodeScalarViewToSubstring: Conversion {
    @inlinable
    public init() {}

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
    @inlinable
    public init() {}

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
