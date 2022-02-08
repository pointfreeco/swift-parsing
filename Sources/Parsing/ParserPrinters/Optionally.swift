/// A parser that runs the given parser and succeeds with `nil` if it fails.
///
/// Use this parser when you are parsing into an output data model that contains `nil`.
///
/// If you are optionally parsing input that should coalesce into some default, you can skip the
/// optionality and instead use ``replaceError(with:)`` with a default:
///
/// ```swift
/// Optionally { Int.parser() }
///   .map { $0 ?? 0 }
///
/// // vs.
///
/// Int.parser()
///   .replaceError(with: 0)
/// ```
public struct Optionally<Wrapped: Parser>: Parser {
  public let wrapped: Wrapped

  @inlinable
  public init(@ParserBuilder _ build: () -> Wrapped) {
    self.wrapped = build()
  }

  @inlinable
  public func parse(_ input: inout Wrapped.Input) -> Wrapped.Output? {
    try? self.wrapped.parse(&input)
  }
}

extension Optionally: Printer where Wrapped: Printer {
  @inlinable
  public func print(_ output: Wrapped.Output?, to input: inout Wrapped.Input) rethrows {
    guard let output = output else { return }
    try? self.wrapped.print(output, to: &input) // TODO: Should this fail?
  }
}
