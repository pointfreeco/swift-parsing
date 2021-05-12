@_exported import CasePaths

public protocol ParserPrinter: Parser {
  func print(_ output: Output) -> Input?
}

extension Always: ParserPrinter
where
  Input: Appendable
{
  public func print(_ output: Output) -> Input? {
    .init()
  }
}

public struct AnyParserPrinter<Input, Output>: ParserPrinter {
  @usableFromInline
  let parser: (inout Input) -> Output?
  @usableFromInline
  let printer: (Output) -> Input?

  @inlinable
  public init(
    parse: @escaping (inout Input) -> Output?,
    print: @escaping (Output) -> Input?
  ) {
    self.parser = parse
    self.printer = print
  }

  @inlinable
  public init<P>(_ parserPrinter: P) where P: ParserPrinter, P.Input == Input, P.Output == Output {
    self.init(parse: parserPrinter.parse, print: parserPrinter.print)
  }

  @inlinable
  public func parse(_ input: inout Input) -> Output? {
    self.parser(&input)
  }

  @inlinable
  public func print(_ output: Output) -> Input? {
    self.printer(output)
  }

  @inlinable
  public func eraseToAnyParserPrinter() -> Self {
    self
  }
}

extension CasePath: ParserPrinter {
  public func parse(_ input: inout Value) -> Root? {
    self.embed(input)
  }

  public func print(_ output: Root) -> Value? {
    self.extract(from: output)
  }
}

extension End: ParserPrinter where Input: Appendable {
  public func print(_ output: ()) -> Input? {
    Input()
  }
}

public struct Exactly<Output>: ParserPrinter
where
  Output: Equatable
{
  public let output: Output

  public init(
    _ output: Output
  ) where Output: Equatable {
    self.output = output
  }

  public func parse(_ input: inout Void) -> Output? {
    self.output
  }

  public func print(_ output: Output) -> Void? {
    self.output == output ? () : nil
  }
}

extension First: ParserPrinter
where
  Input: RangeReplaceableCollection
{
  public func print(_ output: Input.Element) -> Input? {
    var empty = Input()
    empty.append(output)
    return empty
  }
}

extension Lazy: ParserPrinter
where
  LazyParser: ParserPrinter
{
  public func print(_ output: LazyParser.Output) -> LazyParser.Input? {
    guard let parser = self.lazyParser else {
      let parser = self.createParser()
      self.lazyParser = parser
      return parser.print(output)
    }
    return parser.print(output)
  }
}

extension Many: ParserPrinter
where
  Upstream: ParserPrinter,
  Upstream.Input: Appendable,
  Separator: ParserPrinter,
  Separator.Output == Void,
  Result: Collection,
  Result.Element == Upstream.Output
{
  public func print(_ output: Result) -> Upstream.Input? {
    let range = self.minimum...self.maximum
    var input = Upstream.Input()

    var count = 0
    guard let firstInput = output.first.flatMap(self.upstream.print)
    else { return range.contains(count) ? input : nil }

    input.append(contentsOf: firstInput)
    count += 1

    for element in output.dropFirst() {
      guard let elementInput = self.upstream.print(element)
      else { return input }

      if count > self.maximum {
        return nil
      }

      if let separatorInput = self.separator?.print(()) {
        input.append(contentsOf: separatorInput)
      }
      input.append(contentsOf: elementInput)
      count += 1
    }

    return range.contains(count) ? input : nil
  }
}

extension OneOfMany: ParserPrinter
where
  Upstream: ParserPrinter
{
  public func print(_ output: Upstream.Output) -> Upstream.Input? {
    for parser in self.parsers {
      if let input = parser.print(output) {
        return input
      }
    }
    return nil
  }
}

extension Parser {
  public func printing(_ printed: Input) -> Printing<Self> {
    Printing(upstream: self, printed: printed)
  }
}

