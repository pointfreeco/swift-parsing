
  public struct DelimitedBy<Input: Collection>: Parser where Input.SubSequence == Input {
    public enum Escaping {
      case escapedBy(Input)
      case enclosedBetween(Input, Input)
      @inlinable
      public static func enclosedBy(_ input: Input) -> Self {
        .enclosedBetween(input, input)
      }
    }

    public let delimiter: Input
    public let escaping: Escaping?
    public let areEquivalent: (Input.Element, Input.Element) -> Bool

    @inlinable
    public init(
      _ delimiter: Input,
      _ escaping: Escaping? = nil,
      areEquivalent: @escaping (Input.Element, Input.Element) -> Bool
    ) {
      self.delimiter = delimiter
      self.escaping = escaping
      self.areEquivalent = areEquivalent
    }

    @inlinable
    public func parse(_ input: inout Input) throws -> Input {
      let original = input
      let index = try parseUpToNextDelimiter(&input)
      input = original[index...]
      return original[..<index]
    }

    @inlinable
    func parseUpToNextDelimiter(_ input: inout Input) throws -> Input.Index {
      let original = input
      let nextDelimiter: Input
      do {
        nextDelimiter = try PrefixUpTo(delimiter, by: areEquivalent).parse(&input)
      } catch {
        throw ParsingError.expectedInput("unescaped delimiter", at: input)
      }
      // Was this delimiter escaped?
      guard let escaping = escaping else {
        return nextDelimiter.endIndex
      }

      switch escaping {
      case .escapedBy(let escape):
        let escapedDelimiter = Parse {
          PrefixThrough(escape, by: areEquivalent)
          Peek { StartsWith<Input>(delimiter, by: areEquivalent) }
        }

        var escapingInput = original
        while let escaped = try? escapedDelimiter.parse(&escapingInput) {
          if escaped.endIndex == nextDelimiter.endIndex {
            // Consume the escaped delimiter
            try StartsWith(delimiter, by: areEquivalent).parse(&escapingInput)
            var trimmedInput = original[escapingInput.startIndex...]
            return try parseUpToNextDelimiter(&trimmedInput)
          } else if escaped.endIndex > nextDelimiter.endIndex {
            // nextDelimiter is acceptable
            break
          } else {
            // Consume the escape input
            try StartsWith(escape, by: areEquivalent).parse(&escapingInput)
          }
        }
        return nextDelimiter.endIndex
      case .enclosedBetween(let start, let end):
        let enclosed = Parse {
          StartsWith<Input>(start, by: areEquivalent)
          PrefixThrough(end, by: areEquivalent)
        }
        var escapingInput = original
        while let escaped = try? enclosed.parse(&escapingInput) {
          if escaped.indices.contains(nextDelimiter.endIndex) {
            // nextDelimiter was enclosed
            var trimmedInput = original[escaped.endIndex...]
            return try parseUpToNextDelimiter(&trimmedInput)
          } else if escaped.startIndex > nextDelimiter.endIndex {
            // nextDelimiter is acceptable
            break
          }
        }
        return nextDelimiter.endIndex
      }
    }
  }


extension DelimitedBy {
  @inlinable
  public init(
    _ delimiter: Input,
    _ escaping: Escaping? = nil
  ) where Input.Element: Equatable {
    self.delimiter = delimiter
    self.escaping = escaping
    self.areEquivalent = (==)
  }
}
