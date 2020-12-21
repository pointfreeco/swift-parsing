extension Bool {
  /// A parser that consumes a Boolean value from the beginning of a collection of UTF-8 code units.
  ///
  /// This parser only recognizes the literal "true" and "false" characters:
  ///
  ///     Bool.parser().parse("true Hello"[...].utf8)  // (output: true, rest: " Hello")
  ///     Bool.parser().parse("false Hello"[...].utf8) // (output: false, rest: " Hello")
  ///     Bool.parser().parse("1 Hello"[...].utf8)     // (output: nil, rest: "1 Hello")
  ///
  /// - Parameter inputType: The collection type of UTF-8 code units to parse.
  /// - Returns: A parser that consumes a Boolean value from the beginning of a collection of UTF-8
  ///   code units.
  @inlinable
  public static func parser<Input>(
    of inputType: Input.Type = Input.self
  ) -> Parsers.BoolParser<Input> {
    .init()
  }

  /// A parser that consumes a Boolean value from the beginning of a substring.
  ///
  /// This parser only recognizes the literal "true" and "false" characters:
  ///
  ///     Bool.parser().parse("true Hello"[...])  // (output: true, rest: " Hello")
  ///     Bool.parser().parse("false Hello"[...]) // (output: false, rest: " Hello")
  ///     Bool.parser().parse("1 Hello"[...])     // (output: nil, rest: "1 Hello")
  ///
  /// - Parameter inputType: The substring type. This parameter is included to mirror the interface
  ///   that parses UTF-8 code units.
  /// - Returns: A parser that consumes a Boolean value from the beginning of a substring.
  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self
  ) -> Parsers.SubstringBoolParser {
    .init()
  }
}

extension Parsers {
  /// A parser that consumes a Boolean value from the beginning of a collection of UTF-8 code units.
  public struct BoolParser<Input>: Parser
  where
    Input: Collection,
    Input.SubSequence == Input,
    Input.Element == UTF8.CodeUnit
  {
    @inlinable
    public init() {}

    @inlinable
    public func parse(_ input: inout Input) -> Bool? {
      if input.starts(with: [116, 114, 117, 101] /*"true".utf8*/) {
        input.removeFirst(4)
        return true
      } else if input.starts(with: [102, 97, 108, 115, 101] /*"false".utf8*/) {
        input.removeFirst(5)
        return false
      }
      return nil
    }
  }

  /// A parser that consumes a Boolean value from the beginning of a substring.
  public struct SubstringBoolParser: Parser {
    public let parser = Bool.parser(of: Substring.UTF8View.self)

    @inlinable
    public init() {}

    @inlinable
    public func parse(_ input: inout Substring) -> Bool? {
      parser.parse(&input.utf8)
    }
  }
}