extension ParserPrinter {
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

extension ParserPrinter
where
  Output == Void
{
  public func print() -> Input? {
    self.print(())
  }
}

extension Parsers.DoubleParser: ParserPrinter
where
  Input: RangeReplaceableCollection
{
  public func print(_ output: Output) -> Input? {
    Input(String(output).utf8)
  }
}

extension Parsers.IntParser: ParserPrinter
where
  Input: RangeReplaceableCollection
{
  public func print(_ output: Output) -> Input? {
    Input(String(output, radix: self.radix).utf8)
  }
}

extension Parsers {
  public struct MapViaParser<Upstream, Transform>: Parser
  where
    Upstream: Parser,
    Transform: Parser,
    Upstream.Output == Transform.Input
  {
    public let upstream: Upstream
    public let transform: Transform

    @inlinable
    public init(
      upstream: Upstream,
      transform: Transform
    ) {
      self.upstream = upstream
      self.transform = transform
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) -> Transform.Output? {
      let original = input

      guard var output = self.upstream.parse(&input)
      else { return nil }

      guard let newOutput = self.transform.parse(&output)
      else {
        input = original
        return nil
      }

      return newOutput
    }
  }
}

extension Parsers.MapViaParser: ParserPrinter
where
  Upstream: ParserPrinter,
  Transform: ParserPrinter
{
  @inlinable
  public func print(_ output: Transform.Output) -> Upstream.Input? {
    self.transform.print(output).flatMap(self.upstream.print)
  }
}

extension Parser {
  @inlinable
  public func map<P>(_ transform: P) -> Parsers.MapViaParser<Self, P>
  where
    P: Parser, Self.Output == P.Input
  {
    .init(upstream: self, transform: transform)
  }
}

extension Parsers.OneOf: ParserPrinter
where
  A: ParserPrinter,
  B: ParserPrinter
{
  public func print(_ output: A.Output) -> A.Input? {
    self.a.print(output) ?? self.b.print(output)
  }
}

extension Parsers.OptionalParser: ParserPrinter where Upstream: ParserPrinter {
  public func print(_ output: Upstream.Output?) -> Upstream.Input? {
    output.flatMap(self.upstream.print)
  }
}

extension Parsers.SkipFirst: ParserPrinter
where
  A: ParserPrinter,
  A.Output == Void,
  A.Input: Appendable,
  B: ParserPrinter
{
  public func print(_ output: B.Output) -> A.Input? {
    guard
      var input1 = self.a.print(()),
      let input2 = self.b.print(output)
    else { return nil }

    input1.append(contentsOf: input2)
    return input1
  }
}

extension Parsers.SkipSecond: ParserPrinter
where
  A: ParserPrinter,
  A.Input: Appendable,
  B: ParserPrinter,
  B.Output == Void
{
  public func print(_ output: A.Output) -> A.Input? {
    guard
      var input1 = self.a.print(output),
      let input2 = self.b.print(())
    else { return nil }

    input1.append(contentsOf: input2)
    return input1
  }
}

extension Parsers.SubstringDoubleParser: ParserPrinter {
  public func print(_ output: Output) -> Input? {
    Input(String(output))
  }
}

extension Parsers.SubstringIntParser: ParserPrinter {
  public func print(_ output: Output) -> Input? {
    Input(String(output, radix: self.parser.radix))
  }
}

extension Parsers.Take2: ParserPrinter
where
  A: ParserPrinter,
  B: ParserPrinter,
  Input: Appendable
{
  public func print(_ output: (A.Output, B.Output)) -> A.Input? {
    guard
      var a = self.a.print(output.0),
      let b = self.b.print(output.1)
    else { return nil }

    a.append(contentsOf: b)
    return a
  }
}

extension Parsers.Take3: ParserPrinter
where
  AB: ParserPrinter,
  C: ParserPrinter,
  Input: Appendable
{
  public func print(_ output: (A, B, C.Output)) -> AB.Input? {
    guard
      var ab = self.ab.print((output.0, output.1)),
      let c = self.c.print(output.2)
    else { return nil }

    ab.append(contentsOf: c)
    return ab
  }
}

extension Parsers.Take4: ParserPrinter
where
  ABC: ParserPrinter,
  D: ParserPrinter,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D.Output)) -> ABC.Input? {
    guard
      var abc = self.abc.print((output.0, output.1, output.2)),
      let d = self.d.print(output.3)
    else { return nil }

    abc.append(contentsOf: d)
    return abc
  }
}

