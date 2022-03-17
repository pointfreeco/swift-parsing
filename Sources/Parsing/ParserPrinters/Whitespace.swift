/// A parser that consumes all ASCII whitespace from the beginning of the input.
///
/// - Note: This parser only consumes ASCII spaces (`" "`), newlines (`"\n"` and `"\r"`), and tabs
///   (`"\t"`). If you need richer support that covers all unicode whitespace, use a ``Prefix``
///   parser that operates on the `Substring` level with a predicate that consumes whitespace:
///
///   ```swift
///   Prefix { $0.isWhitespace }
///   ```
public struct Whitespace<Input: Collection, Bytes: Collection>: Parser
where
  Input.SubSequence == Input,
  Bytes.SubSequence == Bytes,
  Bytes.Element == UTF8.CodeUnit
{
  @usableFromInline
  let toBytes: (Input) -> Bytes

  @usableFromInline
  let fromBytes: (Bytes) -> Input

  @inlinable
  public func parse(_ input: inout Input) -> Input {
    let output = self.toBytes(input).prefix(while: { (byte: UTF8.CodeUnit) in
      byte == .init(ascii: " ")
        || byte == .init(ascii: "\n")
        || byte == .init(ascii: "\r")
        || byte == .init(ascii: "\t")
    })
    input.removeFirst(output.count)
    return self.fromBytes(output)
  }
}

extension Whitespace: ParserPrinter where Input: PrependableCollection {
  @inlinable
  public func print(_ output: Input, into input: inout Input) throws {
    guard
      self.toBytes(output).allSatisfy({ (byte: UTF8.CodeUnit) in
        byte == .init(ascii: " ")
          || byte == .init(ascii: "\n")
          || byte == .init(ascii: "\r")
          || byte == .init(ascii: "\t")
      })
    else {
      throw PrintingError.failed(
        summary: """
          round-trip expectation failed

          A "Whitespace" parser-printer attempted to print a string that is not whitespace.

          During a round-trip, the "Whitespace" parser stops parsing at non-whitespace characters, \
          which means its data is in an invalid state.
          """,
        input: input
      )
    }
    guard
      self.toBytes(input).first.map({ (byte: UTF8.CodeUnit) in
        byte == .init(ascii: " ")
        || byte == .init(ascii: "\n")
        || byte == .init(ascii: "\r")
        || byte == .init(ascii: "\t")
      }) != true
    else {
      throw PrintingError.failed(
        summary: """
          round-trip expectation failed

          The first element printed by a printer after a "Whitespace" parser-printer was whitespace.

          During a round-trip, the "Whitespace" parser would have parsed this character, which \
          means the data handed to the next printer is in an invalid state.
          """,
        input: input
      )
    }
    return input.prepend(contentsOf: output)
  }
}

// NB: Swift 5.7 fails to build with a simpler `Bytes == Input` constraint
extension Whitespace where Bytes == Input.SubSequence, Bytes.SubSequence == Input {
  @inlinable
  public init() {
    self.toBytes = { $0 }
    self.fromBytes = { $0 }
  }
}

extension Whitespace where Input == Substring, Bytes == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init() {
    self.toBytes = { $0.utf8 }
    self.fromBytes = Substring.init
  }
}

extension Whitespace where Input == Substring.UTF8View, Bytes == Input {
  @_disfavoredOverload
  @inlinable
  public init() { self.init() }
}

extension Whitespace where Input == ArraySlice<UTF8.CodeUnit>, Bytes == Input {
  @_disfavoredOverload
  @inlinable
  public init() { self.init() }
}

extension Parsers {
  public typealias Whitespace = Parsing.Whitespace  // NB: Convenience type alias for discovery
}
