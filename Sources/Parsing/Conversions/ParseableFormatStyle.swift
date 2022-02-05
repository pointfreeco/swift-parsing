import Foundation

@available(iOS 15, macOS 12, tvOS 15, watchOS 8, *)
extension Conversion {
  public static func formatted<Style>(
    _ style: Style
  ) -> Self where Self == Conversions.ParseableFormat<Style> {
    .init(style: style)
  }

  public func formatted<Style>(
    _ style: Style
  ) -> Conversions.Map<Self, Conversions.ParseableFormat<Style>> {
    self.map(.formatted(style))
  }
}

extension Conversions {
  @available(iOS 15, macOS 12, tvOS 15, watchOS 8, *)
  public struct ParseableFormat<Style>: Conversion where Style: ParseableFormatStyle {
    public let style: Style

    @inlinable
    public func apply(_ input: Style.FormatOutput) throws -> Style.FormatInput {
      try style.parseStrategy.parse(input)
    }

    @inlinable
    public func unapply(_ output: Style.FormatInput) -> Style.FormatOutput {
      self.style.format(output)
    }
  }
}