extension Parsers.Take5: ParserPrinter
where
  ABCD: ParserPrinter,
  E: ParserPrinter,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D, E.Output)) -> ABCD.Input? {
    guard
      var abcd = self.abcd.print((output.0, output.1, output.2, output.3)),
      let e = self.e.print(output.4)
    else { return nil }

    abcd.append(contentsOf: e)
    return abcd
  }
}

extension Parsers.Take6: ParserPrinter
where
  ABCDE: ParserPrinter,
  F: ParserPrinter,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D, E, F.Output)) -> ABCDE.Input? {
    guard
      var abcde = self.abcde.print((output.0, output.1, output.2, output.3, output.4)),
      let f = self.f.print(output.5)
    else { return nil }

    abcde.append(contentsOf: f)
    return abcde
  }
}

extension Parsers.Take7: ParserPrinter
where
  ABCDEF: ParserPrinter,
  G: ParserPrinter,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D, E, F, G.Output)) -> ABCDEF.Input? {
    guard
      var abcdef = self.abcdef.print((output.0, output.1, output.2, output.3, output.4, output.5)),
      let g = self.g.print(output.6)
    else { return nil }

    abcdef.append(contentsOf: g)
    return abcdef
  }
}

extension Parsers.Take8: ParserPrinter
where
  ABCDEFG: ParserPrinter,
  H: ParserPrinter,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D, E, F, G, H.Output)) -> ABCDEFG.Input? {
    guard
      var abcdefg = self.abcdefg.print(
        (output.0, output.1, output.2, output.3, output.4, output.5, output.6)
      ),
      let h = self.h.print(output.7)
    else { return nil }

    abcdefg.append(contentsOf: h)
    return abcdefg
  }
}

extension Parsers.Take9: ParserPrinter
where
  ABCDEFGH: ParserPrinter,
  I: ParserPrinter,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D, E, F, G, H, I.Output)) -> ABCDEFGH.Input? {
    guard
      var abcdefgh = self.abcdefgh.print(
        (output.0, output.1, output.2, output.3, output.4, output.5, output.6, output.7)
      ),
      let i = self.i.print(output.8)
    else { return nil }

    abcdefgh.append(contentsOf: i)
    return abcdefgh
  }
}

extension Parsers.Take10: ParserPrinter
where
  ABCDEFGHI: ParserPrinter,
  J: ParserPrinter,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D, E, F, G, H, I, J.Output)) -> ABCDEFGHI.Input? {
    guard
      var abcdefghi = self.abcdefghi.print(
        (output.0, output.1, output.2, output.3, output.4, output.5, output.6, output.7, output.8)
      ),
      let j = self.j.print(output.9)
    else { return nil }

    abcdefghi.append(contentsOf: j)
    return abcdefghi
  }
}

extension Parsers.Take11: ParserPrinter
where
  ABCDEFGHIJ: ParserPrinter,
  K: ParserPrinter,
  Input: Appendable
{
  public func print(_ output: (A, B, C, D, E, F, G, H, I, J, K.Output)) -> ABCDEFGHIJ.Input? {
    guard
      var abcdefghij = self.abcdefghij.print((
        output.0,
        output.1,
        output.2,
        output.3,
        output.4,
        output.5,
        output.6,
        output.7,
        output.8,
        output.9
      )),
      let k = self.k.print(output.10)
    else { return nil }

    abcdefghij.append(contentsOf: k)
    return abcdefghij
  }
}

extension Prefix: ParserPrinter {
  public func print(_ output: Input) -> Input? {
    var output = output
    return self.skip(End()).parse(&output)
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

extension Rest: ParserPrinter {
  public func print(_ output: Input) -> Input? {
    output
  }
}

extension StartsWith: ParserPrinter
where
  Input: RangeReplaceableCollection
{
  public func print(_ output: Void) -> Input? {
    Input(self.possiblePrefix)
  }
}

// ...

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
