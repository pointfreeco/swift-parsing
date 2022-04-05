/// A parser that consumes a number of digits from the beginning of a collection of UTF-8 code
/// units.
///
/// Useful for processing simple numbers into integers.
///
/// ```swift
/// try Digits().parse("123")  // 123
/// ```
///
/// `Digits` can be configured with a length of input to parse, making it a more surgical tool than
/// <doc:Int> parsers, which will parse an entire number all at once.
///
/// For example, you may want to parse a `YYYYMMDD` date format. You could do so using `Digits`:
///
/// ```swift
/// struct Date { var year, month, day: Int }
///
/// Parse(Date.init(year:month:day:)) {
///   Digits(4)
///   Digits(2)
///   Digits(2)
/// }
/// .parse("20220131")  // Date(year: 2022, month: 1, day: 31)
/// ```
public struct Digits<Input: Collection, Bytes: Collection>: Parser
where
  Input.SubSequence == Input,
  Bytes.Element == UTF8.CodeUnit,
  Bytes.SubSequence == Bytes
{
  @usableFromInline
  let maximum: Int?

  @usableFromInline
  let minimum: Int

  @usableFromInline
  let toBytes: (Input) -> Bytes

  @usableFromInline
  let fromBytes: (Bytes) -> Input

  @usableFromInline
  init<R: CountingRange>(
    length: R,
    toBytes: @escaping (Input) -> Bytes,
    fromBytes: @escaping (Bytes) -> Input
  ) {
    self.minimum = length.minimum
    self.maximum = length.maximum
    self.toBytes = toBytes
    self.fromBytes = fromBytes
  }

  @inlinable
  public func parse(_ input: inout Input) throws -> Int {
    var bytes = self.toBytes(input)
    defer { input = self.fromBytes(bytes) }

    var prefix = self.maximum.map(bytes.prefix) ?? bytes
    prefix = prefix.prefix(while: (.init(ascii: "0") ... .init(ascii: "9")).contains)
    let count = prefix.count

    guard prefix.count >= self.minimum
    else {
      throw ParsingError.expectedInput(
        """
        \(self.minimum == self.maximum ? "" : "at least ")\(self.minimum) \
        digit\(self.minimum == 1 ? "" : "s")
        """,
        at: input
      )
    }

    guard !prefix.isEmpty
    else { return 0 }

    guard let digits = Int(String(decoding: prefix, as: UTF8.self))
    else { throw ParsingError.expectedInput("digits", at: input) }

    bytes.removeFirst(count)
    return digits
  }
}

extension Digits: ParserPrinter where Input: PrependableCollection, Bytes: PrependableCollection {
  @inlinable
  public func print(_ output: Int, into input: inout Input) throws {
    guard self.minimum != 0, output != 0
    else { return }

    guard output >= 0
    else {
      throw PrintingError.failed(
        summary: """
          round-trip expectation failed

          A "Digits" parser tried to print \(output). "Digits" parsers cannot parse or print \
          negative numbers.
          """,
        input: input
      )
    }

    var bytes = Bytes(String(output).utf8)
    let count = bytes.count

    if let maximum = self.maximum, count > maximum {
      throw PrintingError.failed(
        summary: """
          round-trip expectation failed

          A "Digits" parser configured to parse at most \(maximum) digits tried to print \(output) \
          (\(count) digits).
          """,
        input: input
      )
    }

    for _ in 0..<max(0, self.minimum - count) {
      bytes.prepend(.init(ascii: "0"))
    }

    input.prepend(contentsOf: self.fromBytes(bytes))
  }
}

// NB: Swift 5.7 fails to build with a simpler `Bytes == Input` constraint
extension Digits where Bytes == Input.SubSequence, Bytes.SubSequence == Input {
  @inlinable
  public init() {
    self.init(1...)
  }

  @inlinable
  public init<R: CountingRange>(_ length: R) {
    self.init(
      length: length,
      toBytes: { $0 },
      fromBytes: { $0 }
    )
  }
}

extension Digits where Input == Substring, Bytes == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init() {
    self.init(1...)
  }

  @_disfavoredOverload
  @inlinable
  public init<R: CountingRange>(_ length: R) {
    self.init(
      length: length,
      toBytes: { $0.utf8 },
      fromBytes: Substring.init
    )
  }
}

extension Digits where Input == Substring.UTF8View, Bytes == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init() {
    self.init(1...)
  }

  @_disfavoredOverload
  public init<R: CountingRange>(_ length: R) {
    self.init(length)
  }
}
