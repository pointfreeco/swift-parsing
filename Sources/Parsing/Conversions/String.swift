extension Conversion where Self == Conversions.SubstringToString {
  /// A conversion from `Substring` to `String`.
  ///
  /// Useful for transforming a ``ParserPrinter``'s substring output into a more general-purpose
  /// string.
  ///
  /// ```swift
  /// let line = Prefix { $0 != "\n" }.map(.string)
  /// ```
  @inlinable
  public static var string: Self { .init() }
}

extension Conversion where Output == Substring {
  /// Transforms this conversion to `Substring` into a conversion to `String`.
  ///
  /// A fluent version of ``Conversion/string-swift.type.property-3u2b5``.
  @inlinable
  public var string: Conversions.Map<Self, Conversions.SubstringToString> { self.map(.string) }
}

extension Conversion where Self == Conversions.BytesToString<Substring.UTF8View> {
  /// A conversion from `Substring.UTF8View` to `String`.
  ///
  /// Useful for transforming a ``ParserPrinter``'s UTF-8 output into a more general-purpose string.
  ///
  /// ```swift
  /// let line = Prefix { $0 != .init(ascii: "\n") }.map(.string)
  /// ```
  @inlinable
  public static var string: Self { .init() }
}

extension Conversion where Output == Substring.UTF8View {
  /// Transforms this conversion to `Substring.UTF8View` into a conversion to `String`.
  ///
  /// A fluent version of ``Conversion/string-swift.type.property-9owth``.
  @inlinable
  public var string: Conversions.Map<Self, Conversions.BytesToString<Output>> { self.map(.string) }
}

extension Conversions {
  /// A conversion from a substring to a string.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/string-swift.type.property-3u2b5`` operation, which constructs this type.
  public struct SubstringToString: Conversion, Sendable {
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

  /// A conversion from a ``PrependableCollection`` of UTF-8 bytes to a string.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/string-swift.type.property-9owth`` operation, which constructs this type.
  public struct BytesToString<Input: PrependableCollection>: Conversion, Sendable
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
