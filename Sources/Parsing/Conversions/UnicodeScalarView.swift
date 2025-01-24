extension Conversion where Self == Conversions.SubstringToUnicodeScalarView {
  /// A conversion from `Substring` to `Substring.UnicodeScalarView`.
  @inlinable
  public static var unicodeScalars: Self { .init() }
}

extension Conversion where Output == Substring {
  /// Transforms this conversion to `Substring` into a conversion to `Substring.UnicodeScalarView`.
  ///
  /// A fluent version of ``Conversion/unicodeScalars-swift.type.property-7wivx``.
  @inlinable
  public var unicodeScalars: Conversions.Map<Self, Conversions.SubstringToUnicodeScalarView> {
    self.map(.unicodeScalars)
  }
}

extension Conversion where Self == Conversions.BytesToUnicodeScalarView<Substring.UTF8View> {
  /// A conversion from `Substring.UTF8View` to `Substring.UnicodeScalarView`.
  @inlinable
  public static var unicodeScalars: Self { .init() }
}

extension Conversion where Output == Substring.UTF8View {
  /// Transforms this conversion to `Substring.UTF8View` into a conversion to `Substring.UnicodeScalarView`.
  ///
  /// A fluent version of ``Conversion/unicodeScalars-swift.type.property-1nefn``.
  @inlinable
  public var unicodeScalars: Conversions.Map<Self, Conversions.BytesToUnicodeScalarView<Substring.UTF8View>> {
    self.map(.unicodeScalars)
  }
}

extension Conversion where Self == Conversions.BytesToUnicodeScalarView<ArraySlice<UInt8>> {
  /// A conversion from `ArraySlice<UInt8>` to `Substring.UnicodeScalarView`.
  @inlinable
  public static var unicodeScalars: Self { .init() }
}

extension Conversion where Output == ArraySlice<UInt8> {
  /// Transforms this conversion to `ArraySlice<UInt8>` into a conversion to `Substring.UnicodeScalarView`.
  ///
  /// A fluent version of ``Conversion/unicodeScalars-swift.type.property-24r1i``.
  @inlinable
  public var unicodeScalars: Conversions.Map<Self, Conversions.BytesToUnicodeScalarView<ArraySlice<UInt8>>> {
    self.map(.unicodeScalars)
  }
}

extension Conversions {
  /// A conversion from a `Substring` to `Substring.UnicodeScalarView`.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/unicodeScalars-swift.type.property-7wivx`` operation, which constructs this type.
  public struct SubstringToUnicodeScalarView: Conversion {
    @inlinable
    public init() {}

    @inlinable
    public func apply(_ input: Substring) throws -> Substring.UnicodeScalarView {
      input.unicodeScalars
    }

    @inlinable
    public func unapply(_ output: Substring.UnicodeScalarView) throws -> Substring {
      Substring(output)
    }
  }

  /// A conversion from a ``PrependableCollection`` of UTF-8 bytes to `Substring.UnicodeScalarView`.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/unicodeScalars-swift.type.property-1nefn`` and
  /// ``Conversion/unicodeScalars-swift.type.property-24r1i`` operations, which construct this type.
  public struct BytesToUnicodeScalarView<Input: PrependableCollection>: Conversion where Input.Element == UInt8 {
    @inlinable
    public init() {}

    @inlinable
    public func apply(_ input: Input) throws -> Substring.UnicodeScalarView {
      Substring(decoding: input, as: UTF8.self).unicodeScalars
    }

    @inlinable
    public func unapply(_ output: Substring.UnicodeScalarView) throws -> Input {
      .init(Substring(output).utf8)
    }
  }
}
