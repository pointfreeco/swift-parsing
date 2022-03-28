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
public struct Digits<Input: Collection>: Parser
where
  Input.SubSequence == Input,
  Input.Element == UTF8.CodeUnit
{
  @usableFromInline
  let maximum: Int?

  @usableFromInline
  let minimum: Int

  @usableFromInline
  init<R: CountingRange>(_ length: R) {
    precondition(length.minimum >= 1, "Can't construct Digits with length < 1")
    self.minimum = length.minimum
    self.maximum = length.maximum
  }

  @inlinable
  public init() {
    self.init(1...)
  }

  @inlinable
  public func parse(_ input: inout Input) throws -> Int {
    var prefix = self.maximum.map(input.prefix) ?? input
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

    guard let digits = Int(String(decoding: prefix, as: UTF8.self))
    else { throw ParsingError.expectedInput("digits", at: input) }

    input.removeFirst(count)
    return digits
  }
}

extension Digits where Input == Substring.UTF8View {
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
