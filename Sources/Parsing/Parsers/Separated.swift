
public struct Separated<Parsers: SeparableParser, Initiator: Parser, Separator: Parser, Terminator: Parser>: Parser
where Initiator.Input == Parsers.Input, Separator.Input == Parsers.Input, Terminator.Input == Parsers.Input {
  public let parsers: Parsers
  public let initiator: Initiator?
  public let separator: Separator?
  public let terminator: Terminator?
    
  @inlinable
  public init(
    @ParserBuilder _ build: () -> Parsers,
    @ParserBuilder separator: () -> Separator
  )
  where
    Parsers: SeparableParser,
    Terminator == Always<Parsers.Input, Void>,
    Initiator == Always<Parsers.Input, Void>
  {
    self.parsers = build()
    self.initiator = nil
    self.separator = separator()
    self.terminator = nil
  }
  
  @inlinable
  public init(
    @ParserBuilder _ build: () -> Parsers,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
  )
  where
    Parsers: SeparableParser,
    Initiator == Always<Parsers.Input, Void>
  {
    self.parsers = build()
    self.initiator = nil
    self.separator = separator()
    self.terminator = terminator()
  }
  
  @inlinable
  public init(
    @ParserBuilder _ build: () -> Parsers,
    @ParserBuilder initiator: () -> Initiator,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder terminator: () -> Terminator
  )
  where
    Parsers: SeparableParser
  {
    self.parsers = build()
    self.initiator = initiator()
    self.separator = separator()
    self.terminator = terminator()
  }
  
  @inlinable
  public init(
    @ParserBuilder _ build: () -> Parsers,
    @ParserBuilder separator: () -> Separator,
    @ParserBuilder delimiter: () -> Terminator
  )
  where
    Parsers: SeparableParser,
    Initiator == Terminator
  {
    self.parsers = build()
    self.initiator = delimiter()
    self.separator = separator()
    self.terminator = delimiter()
  }

  @inlinable
  public func parse(_ input: inout Parsers.Input) rethrows -> Parsers.Output {
    try parsers.parse(
      &input,
      initiator: initiator.map { Parsing.Parsers.Delimiter(.initiator, $0) },
      separator: separator.map { Parsing.Parsers.Delimiter(.separator, $0) },
      terminator: terminator.map { Parsing.Parsers.Delimiter(.terminator, $0) }
    )
  }
}

/// A specific kind of parser that can be parsed as a collection of parsers optionally separated by
/// a common parser.
@rethrows public protocol SeparableParser: Parser {
  func parse<Initiator, Separator, Terminator>(
    _ input: inout Input,
    initiator: Initiator?,
    separator: Separator?,
    terminator: Terminator?
  ) throws -> Output
  where
    Initiator: Parser, Separator: Parser, Terminator: Parser,
    Initiator.Input == Input, Separator.Input == Input, Terminator.Input == Input
}

extension SeparableParser {
  @inlinable
  public func parse(_ input: inout Input) rethrows -> Output {
    try parse(
      &input,
      initiator: nil as Always<Input, Void>?,
      separator: nil as Always<Input, Void>?,
      terminator: nil as Always<Input, Void>?
    )
  }
}

extension Parsers {
  @usableFromInline
  struct Delimiter<Upstream: Parser>: Parser {
    @usableFromInline
    enum Kind: String {
      case initiator
      case separator
      case terminator
    }
    
    @usableFromInline
    let kind: Kind
    public let parser: Upstream
    
    @usableFromInline
    init(_ kind: Parsers.Delimiter<Upstream>.Kind, _ parser: Upstream) {
      self.kind = kind
      self.parser = parser
    }

    @inlinable
    public func parse(_ input: inout Upstream.Input) rethrows -> Upstream.Output {
      let original = input
      do {
        return try parser.parse(&input)
      } catch let ParsingError.failed(reason, context) {
        throw ParsingError.failed(
          "\(kind.rawValue): \(reason)",
          .init(
            originalInput: original,
            remainingInput: input,
            debugDescription: context.debugDescription,
            underlyingError: ParsingError.failed(reason, context)
          )
        )
      }
    }
  }
}
