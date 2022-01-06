public struct Route<RouteParser, Route>: Parser
where
  RouteParser: Parser,
  RouteParser.Input == URLRequestData
{
  @usableFromInline
  let parser: Parsers.Pipe<RouteParser, CasePath<Route, RouteParser.Output>>

  @inlinable
  public init(
    _ route: CasePath<Route, RouteParser.Output>,
    @ParserBuilder to parser: () -> RouteParser
  ) {
    self.parser = parser().pipe(route)
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) -> Route? {
    let original = input
    guard
      let output = self.parser.parse(&input),
      input.path.isEmpty,
      input.method == nil || input.method == "GET"
    else {
      input = original
      return nil
    }
    input.method = nil
    return output
  }
}

extension Route: Printer where RouteParser: Printer {
  @inlinable
  public func print(_ output: Route) -> URLRequestData? {
    self.parser.print(output)
  }
}
