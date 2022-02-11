extension FixedWidthInteger {
  /// A parser that consumes an integer (with an optional leading `+` or `-` sign) from the
  /// beginning of a collection of UTF-8 code units.
  ///
  /// ```swift
  /// var input = "123 Hello world"[...]
  /// try Int.parser().parse(&input)  // 123
  /// input                           // " Hello world")
  /// ```
  ///
  /// This parser fails when it does not find an integer at the beginning of the collection:
  ///
  /// ```swift
  /// var input = "+Hello"[...]
  /// let number = try Int.parser().parse(&input)
  /// // error: unexpected input
  /// //  --> input:1:2
  /// // 1 | +Hello
  /// //   |  ^ expected integer
  /// ```
  ///
  /// And it fails when the digits extracted from the beginning of the collection would cause the
  /// integer type to overflow:
  ///
  /// ```swift
  /// var input = "9999999999999999999 Hello"[...]
  /// let number = try Int.parser().parse(&input)
  /// // error: failed to process "Int"
  /// //  --> input:1:1-19
  /// // 1 | 9999999999999999999 Hello
  /// //   | ^^^^^^^^^^^^^^^^^^^ overflowed 9223372036854775807
  /// ```
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
    radix: Int = 10
  ) -> Parsers.IntParser<Input, Self> {
    .init(isSigned: isSigned, radix: radix)
  }

  /// A parser that consumes an integer (with an optional leading `+` or `-` sign) from the
  /// beginning of a substring's UTF-8 view.
  ///
  /// This overload is provided to allow the `Input` generic to be inferred when it is
  /// `Substring.UTF8View`.
  ///
  /// - Parameters:
  ///   - inputType: The `Substring.UTF8View` type. This parameter is included to mirror the
  ///     interface that parses any collection of UTF-8 code units.
  ///   - isSigned: If the parser will attempt to parse a leading `+` or `-` sign.
  ///   - radix: The radix, or base, to use for converting text to an integer value. `radix` must be
  ///     in the range `2...36`.
  /// - Returns: A parser that consumes an integer from the beginning of a substring's UTF-8 view.
  @_disfavoredOverload
  @inlinable
  public static func parser(
    of inputType: Substring.UTF8View.Type = Substring.UTF8View.self,
    isSigned: Bool = true,
    radix: Int = 10
  ) -> Parsers.IntParser<Substring.UTF8View, Self> {
    .init(isSigned: isSigned, radix: radix)
  }

  /// A parser that consumes an integer (with an optional leading `+` or `-` sign) from the
  /// beginning of a substring.
  ///
  /// This overload is provided to allow the `Input` generic to be inferred when it is `Substring`.
  ///
  /// - Parameters:
  ///   - inputType: The `Substring` type. This parameter is included to mirror the interface that
  ///     parses any collection of UTF-8 code units.
  ///   - isSigned: If the parser will attempt to parse a leading `+` or `-` sign.
  ///   - radix: The radix, or base, to use for converting text to an integer value. `radix` must be
  ///     in the range `2...36`.
  /// - Returns: A parser that consumes an integer from the beginning of a substring.
  @_disfavoredOverload
  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self,
    isSigned: Bool = true,
    radix: Int = 10
  ) -> FromUTF8View<Substring, Parsers.IntParser<Substring.UTF8View, Self>> {
    .init { Parsers.IntParser<Substring.UTF8View, Self>(isSigned: isSigned, radix: radix) }
  }
}

extension Parsers {
  /// A parser that consumes an integer (with an optional leading `+` or `-` sign) from the
  /// beginning of a collection of UTF8 code units.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the static `parser()` method on the `FixedWidthInteger` of your choice, e.g. `Int.parser()`,
  /// `UInt8.parser()`, etc., all of which construct this type.
  public struct IntParser<Input: Collection, Output: FixedWidthInteger>: Parser
  where
    Input.SubSequence == Input,
    Input.Element == UTF8.CodeUnit
  {
    /// If the parser will attempt to parse a leading `+` or `-` sign.
    public let isSigned: Bool

    /// The radix, or base, to use for converting text to an integer value.
    public let radix: Int

    @inlinable
    public init(isSigned: Bool = true, radix: Int = 10) {
      precondition((2...36).contains(radix), "Radix not in range 2...36")
      self.isSigned = isSigned
      self.radix = radix
    }

    @inlinable
    public func parse(_ input: inout Input) throws -> Output {
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
      guard let first = iterator.next() else {
        throw ParsingError.expectedInput("integer", at: input)
      }
      let isPositive: Bool
      let parsedSign: Bool
      var overflow = false
      var output: Output
      switch (self.isSigned, first) {
      case (true, .init(ascii: "-")):
        parsedSign = true
        isPositive = false
        output = 0
      case (true, .init(ascii: "+")):
        parsedSign = true
        isPositive = true
        output = 0
      case let (_, n):
        guard let n = digit(for: n) else {
          throw ParsingError.expectedInput("integer", at: input)
        }
        parsedSign = false
        isPositive = true
        output = n
      }
      let original = input
      input.removeFirst()
      length += 1
      let radix = Output(self.radix)
      while let next = iterator.next(), let n = digit(for: next) {
        input.removeFirst()
        (output, overflow) = output.multipliedReportingOverflow(by: radix)
        func overflowError() -> Error {
          ParsingError.failed(
            summary: "failed to process \"\(Output.self)\"",
            label: "overflowed \(Output.max)",
            from: original,
            to: input
          )
        }
        guard !overflow else { throw overflowError() }
        (output, overflow) =
          isPositive
          ? output.addingReportingOverflow(n)
          : output.subtractingReportingOverflow(n)
        guard !overflow else { throw overflowError() }
        length += 1
      }
      guard length > (parsedSign ? 1 : 0)
      else {
        throw ParsingError.expectedInput("integer", at: input)
      }
      return output
    }
  }
}
