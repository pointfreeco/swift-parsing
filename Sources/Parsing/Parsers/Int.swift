extension FixedWidthInteger {
  /// A parser that consumes an integer (with an optional leading `+` or `-` sign) from the
  /// beginning of a collection of UTF-8 code units.
  ///
  ///     var input = "123 Hello world"[...].utf8
  ///     let output = Int.parser().parse(&input)
  ///     precondition(output == 123)
  ///     precondition(Substring(input) == " Hello world")
  ///
  /// - Parameters:
  ///   - inputType: The collection type of UTF-8 code units to parse.
  ///   - isSigned: If the parser will attempt to parse a leading `+` or `-` sign.
  ///   - radix: The radix, or base, to use for converting text to an integer value. `radix` must be
  ///     in the range `2...36`.
  /// - Returns: A parser that consumes an integer from the beginning of a collection of UTF-8 code
  ///   units.
  @inlinable
  public static func parser<Input>(
    of inputType: Input.Type = Input.self,
    isSigned: Bool = true,
    radix: Self = 10
  ) -> Parsers.IntParser<Input, Self> {
    .init(isSigned: isSigned, radix: radix)
  }

  /// A parser that consumes an integer (with an optional leading `+` or `-` sign) from the
  /// beginning of a substring.
  ///
  ///     var input = "123 Hello world"[...]
  ///     let output = Int.parser().parse(&input)
  ///     precondition(output == 123)
  ///     precondition(input == " Hello world")
  ///
  /// - Parameters:
  ///   - inputType: The substring type. This parameter is included to mirror the interface that
  ///     parses UTF-8 code units.
  ///   - isSigned: If the parser will attempt to parse a leading `+` or `-` sign.
  ///   - radix: The radix, or base, to use for converting text to an integer value. `radix` must be
  ///     in the range `2...36`.
  /// - Returns: A parser that consumes an integer from the beginning of a substring.
  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self,
    isSigned: Bool = true,
    radix: Self = 10
  ) -> Parsers.SubstringIntParser<Self> {
    .init(isSigned: isSigned, radix: radix)
  }
}

extension Parsers {
  /// A parser that consumes an integer (with an optional leading `+` or `-` sign) from the
  /// beginning of a collection of UTF8 code units.
  public struct IntParser<Input, Output>: Parser
  where
    Input: Collection,
    Input.SubSequence == Input,
    Input.Element == UTF8.CodeUnit,
    Output: FixedWidthInteger
  {
    /// If the parser will attempt to parse a leading `+` or `-` sign.
    public let isSigned: Bool

    /// The radix, or base, to use for converting text to an integer value.
    public let radix: Output

    @inlinable
    public init(isSigned: Bool = true, radix: Output = 10) {
      precondition((2...36).contains(radix), "Radix not in range 2...36")
      self.isSigned = isSigned
      self.radix = radix
    }

    @inlinable
    public func parse(_ input: inout Input) -> Output? {
      @inline(__always)
      func digit(for n: UTF8.CodeUnit) -> Output? {
        let output: Output
        switch n {
        case .init(ascii: "0") ... .init(ascii: "9"):
          output = Output(n - .init(ascii: "0"))
        case .init(ascii: "A") ... .init(ascii: "Z"):
          output = Output(n - .init(ascii: "A") + 10)
        case .init(ascii: "a") ... .init(ascii: "z"):
          output = Output(n - .init(ascii: "a") + 10)
        default:
          return nil
        }
        return output < self.radix ? output : nil
      }
      var length = 0
      var iterator = input.makeIterator()
      guard let first = iterator.next() else { return nil }
      let isPositive: Bool
      var overflow = false
      var output: Output
      switch (self.isSigned, first) {
      case (true, .init(ascii: "-")):
        isPositive = false
        output = 0
      case (true, .init(ascii: "+")):
        isPositive = true
        output = 0
      case let (_, n):
        guard let n = digit(for: n) else { return nil }
        isPositive = true
        output = n
      }
      length += 1
      while let next = iterator.next(), let n = digit(for: next) {
        (output, overflow) = output.multipliedReportingOverflow(by: self.radix)
        guard !overflow else { return nil }
        (output, overflow) =
          isPositive
          ? output.addingReportingOverflow(n)
          : output.subtractingReportingOverflow(n)
        guard !overflow else { return nil }
        length += 1
      }
      guard length > 0
      else { return nil }
      input.removeFirst(length)
      return output
    }
  }

  /// A parser that consumes an integer (with an optional leading `+` or `-` sign) from the
  /// beginning of a substring using a UTF-8 parser.
  public struct SubstringIntParser<Output>: Parser where Output: FixedWidthInteger {
    public let parser: Parsers.IntParser<Substring.UTF8View, Output>

    @inlinable
    public init(isSigned: Bool = true, radix: Output = 10) {
      self.parser = Parsers.IntParser(isSigned: isSigned, radix: radix)
    }

    @inlinable
    public func parse(_ input: inout Substring) -> Output? {
      self.parser.parse(&input.utf8)
    }
  }
}
