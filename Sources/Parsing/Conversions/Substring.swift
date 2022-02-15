extension Conversion where Self == Conversions.UnicodeScalarViewToSubstring {
  /// A conversion from `Substring.UnicodeScalarView` to `Substring`.
  @inlinable
  public static var substring: Self { .init() }
}

extension Conversion where Output == Substring.UnicodeScalarView {
  /// Transforms this conversion to `Substring.UnicodeScalarView` into a conversion to `Substring`.
  @inlinable
  public var substring: Conversions.Map<Self, Conversions.UnicodeScalarViewToSubstring> {
    self.map(.substring)
  }
}

extension Conversion where Self == Conversions.UTF8ViewToSubstring {
  /// A conversion from `Substring.UTF8View` to `Substring`.
  @inlinable
  public static var substring: Self { .init() }
}

extension Conversion where Output == Substring.UTF8View {
  /// Transforms this conversion to `Substring.UTF8View` into a conversion to `Substring`.
  @inlinable
  public var substring: Conversions.Map<Self, Conversions.UTF8ViewToSubstring> {
    self.map(.substring)
  }
}

extension Conversions {
  /// A conversion from a unicode scalar view to its substring.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/substring-swift.type.property-1y3u3`` and
  /// ``Conversion/substring-swift.property-1vwon`` operations, which construct this type under the
  /// hood.
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

  /// A conversion from a UTF-8 view to its substring.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/substring-swift.type.property-4r1aj`` and
  /// ``Conversion/substring-swift.property-3v4cl`` operations, which construct this type under the
  /// hood.
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
