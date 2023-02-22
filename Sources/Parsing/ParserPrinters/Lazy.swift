/// A parser that waits for a call to its ``parse(_:)`` method before running the given closure to
/// create a parser for the given input.
public final class Lazy<LazyParser: Parser>: Parser {
  @usableFromInline
  internal var lazyParser: LazyParser?

  public let createParser: () -> LazyParser

  @inlinable
  public convenience init(@ParserBuilder createParser: @escaping () -> LazyParser) {
    self.init(internal: createParser)
  }
  
  @usableFromInline
  init(internal createParser: @escaping () -> LazyParser) {
    self.createParser = createParser
  }

  @inlinable
  public func parse(_ input: inout LazyParser.Input) rethrows -> LazyParser.Output {
    guard let parser = self.lazyParser else {
      let parser = self.createParser()
      self.lazyParser = parser
      return try parser.parse(&input)
    }
    return try parser.parse(&input)
  }
}

extension Lazy: ParserPrinter where LazyParser: ParserPrinter {
  @inlinable
  public func print(_ output: LazyParser.Output, into input: inout LazyParser.Input) rethrows {
    guard let parser = self.lazyParser else {
      let parser = self.createParser()
      self.lazyParser = parser
      try parser.print(output, into: &input)
      return
    }
    try parser.print(output, into: &input)
  }
}

extension Parsers {
  public typealias Lazy = Parsing.Lazy  // NB: Convenience type alias for discovery
}
