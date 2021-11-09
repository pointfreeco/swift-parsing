extension Bool {
  /// A parser that consumes a Boolean value from the beginning of a collection of UTF-8 code units.
  ///
  /// This parser only recognizes the literal "true" and "false" characters:
  ///
  /// ```swift
  /// Bool.parser().parse("true Hello"[...].utf8)  // (output: true, rest: " Hello")
  /// Bool.parser().parse("false Hello"[...].utf8) // (output: false, rest: " Hello")
  /// Bool.parser().parse("1 Hello"[...].utf8)     // (output: nil, rest: "1 Hello")
  /// ```
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

  /// A parser that consumes a Boolean value from the beginning of a substring's UTF-8 view.
  ///
  /// This overload is provided to allow the `Input` generic to be inferred when it is
  /// `Substring.UTF8View`.
  ///
  /// - Parameter inputType: The `Substring.UTF8View` type. This parameter is included to mirror the
  ///   interface that parses any collection of UTF-8 code units.
  /// - Returns: A parser that consumes a Boolean value from the beginning of a substring's UTF-8
  ///   view.
  @inlinable
  public static func parser(
    of inputType: Substring.UTF8View.Type = Substring.UTF8View.self
  ) -> Parsers.BoolParser<Substring.UTF8View> {
    .init()
  }

  /// A parser that consumes a Boolean value from the beginning of a substring.
  ///
  /// This overload is provided to allow the `Input` generic to be inferred when it is `Substring`.
  ///
  /// - Parameter inputType: The `Substring` type. This parameter is included to mirror the
  ///   interface that parses any collection of UTF-8 code units.
  /// - Returns: A parser that consumes a Boolean value from the beginning of a substring.
  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self
  ) -> Parsers.UTF8ViewToSubstring<Parsers.BoolParser<Substring.UTF8View>> {
    .init(.init())
  }
}

extension Parsers {
  /// A parser that consumes a Boolean value from the beginning of a collection of UTF-8 code units.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// `Bool.parser()`, which constructs this type.
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
}
