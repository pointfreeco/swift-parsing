extension Parser where Self: ParserPrinter {
  @inlinable
  public func eraseToAnyParserPrinter() -> AnyParserPrinter<Input, Output> {
    AnyParserPrinter(self)
  }
}

public struct AnyParserPrinter<Input, Output>: ParserPrinter {
  @usableFromInline let parser: (inout Input) throws -> Output
  @usableFromInline let printer: (Output) -> Input?

  @inlinable
  public init<P>(_ parserPrinter: P) where P: ParserPrinter, P.Input == Input, P.Output == Output {
    self.init(parse: parserPrinter.parse(_:), print: parserPrinter.print(_:))
  }

  @inlinable
  public init(
    parse: @escaping (inout Input) throws -> Output,
    print: @escaping (Output) -> Input?
  ) {
    self.parser = parse
    self.printer = print
  }

  @inlinable
  public func parse(_ input: inout Input) throws -> Output {
    try self.parser(&input)
  }

  @inlinable
  public func print(_ output: Output) -> Input? {
    self.printer(output)
  }
}
