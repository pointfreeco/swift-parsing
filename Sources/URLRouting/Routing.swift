public struct Routing<RouteParser, Route>: Parser
where
  RouteParser: Parser,
  RouteParser.Input == URLRequestData
{
  @usableFromInline
  let parser: Zip2_OV<Parsers.Pipe<RouteParser, CasePath<Route, RouteParser.Output>>, PathEnd, Void>

  @inlinable
  public init(
    _ route: CasePath<Route, RouteParser.Output>,
    @ParserBuilder to parser: () -> RouteParser
  ) {
    self.parser = ParserBuilder.buildBlock(parser().pipe(route), PathEnd())
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) -> Route? {
    self.parser.parse(&input)
  }
}

extension Routing: Printer where RouteParser: Printer {
  @inlinable
  public func print(_ output: Route) -> URLRequestData? {
    self.parser.print(output)
  }
}
