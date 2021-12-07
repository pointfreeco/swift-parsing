import Foundation

extension RawRepresentable {
  @inlinable
  public static func parser<P>(rawValue rawValueParser: P) -> Parsers.RawRepresentableParser<Self, P> {
    .init(rawValueParser: rawValueParser)
  }
}

extension Parsers {
  public struct RawRepresentableParser<Output, RawValueParser>: Parser
  where
    Output: RawRepresentable,
    RawValueParser: Parser,
    RawValueParser.Output == Output.RawValue
  {
    @usableFromInline
    let rawValueParser: RawValueParser

    @inlinable
    public init(rawValueParser: RawValueParser) {
      self.rawValueParser = rawValueParser
    }

    @inlinable
    public func parse(_ input: inout RawValueParser.Input) -> Output? {
      self.rawValueParser.parse(&input).flatMap(Output.init(rawValue:))
    }
  }
}

extension Parsers.RawRepresentableParser: Printer where RawValueParser: Printer {
  @inlinable
  public func print(_ output: Output) -> RawValueParser.Input? {
    self.rawValueParser.print(output.rawValue)
  }
}
