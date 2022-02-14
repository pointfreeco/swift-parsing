/// A type that can parse an output value from an input and print an output value back into an
/// input.
///
/// `ParserPrinter` is a type alias for the ``Parser`` and ``Printer`` protocols. When you use
/// `ParserPrinter` as a type or a generic constraint, it matches any type that conforms to both
/// protocols.
public typealias ParserPrinter = Parser & Printer
