/// A parser that successfully parses `nil` when its wrapped parser fails.
///
/// Use this parser when you are parsing into an output data model that contains `nil`.
///
/// If you are optionally parsing input that should coalesce into some default, you can skip the
/// optionality and instead use ``OneOf`` with a final ``Always`` parser for a default.
public struct Optionally<Wrapped>: Parser where Wrapped: Parser {
  public typealias Input = Wrapped.Input
  public typealias Output = Wrapped.Output?

  public let wrapped: Wrapped

  @inlinable
  public init(@ParserBuilder _ build: () -> Wrapped) {
    self.wrapped = build()
  }

  @inlinable
  public func parse(_ input: inout Wrapped.Input) -> Wrapped.Output? {
    try? (self.wrapped.parse(&input) as Wrapped.Output)
  }
}
