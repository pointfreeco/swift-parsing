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
      self.init(internal: style)
    }
    
    @usableFromInline
    init(internal style: Style) {
      self.style = style
    }

    @inlinable
    public func parse(_ input: inout Substring) throws -> Style.Strategy.ParseOutput {
      guard let match = input.prefixMatch(of: self.style.regex)
      else {
        throw ParsingError.failed(
          summary: "failed to process \"\(Output.self)\"",
          at: input
        )
      }
      input.removeFirst(input.distance(from: input.startIndex, to: input.endIndex))
      return match.output
    }

    @inlinable
    public func print(_ output: Style.FormatInput, into input: inout Substring) {
      input.prepend(contentsOf: self.style.format(output))
    }
  }
#endif
