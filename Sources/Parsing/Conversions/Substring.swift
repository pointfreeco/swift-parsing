extension Conversion where Self == Conversions.UnicodeScalarViewToSubstring {
  /// A conversion from `Substring.UnicodeScalarView` to `Substring`.
  ///
  /// Useful when used with the ``From`` parser-printer to integrate a substring parser into a
  /// parser on unicode scalars.
  @inlinable
  public static var substring: Self { .init() }
}

extension Conversion where Output == Substring.UnicodeScalarView {
  /// Transforms this conversion to `Substring.UnicodeScalarView` into a conversion to `Substring`.
  ///
  /// A fluent version of ``Conversion/substring-swift.type.property-4r1aj``.
  @inlinable
  public var substring: Conversions.Map<Self, Conversions.UnicodeScalarViewToSubstring> {
    self.map(.substring)
  }
}

extension Conversion where Self == Conversions.UTF8ViewToSubstring {
  /// A conversion from `Substring.UTF8View` to `Substring`.
  ///
  /// Useful when used with the ``From`` parser-printer to integrate a substring parser into a
  /// parser on UTF-8 bytes.
  ///
  /// For example:
  ///
  /// ```swift
  /// Parse {
  ///   "caf".utf8
  ///   From(.substring) {
  ///     "é"
  ///   }
  /// }
  /// ```
  @inlinable
  public static var substring: Self { .init() }
}

extension Conversion where Output == Substring.UTF8View {
  /// Transforms this conversion to `Substring.UTF8View` into a conversion to `Substring`.
  ///
  /// A fluent version of ``Conversion/substring-swift.type.property-1y3u3``.
  @inlinable
  public var substring: Conversions.Map<Self, Conversions.UTF8ViewToSubstring> {
    self.map(.substring)
  }
}

extension Conversions {
  /// A conversion from a unicode scalar view to its substring.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/substring-swift.type.property-1y3u3`` and operation, which constructs this
  /// type under the hood.
  public struct UnicodeScalarViewToSubstring: Conversion {
    @inlinable
    public init() {
      self.init(internal: ())
    }
    
    @usableFromInline
    init(internal: Void) {}

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
  /// the ``Conversion/substring-swift.type.property-4r1aj`` operation, which constructs this type.
  public struct UTF8ViewToSubstring: Conversion {
    @inlinable
    public init() {
      self.init(internal: ())
    }
    
    @usableFromInline
    init(internal: Void) {}
    
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
