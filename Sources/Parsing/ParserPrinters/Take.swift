/// A parser that returns  input from the until the `terminator` `Parser`
/// matches. This provides a method of "lazy" (as opposed to "greedy") consumption of the input.
///
/// ```swift
/// enum ParkType {
///   case park
///   case world
/// }
///
/// let lineParser: some Parser<Substring, (String, ParkType)> = Take {
///   Prefix(0...).map(.string)
/// } upTo: {
///   OneOf {
///     "Park".map { ParkType.park }
///     "World".map { ParkType.world }
///   }
/// }
///
/// var input = "Jurrasic World"[...]
/// let parsed = try line.parse(&input) // ("Jurrasic ", .world)
/// ```
public struct Take<Input: Collection, Taken: Parser, Terminator: Parser>: Parser
  where Input.SubSequence == Input, Terminator.Input == Input, Taken.Input == Input {
  public let taken: Taken
  public let terminator: Terminator

  @inlinable
  public init(
    @ParserBuilder<Input> _ taken: () -> Taken,
    @ParserBuilder<Input> upTo terminator: () -> Terminator
  ) {
    self.taken = taken()
    self.terminator = terminator()
  }

  @inlinable
  @inline(__always)
  public func parse(_ input: inout Input) throws -> (Taken.Output, Terminator.Output) {
    let original = input

    var currentIndex = input.startIndex
    while currentIndex <= input.endIndex {
      let terminatorOutput: Terminator.Output
      var takenInput: Input

      do {
        var test = input[currentIndex...]
        terminatorOutput = try terminator.parse(&test)
        input = test
        takenInput = original[..<currentIndex]
      } catch {
        guard currentIndex < input.endIndex else {
          break
        }
        currentIndex = input.index(after: currentIndex)
        continue
      }

      let takenOutput = try taken.parse(&takenInput)
      guard takenInput.isEmpty else {
        throw ParsingError.expectedInput("to match \(formatValue(terminator))", at: takenInput)
      }
      return (takenOutput, terminatorOutput)
    }
    throw ParsingError.expectedInput("take up to \(formatValue(terminator))", at: input)
  }
}

extension Take: ParserPrinter where Input: PrependableCollection, Taken: ParserPrinter, Terminator: ParserPrinter {
  @inlinable
  public func print(_ output: Output, into input: inout Input) throws {
    let (takenOutput, terminatorOutput) = output
    try terminator.print(terminatorOutput, into: &input)
    try taken.print(takenOutput, into: &input)
  }
}

extension Parsers {
  public typealias Take = Parsing.Take // NB: Convenience type alias for discovery
}
