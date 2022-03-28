extension Conversion where Self == Conversions.SubstringToString {
  /// A conversion from `Substring` to `String`.
  @inlinable
  public static var string: Self { .init() }
}

extension Conversion where Output == Substring {
  /// Transforms this conversion to `Substring` into a conversion to `String`.
  @inlinable
  public var string: Conversions.Map<Self, Conversions.SubstringToString> { self.map(.string) }
}

extension Conversion where Self == Conversions.BytesToString<Substring.UTF8View> {
  /// A conversion from `Substring.UTF8View` to `String`.
  @inlinable
  public static var string: Self { .init() }
}

extension Conversion where Output == Substring.UTF8View {
  /// Transforms this conversion to `Substring.UTF8View` into a conversion to `String`.
  @inlinable
  public var string: Conversions.Map<Self, Conversions.BytesToString<Output>> { self.map(.string) }
}

extension Conversions {
  /// A conversion from a substring to a string.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/string-swift.type.property-3u2b5`` and
  /// ``Conversion/string-swift.property-61iba`` operations, which construct this type under the
  /// hood.
  public struct SubstringToString: Conversion {
    @inlinable
    public init() {}

    @inlinable
    public func apply(_ input: Substring) -> String {
      String(input)
    }

    @inlinable
    public func unapply(_ output: String) -> Substring {
      Substring(output)
    }
  }

  /// A conversion from an appendable collection of UTF-8 bytes to a string.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/string-swift.type.property-9owth`` and
  /// ``Conversion/string-swift.property-7zxma`` operations, which construct this type under the
  /// hood.
  public struct BytesToString<Input: PrependableCollection>: Conversion
  where
    Input.SubSequence == Input,
    Input.Element == UTF8.CodeUnit
  {
    @inlinable
    public init() {}

    @inlinable
    public func apply(_ input: Input) -> String {
      String(decoding: input, as: UTF8.self)
    }

    @inlinable
    public func unapply(_ output: String) -> Input {
      .init(output.utf8)
    }
  }
}
