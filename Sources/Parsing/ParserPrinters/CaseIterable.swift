extension CaseIterable where Self: RawRepresentable, RawValue == String {
  static func parser(
    of inputType: Substring.Type = Substring.self
  ) -> Parsers.CaseIterableRawRepresentableParser<Substring, Self> {
    .init(toInput: { $0[...] }, areEquivalent: ==)
  }

  static func parser(
    of inputType: Substring.UTF8View.Type = Substring.UTF8View.self
  ) -> Parsers.CaseIterableRawRepresentableParser<Substring.UTF8View, Self> {
    .init(toInput: { $0[...].utf8 }, areEquivalent: ==)
  }

  static func parser<Input>(
    of inputType: Input.Type = Input.self
  ) -> Parsers.CaseIterableRawRepresentableParser<Input, Self>
  where
    Input: AppendableCollection,
    Input.SubSequence == Input,
    Input.Element == UTF8.CodeUnit
  {
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
