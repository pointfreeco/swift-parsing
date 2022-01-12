/// A parser that attempts to run a number of parsers to accumulate their outputs.
public struct Parse<Output, Parsers>: Parser where Parsers: Parser {
  public let transform: (Parsers.Output) -> Output
  public let parsers: Parsers

  @inlinable
  public init(
    _ transform: @escaping (Parsers.Output) -> Output,
    @ParserBuilder with build: () -> Parsers
  ) {
    self.transform = transform
    self.parsers = build()
  }

  @inlinable
  public func parse(_ input: inout Parsers.Input) -> Output? {
    self.parsers.parse(&input).map(self.transform)
  }
}

extension Parse where Parsers.Output == Void {
  @inlinable
  public init(
    _ output: Output,
    @ParserBuilder with build: () -> Parsers
  ) {
    self.init({ output }, with: build)
  }
}

extension Parse where Parsers.Output == Output {
  @inlinable
  public init(@ParserBuilder with build: () -> Parsers) {
    self.init({ $0 }, with: build)
  }
}
