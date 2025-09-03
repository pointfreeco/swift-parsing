extension Bool {
  /// A parser that consumes a Boolean value from the beginning of a collection of UTF-8 code units.
  ///
  /// See <doc:Bool> for more information about this parser.
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
}

extension Parsers {
  /// A parser that consumes a Boolean value from the beginning of a collection of UTF-8 code units.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// `Bool.parser()`, which constructs this type.
  ///
  /// See <doc:Bool> for more information about this parser.
  public struct BoolParser<Input: Collection>: Parser, Sendable
  where
    Input.SubSequence == Input,
    Input.Element == UTF8.CodeUnit
  {
    @inlinable
    public init() {}

    @inlinable
    public func parse(_ input: inout Input) throws -> Bool {
      if input.starts(with: [116, 114, 117, 101] /*"true".utf8*/) {
        input.removeFirst(4)
        return true
      } else if input.starts(with: [102, 97, 108, 115, 101] /*"false".utf8*/) {
        input.removeFirst(5)
        return false
      }
      throw ParsingError.expectedInput("\"true\" or \"false\"", at: input)
    }
  }
}

extension Parsers.BoolParser: ParserPrinter where Input: PrependableCollection {
  @inlinable
  public func print(_ output: Bool, into input: inout Input) {
    switch output {
    case true:
      input.prepend(contentsOf: [116, 114, 117, 101] /*"true".utf8*/)
    case false:
      input.prepend(contentsOf: [102, 97, 108, 115, 101] /*"false".utf8*/)
    }
  }
}
