extension String: Parser {
  @inlinable
  public func parse(_ input: inout Substring) -> Void? {
    guard input.starts(with: self) else { return nil }
    input.removeFirst(self.count)
    return ()
  }
}

extension String: Printer {
  @inlinable
  public func print(_ output: Void) -> Substring? {
    self[...]
  }
}

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
  ) -> Parsers.UTF8ViewToSubstring<Parsers.StringParser<Substring.UTF8View>> {
    .init(.init())
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
    Input: Collection,
    Input.SubSequence == Input,
    Input.Element == UTF8.CodeUnit
  {
    @inlinable
    public init() {}

    @inlinable
    public func parse(_ input: inout Input) -> String? {
      String(decoding: input, as: UTF8.self)
    }
  }
}

extension Parsers.StringParser: Printer where Input: AppendableCollection {
  @inlinable
  public func print(_ output: String) -> Input? {
    var input = Input()
    input.append(contentsOf: output.utf8)
    return input
  }
}
