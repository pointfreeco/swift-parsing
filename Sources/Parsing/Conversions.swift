import Foundation

public struct Conversion<Input, Output>: ParserPrinter {
  public let apply: (Input) -> Output
  public let unapply: (Output) -> Input

  public init(
    apply: @escaping (Input) -> Output,
    unapply: @escaping (Output) -> Input
  ) {
    self.apply = apply
    self.unapply = unapply
  }

  public func parse(_ input: inout Input) -> Output? {
    self.apply(input)
  }

  public func print(_ output: Output) -> Input? {
    self.unapply(output)
  }
}

public struct PartialConversion<Input, Output>: ParserPrinter {
  public let apply: (Input) -> Output?
  public let unapply: (Output) -> Input?

  public init(
    apply: @escaping (Input) -> Output?,
    unapply: @escaping (Output) -> Input?
  ) {
    self.apply = apply
    self.unapply = unapply
  }

  public func parse(_ input: inout Input) -> Output? {
    self.apply(input)
  }

  public func print(_ output: Output) -> Input? {
    self.unapply(output)
  }
}

extension Conversion {
  public static func unsafeBitCast<A, B, C>(
    to `init`: @escaping (Input) -> Output
  ) -> Self
  where Input == (A, B, C) {
    Self(
      apply: `init`,
      unapply: { Swift.unsafeBitCast($0, to: Input.self) }
    )
  }

  public static func unsafeBitCast<A, B>(
    to `init`: @escaping (Input) -> Output
  ) -> Self
  where Input == (A, B) {
    Self(
      apply: `init`,
      unapply: { Swift.unsafeBitCast($0, to: Input.self) }
    )
  }

  public static func unsafeBitCast(
    to `init`: @escaping (Input) -> Output
  ) -> Self {
    Self(
      apply: `init`,
      unapply: { Swift.unsafeBitCast($0, to: Input.self) }
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
  public static var fromRawCase: OneOfMany<Parsers.MapViaParser<StartsWith<Self.RawValue.SubSequence>, Exactly<Self>>> {
    OneOfMany(
      Self.allCases.map {
        StartsWith<RawValue.SubSequence>($0.rawValue[...])
          .map(Exactly($0))
      }
    )
  }
}

extension String {
  public static var fromSubstring: Conversion<Substring, Self> { self.fromSubsequence }
}

extension Array where Element: RangeReplaceableCollection {
  public static var flatten: Conversion<Self, [Element.Element]> {
    .init(
      apply: { $0.flatMap { $0 } },
      unapply: { $0.map { .init([$0]) } }
    )
  }
}

extension Conversion {
  public static func flip<A, B>() -> Self where Input == (A, B), Output == (B, A) {
    .init(
      apply: { ($1, $0) },
      unapply: { ($1, $0) }
    )
  }
}

extension Conversion where Input == Int, Output == Double {
  public static let intToDouble = Self(apply: Double.init(_:), unapply: Int.init(_:))
}

extension Conversion where Input == Int, Output == Int {
  public static let intNegation = Self(
    apply: (-),
    unapply: (-)
  )
}

extension PartialConversion where Input == [Void], Output == Int {
  public static let arrayCount = Self(
    apply: { $0.count },
    unapply: { $0 < 0 ? nil : Array(repeating: (), count: $0) }
  )
}
