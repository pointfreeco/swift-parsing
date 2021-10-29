import Foundation

public struct Conversion<Input, Output>: ParserPrinter {
  private let apply: (Input) -> Output
  private let unapply: (Output) -> Input

  public init(
    apply: @escaping (Input) -> Output,
    unapply: @escaping (Output) -> Input
  ) {
    self.apply = apply
    self.unapply = unapply
  }

  public func apply(_ input: Input) -> Output {
    self.apply(input)
  }

  public func unapply(_ output: Output) -> Input {
    self.unapply(output)
  }

  public func parse(_ input: inout Input) -> Output? {
    self.apply(input)
  }

  public func print(_ output: Output) -> Input? {
    self.unapply(output)
  }
}

public struct PartialConversion<Input, Output>: ParserPrinter {
  private let apply: (Input) -> Output?
  private let unapply: (Output) -> Input?

  public init(
    apply: @escaping (Input) -> Output?,
    unapply: @escaping (Output) -> Input?
  ) {
    self.apply = apply
    self.unapply = unapply
  }

  public func apply(_ input: Input) -> Output? {
    self.apply(input)
  }

  public func unapply(_ output: Output) -> Input? {
    self.unapply(output)
  }

  public func parse(_ input: inout Input) -> Output? {
    self.apply(input)
  }

  public func print(_ output: Output) -> Input? {
    self.unapply(output)
  }
}

extension Conversion {
  public static func unsafeBitCast(
    to `init`: @escaping (Input) -> Output
  ) -> Self {
    Self(
      apply: `init`,
      unapply: { Swift.unsafeBitCast($0, to: Input.self) }
    )
  }

  public static func flip<A, B>() -> Self where Input == (A, B), Output == (B, A) {
    Self(
      apply: { ($1, $0) },
      unapply: { ($1, $0) }
    )
  }
}

extension Array where Element: RangeReplaceableCollection {
  public static var flatten: Conversion<Self, [Element.Element]> {
    .init(
      apply: { $0.flatMap { $0 } },
      unapply: { $0.map { .init([$0]) } }
    )
  }
}

extension BinaryFloatingPoint {
  public static var fromInt: Conversion<Int, Self> {
    .init(
      apply: Self.init,
      unapply: Int.init
    )
  }
}

extension Decodable where Self: Encodable {
  public static var fromJSON: PartialConversion<Data, Self> {
    Self.fromJSON()
  }

  public static func fromJSON(
    decoder: JSONDecoder = .init(),
    encoder: JSONEncoder = .init()
  ) -> PartialConversion<Data, Self> {
    .init(
      apply: { try? decoder.decode(Self.self, from: $0) },
      unapply: { try? encoder.encode($0) }
    )
  }
}

extension RangeReplaceableCollection {
  public static var fromSubsequence: Conversion<SubSequence, Self> {
    Conversion(apply: Self.init(_:), unapply: { $0[...] })
  }
}

extension RangeReplaceableCollection where Element == Void {
  public static var count: PartialConversion<Self, Int> {
    .init(
      apply: { $0.count },
      unapply: { $0 < 0 ? nil : .init(repeating: (), count: $0) }
    )
  }
}

extension RawRepresentable {
  public static var fromRawValue: PartialConversion<RawValue, Self> {
    PartialConversion(apply: Self.init(rawValue:), unapply: { $0.rawValue })
  }
}

extension RawRepresentable
where
  Self: CaseIterable,
  RawValue: RangeReplaceableCollection,
  Self: Equatable,
  RawValue.Element: Equatable
{
  public static var fromRawCase: OneOfMany<
    Parsers.MapViaParser<StartsWith<Self.RawValue.SubSequence>, Exactly<Self>>
  > {
    OneOfMany(
      Self.allCases.map {
        StartsWith($0.rawValue[...])
          .map(Exactly($0))
      }
    )
  }
}

extension SignedNumeric {
  public static var negate: Conversion<Self, Self> {
    .init(
      apply: (-),
      unapply: (-)
    )
  }
}

extension String {
  public static let fromSubstring: Conversion<Substring, Self> = fromSubsequence
}
