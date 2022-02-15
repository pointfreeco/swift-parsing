extension CaseIterable where Self: RawRepresentable, RawValue == String {
  /// A parser that consumes a case-iterable, raw representable value from the beginning of a
  /// collection of a substring.
  ///
  /// Given a type that conforms to `RawRepresentable` with a `RawValue` of `String`, and
  /// `CaseIterable`, we can incrementally parse a value of it.
  ///
  /// Notably, raw enumerations that conform to `CaseIterable` meet this criteria, so cases of the
  /// following type can be parsed with no extra work:
  ///
  /// ```swift
  /// enum Role: String, CaseIterable {
  ///   case admin
  ///   case guest
  ///   case member
  /// }
  ///
  /// var input = "admin,123"[...]
  /// try Role.parser().parse(&input)  // Role.admin
  /// input                            // ",123"
  /// ```
  ///
  /// - Parameter inputType: The `Substring` type. This parameter is included to mirror the
  ///   interface that parses any collection of UTF-8 code units.
  /// - Returns: A parser that consumes a case-iterable, raw representable value from the beginning
  ///   of a substring.
  @inlinable
  public static func parser(
    of inputType: Substring.Type = Substring.self
  ) -> Parsers.CaseIterableRawRepresentableParser<Substring, Self> {
    .init(toInput: { $0[...] }, areEquivalent: ==)
  }

  /// A parser that consumes a case-iterable, raw representable value from the beginning of a
  /// collection of a substring's UTF-8 view.
  ///
  /// - Parameter inputType: The `Substring.UTF8View` type. This parameter is included to mirror the
  ///   interface that parses any collection of UTF-8 code units.
  /// - Returns: A parser that consumes a case-iterable, raw representable value from the beginning
  ///   of a substring's UTF-8 view.
  @inlinable
  public static func parser(
    of inputType: Substring.UTF8View.Type = Substring.UTF8View.self
  ) -> Parsers.CaseIterableRawRepresentableParser<Substring.UTF8View, Self> {
    .init(toInput: { $0[...].utf8 }, areEquivalent: ==)
  }

  /// A parser that consumes a case-iterable, raw representable value from the beginning of a
  /// collection of UTF-8 code units.
  ///
  /// - Parameter inputType: The collection type of UTF-8 code units to parse.
  /// - Returns: A parser that consumes a case-iterable, raw representable value from the beginning
  ///   of a collection of UTF-8 code units.
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
      // FIXME: `throw ParsingError.manyFailed` instead?
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
