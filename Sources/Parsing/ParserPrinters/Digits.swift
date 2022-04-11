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
public struct Digits<Length: CountingRange, InputToBytes: Conversion>: Parser
where
  InputToBytes.Input: Collection,
  InputToBytes.Input.SubSequence == InputToBytes.Input,
  InputToBytes.Output: Collection,
  InputToBytes.Output.Element == UTF8.CodeUnit,
  InputToBytes.Output.SubSequence == InputToBytes.Output
{
  @usableFromInline
  let length: Length

  @usableFromInline
  let inputToBytes: InputToBytes

  @usableFromInline
  init(length: Length, inputToBytes: InputToBytes) {
    self.length = length
    self.inputToBytes = inputToBytes
  }

  @inlinable
  public func parse(_ input: inout InputToBytes.Input) throws -> Int {
    var bytes = try self.inputToBytes.apply(input)

    @inline(__always)
    func digit(for n: UTF8.CodeUnit) -> Int? {
      switch n {
      case .init(ascii: "0") ... .init(ascii: "9"):
        return Int(n - .init(ascii: "0"))
      default:
        return nil
      }
    }
    var length = 0
    var iterator = bytes.makeIterator()
    var overflow = false
    var output = 0
    let original = input
    @inline(__always)
    func digitsError() -> ParsingError {
      ParsingError.expectedInput(
        """
        \(self.length.minimum == self.length.maximum ? "" : "at least ")\(self.length.minimum) \
        digit\(self.length.minimum == 1 ? "" : "s")
        """,
        from: original,
        to: input
      )
    }
    while self.length.maximum.map({ length < $0 }) ?? true,
      let next = iterator.next(),
      let n = digit(for: next)
    {
      bytes.removeFirst()
      (output, overflow) = output.multipliedReportingOverflow(by: 10)
      @inline(__always)
      func overflowError() -> ParsingError {
        ParsingError.failed(
          summary: "failed to process integer from digits",
          label: "overflowed \(Int.max)",
          from: original,
          to: input
        )
      }
      guard !overflow else { throw overflowError() }
      (output, overflow) = output.addingReportingOverflow(n)
      guard !overflow else { throw overflowError() }
      length += 1
    }
    guard length >= self.length.minimum
    else { throw digitsError() }

    input = try self.inputToBytes.unapply(bytes)
    return output
  }
}

extension Digits: ParserPrinter
where
  InputToBytes.Input: PrependableCollection,
  InputToBytes.Output: PrependableCollection
{
  @inlinable
  public func print(_ output: Int, into input: inout InputToBytes.Input) throws {
    guard self.length.minimum != 0 || output != 0
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

    var bytes = InputToBytes.Output(String(output).utf8)
    let count = bytes.count

    if let maximum = self.length.maximum, count > maximum {
      throw PrintingError.failed(
        summary: """
          round-trip expectation failed

          A "Digits" parser configured to parse at most \(maximum) digit\(maximum == 1 ? "" : "s") \
          tried to print \(output) (\(count) digit\(count == 1 ? "" : "s")).
          """,
        input: input
      )
    }

    for _ in 0..<max(0, self.length.minimum - count) {
      bytes.prepend(.init(ascii: "0"))
    }

    input.prepend(contentsOf: try self.inputToBytes.unapply(bytes))
  }
}

extension Digits {
  @inlinable
  public init<C>()
  where
    Length == PartialRangeFrom<Int>,
    InputToBytes == Conversions.Identity<C>
  {
    self.init(1...)
  }

  @inlinable
  public init<C>(_ length: Length) where InputToBytes == Conversions.Identity<C> {
    self.init(length: length, inputToBytes: .init())
  }
}

extension Digits where InputToBytes == Conversions.SubstringToUTF8View {
  @_disfavoredOverload
  @inlinable
  public init() where Length == PartialRangeFrom<Int> {
    self.init(1...)
  }

  @_disfavoredOverload
  @inlinable
  public init(_ length: Length) {
    self.init(length: length, inputToBytes: .init())
  }
}

extension Digits where InputToBytes == Conversions.Identity<Substring.UTF8View> {
  @_disfavoredOverload
  @inlinable
  public init() where Length == PartialRangeFrom<Int> {
    self.init(1...)
  }

  @_disfavoredOverload
  @inlinable
  public init(_ length: Length) {
    self.init(length)
  }
}
