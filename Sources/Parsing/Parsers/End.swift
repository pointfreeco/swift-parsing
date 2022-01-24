/// A parser that succeeds if the input is empty, and fails otherwise.
///
/// ```swift
/// End<Substring>().parse(""[...]) // (output: (), rest: "")
/// End<Substring>().parse("Hello"[...]) // (output: nil, rest: "Hello")
/// ```
public struct End<Input>: Parser where Input: Collection {
  public typealias Input = Input
  public typealias Output = Void

  @inlinable
  public init() {}

  @inlinable
  public func parse(_ input: inout Input) throws {
    guard input.isEmpty else { throw ParsingError(expect: "end of input", remainingInput: input) }
  }
}

extension End where Input == Substring {
  @_disfavoredOverload
  @inlinable
  public init() {}
}

extension End where Input == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init() {}
}

extension Parsers {
  public typealias End = Parsing.End  // NB: Convenience type alias for discovery
}
