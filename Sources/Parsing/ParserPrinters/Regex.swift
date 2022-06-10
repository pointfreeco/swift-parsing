#if swift(>=5.7)
  @available(iOS 16, macOS 13, tvOS 16, watchOS 9, *)
  extension Regex: Parser {
    @inlinable
    public func parse(_ input: inout Substring) throws -> Output {
      guard let match = input.prefixMatch(of: self)
      else { throw ParsingError.failed(summary: "TODO", at: input) }
      input.removeFirst(input.distance(from: input.startIndex, to: input.endIndex))
      return match.output
    }
  }
#endif
