extension CaseIterable where Self: RawRepresentable, RawValue == String {
  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self
  ) -> Parsers.CaseIterableRawRepresentableParser<Substring, Self> {
    .init(toInput: { $0[...] }, areEquivalent: ==)
  }

  @inlinable
  public static func parser(
    of inputType: Substring.UTF8View.Type = Substring.UTF8View.self
  ) -> Parsers.CaseIterableRawRepresentableParser<Substring.UTF8View, Self> {
    .init(toInput: { $0[...].utf8 }, areEquivalent: ==)
  }

  @inlinable
  public static func parser<Input>(
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
  >: Parser
  where
    Input.SubSequence == Input,
    Output.RawValue: Comparable
  {
    @usableFromInline
    let cases: [Output]

    @usableFromInline
    let toInput: (Output.RawValue) -> Input

    @usableFromInline
    let areEquivalent: (Input.Element, Input.Element) -> Bool

    @usableFromInline
    init(
      toInput: @escaping (Output.RawValue) -> Input,
      areEquivalent: @escaping (Input.Element, Input.Element) -> Bool
    ) {
      self.toInput = toInput
      self.areEquivalent = areEquivalent
      self.cases = Output.allCases.sorted(by: { $0.rawValue > $1.rawValue })
    }

    @inlinable
    public func parse(_ input: inout Input) throws -> Output {
      for `case` in self.cases {
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
  @inlinable
  public func print(_ output: Output, to input: inout Input) {
    input.append(contentsOf: self.toInput(output.rawValue))
  }
}
