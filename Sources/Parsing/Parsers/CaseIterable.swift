extension Parser
where
  Input == Substring,
  Output: CaseIterable & RawRepresentable,
  Output.RawValue == String
{
  static func parser(
    of inputType: Substring.Type = Substring.self
  ) -> Parsers.CaseIterableRawRepresentableParser<Substring, Output> {
    .init(toInput: { $0[...] }, areEquivalent: ==)
  }
}

extension Parser
where
  Input == Substring.UTF8View,
  Output: CaseIterable & RawRepresentable,
  Output.RawValue == String
{
  static func parser(
    of inputType: Substring.UTF8View.Type = Substring.UTF8View.self
  ) -> Parsers.CaseIterableRawRepresentableParser<Substring.UTF8View, Output> {
    .init(toInput: { $0.utf8[...] }, areEquivalent: ==)
  }
}

extension Parser
where
  Input: AppendableCollection,
  Input.SubSequence == Input,
  Input.Element == UTF8.CodeUnit,
  Output: CaseIterable & RawRepresentable,
  Output.RawValue == String
{
  static func parser(
    of inputType: Input.Type = Input.self
  ) -> Parsers.CaseIterableRawRepresentableParser<Input, Output> {
    .init(toInput: { Input($0.utf8) }, areEquivalent: ==)
  }
}

extension Parsers {
  public struct CaseIterableRawRepresentableParser<
    Input: Collection, Output: CaseIterable & RawRepresentable
  >: Parser where Input.SubSequence == Input {
    let toInput: (Output.RawValue) -> Input
    let areEquivalent: (Input.Element, Input.Element) -> Bool

    public func parse(_ input: inout Input) throws -> Output {
      for `case` in Output.allCases {
        let prefix = self.toInput(`case`.rawValue)
        if input.starts(with: prefix, by: self.areEquivalent) {
          input.removeFirst(prefix.count)
          return `case`
        }
      }
      throw ParsingError.expectedInput("case of \"\(Output.self)\"", at: input)
    }
  }
}

extension Parsers.CaseIterableRawRepresentableParser: Printer where Input: AppendableCollection {
  public func print(_ output: Output, to input: inout Input) {
    input.append(contentsOf: self.toInput(output.rawValue))
  }
}
