public protocol Printer {
  associatedtype Input
  associatedtype Output

  func print(_ output: Output) -> Input?
}

//public protocol ParserPrinter: Parser, Printer {}
public typealias ParserPrinter = Parser & Printer

extension Parser {
  public func printing(_ printed: Input) -> Printing<Self> {
    Printing(upstream: self, printed: printed)
  }
}

extension Parser where Self: Printer {
  @inlinable
  public func eraseToAnyParserPrinter() -> AnyParserPrinter<Input, Output> {
    .init(self)
  }

  public func handleEvents(
    receiveInput: ((Input) -> Void)? = nil,
    receiveOutput: ((Output) -> Void)? = nil
  ) -> HandleEvents<Self> {
    .init(upstream: self, receiveInput: receiveInput, receiveOutput: receiveOutput)
  }

  public func printing(
    _ input: Input,
    where predicate: @escaping (Output) -> Bool
  ) -> PrintingOver<Self> {
    PrintingOver(upstream: self) { predicate($0) ? input : nil }
  }

  public func printing(
    _ printer: @escaping (Output) -> Input?
  ) -> PrintingOver<Self> {
    PrintingOver(upstream: self, printer: printer)
  }
}

extension Parser
where
  Self: Printer,
  Output == Void
{
  public func print() -> Input? {
    self.print(())
  }
}

extension Parsers.SubstringDoubleParser: Printer {
  public func print(_ output: Output) -> Input? {
    Input(String(output))
  }
}

extension Parsers.SubstringIntParser: Printer {
  public func print(_ output: Output) -> Input? {
    Input(String(output, radix: self.parser.radix))
  }
}

public struct Printing<Upstream>: ParserPrinter
where
  Upstream: Parser
{
  let upstream: Upstream
  let printed: Upstream.Input

  public func parse(_ input: inout Upstream.Input) -> Void? {
    self.upstream.parse(&input) == nil ? nil : ()
  }

  public func print(_ output: Void) -> Upstream.Input? {
    self.printed
  }
}

public struct PrintingOver<Upstream>: ParserPrinter
where
  Upstream: ParserPrinter
{
  let upstream: Upstream
  let printer: (Upstream.Output) -> Upstream.Input?

  public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
    self.upstream.parse(&input)
  }

  public func print(_ output: Upstream.Output) -> Upstream.Input? {
    self.printer(output) ?? self.upstream.print(output)
  }
}

public struct HandleEvents<Upstream>: ParserPrinter
where
  Upstream: ParserPrinter
{
  let upstream: Upstream
  let receiveInput: ((Upstream.Input) -> Void)?
  let receiveOutput: ((Upstream.Output) -> Void)?

  public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
    self.receiveInput?(input)
    return self.upstream.parse(&input)
  }

  public func print(_ output: Upstream.Output) -> Upstream.Input? {
    self.receiveOutput?(output)
    return self.upstream.print(output)
  }
}
