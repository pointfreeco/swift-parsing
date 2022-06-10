#if swift(>=5.7) && (os(iOS) || os(macOS) || os(tvOS) || os(watchOS))
  import Foundation

  @available(iOS 16, macOS 13, tvOS 16, watchOS 9, *)
  public struct Formatted<Style: ParseableFormatStyle & RegexComponent>: ParserPrinter
  where
    Style.Strategy.ParseInput == String,
    Style.Strategy.ParseOutput == Style.RegexOutput
  {
    @usableFromInline
    let style: Style

    @inlinable
    public init(_ style: Style) {
      self.style = style
    }

    @inlinable
    public func parse(_ input: inout Substring) throws -> Style.Strategy.ParseOutput {
      try self.style.regex.parse(&input)
    }

    @inlinable
    public func print(_ output: Style.FormatInput, into input: inout Substring) {
      input.prepend(contentsOf: self.style.format(output))
    }
  }
#endif
