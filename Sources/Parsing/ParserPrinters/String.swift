extension String {
  @inlinable
  public static func parser<Input>(
    of inputType: Input.Type = Input.self
  ) -> Parsers.StringParser<Input> {
    .init()
  }

  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self
  ) -> FromUTF8View<Substring, Parsers.StringParser<Substring.UTF8View>> {
    .init { Parsers.StringParser<Substring.UTF8View>() }
  }

  @inlinable
  public static func parser(
    of inputType: Substring.UTF8View.Type = Substring.UTF8View.self
  ) -> Parsers.StringParser<Substring.UTF8View> {
    .init()
  }
}

extension Parsers {
  public struct StringParser<Input>: Parser
  where
    Input: AppendableCollection,
    Input.SubSequence == Input,
    Input.Element == UTF8.CodeUnit
  {
    @inlinable
    public init() {}

    @inlinable
    public func parse(_ input: inout Input) -> String {
      let output = String(decoding: input, as: UTF8.self)
      input = .init()
      return output
    }
  }
}

extension Parsers.StringParser: Printer where Input: AppendableCollection {
  @inlinable
  public func print(_ output: String) -> Input? {
    .init(output.utf8)
  }
}
