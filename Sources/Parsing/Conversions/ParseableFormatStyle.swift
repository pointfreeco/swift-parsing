#if os(iOS) || os(macOS) || os(tvOS) || os(watchOS)
  import Foundation

  @available(iOS 15, macOS 12, tvOS 15, watchOS 8, *)
  extension Conversion {
    /// A conversion that wraps a parseable format style.
    ///
    /// This conversion forwards its ``apply(_:)`` and ``unapply(_:)`` methods to the underlying
    /// `ParseableFormatStyle` by invoking its parse strategy's `parse` method and its `format`
    /// method.
    ///
    /// See ``formatted(_:)-swift.method`` for a fluent version of this interface that transforms an
    /// existing conversion.
    ///
    /// - Parameter style: A parseable format style.
    /// - Returns: A conversion from a string to the given type.
    public static func formatted<Style>(
      _ style: Style
    ) -> Self where Self == Conversions.ParseableFormat<Style> {
      .init(style: style)
    }

    /// Transforms this conversion to a parseable format style's parse input into a conversion to
    /// the parseable format style's parse output.
    ///
    /// A fluent version of ``Conversion/formatted(_:)-swift.type.method``. Equivalent to calling
    /// `Conversion.map(.formatted(style)).
    ///
    /// - Parameter type: A type that conforms to `LosslessStringConvertible`.
    /// - Returns: A conversion from a string to the given type.
    public func formatted<Style>(
      _ style: Style
    ) -> Conversions.Map<Self, Conversions.ParseableFormat<Style>> {
      self.map(.formatted(style))
    }
  }

  extension Conversions {
    /// A conversion for a parseable format style.
    ///
    /// You will not typically need to interact with this type directly. Instead you will usually
    /// use the ``Conversion/formatted(_:)-swift.type.method`` operation, which constructs this
    /// type.
    @available(iOS 15, macOS 12, tvOS 15, watchOS 8, *)
    public struct ParseableFormat<Style>: Conversion where Style: ParseableFormatStyle {
      public let style: Style

      @inlinable
      public func apply(_ input: Style.Strategy.ParseInput) throws -> Style.Strategy.ParseOutput {
        try style.parseStrategy.parse(input)
      }

      @inlinable
      public func unapply(_ output: Style.FormatInput) -> Style.FormatOutput {
        self.style.format(output)
      }
    }
  }
#endif
