public typealias ParserPrinter = Parser & Printer

public typealias ParsePrint<P> = Parse<P> where P: ParserPrinter
