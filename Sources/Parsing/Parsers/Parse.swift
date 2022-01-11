/// A parser that attempts to run a number of parsers to accumulate their outputs.
public struct Parse<Body, Output>: Parser where Body: Parser {
  public let body: Body
  public let transform: (Body.Output) -> Output

  @inlinable
  public init(
    _ transform: @escaping (Body.Output) -> Output,
    @ParserBuilder with build: () -> Body
  ) {
    self.transform = transform
    self.body = build()
  }

  @inlinable
  public func parse(_ input: inout Body.Input) -> Output? {
    self.body.parse(&input).map(self.transform)
  }
}

extension Parse where Body.Output == Void {
  @inlinable
  public init(
    _ output: Output,
    @ParserBuilder with build: () -> Body
  ) {
    self.init({ output }, with: build)
  }
}

extension Parse where Body.Output == Output {
  @inlinable
  public init(@ParserBuilder with build: () -> Body) {
    self.init({ $0 }, with: build)
  }
}
