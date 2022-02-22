/// A parser that runs the given parser, but does not consume any input.
///
/// It lets you "peek" to see what output the parser would parse.
///
/// For example, identifiers (variables, functions, etc.) in Swift allow the first character to be a
/// letter or underscore, but not a digit, but subsequent characters can be digits. _E.g._, `foo123`
/// is a valid identifier, but `123foo` is not. We can create an identifier parser by using `Peek`
/// to first check if the input starts with a letter or underscore, and if it does, return the
/// remainder of the input up to the first character that is not a letter, a digit, or an
/// underscore.
///
/// ```swift
/// let identifier = Parse {
///   Skip {
///     Peek { Prefix(1) { $0.isLetter || $0 == "_" } }
///   }
///   Prefix { $0.isNumber || $0.isLetter || $0 == "_" }
/// }
/// ```
///
/// ## Printability
///
/// `Peek` is _not_ printable.
///
/// If you are building a parser-printer, avoid uses of `Peek` and instead prefer the use of
/// ``map(_:)-2sblf`` with conversions that preserve printability.
public struct Peek<Upstream: Parser>: ParserPrinter {
  public let upstream: Upstream

  /// Construct a parser that runs the given parser, but does not consume any input.
  ///
  /// - Parameter build: A parser this parser wants to inspect.
  @inlinable
  public init(@ParserBuilder _ build: () -> Upstream) {
    self.upstream = build()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) rethrows -> Upstream.Output {
    let original = input
    defer { input = original }
    return try self.upstream.parse(&input)
  }
    
  @inlinable
  public func print(_ output: Upstream.Output, to input: inout Upstream.Input) throws {
    do {
      var i = input
      _ = try upstream.parse(&i)
    } catch {
      throw PrintingError()
    }
  }
}

extension Peek where Output: Equatable {
  @inlinable
  public func print(_ output: Upstream.Output, to input: inout Upstream.Input) throws {
    do {
      var i = input
      let result = try upstream.parse(&i)
      guard result == output else {
        throw PrintingError()
      }
    } catch {
      throw PrintingError()
    }
  }
}
