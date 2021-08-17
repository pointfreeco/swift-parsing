/// A parser that always fails, no matter the input.
///
/// ```swift
/// Fail<Substring, Int>().parse("123 Hello") // (output: nil, rest: "123 Hello")
/// ```
public struct Fail<Input, Output>: Parser {
  @inlinable
  public init() {}
  
  @inlinable
  public func parse(_ input: inout Input) -> Output? {
    nil
  }
}

extension Parsers {
  public typealias Fail = Parsing.Fail  // NB: Convenience type alias for discovery
}

extension Parser {
  @inlinable
  public static func fail<Input, Output>() -> Self where Self == Fail<Input, Output> {
    return .init()
  }
}
