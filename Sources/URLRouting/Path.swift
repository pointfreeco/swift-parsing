public struct Path<ComponentParser>: Parser
where
  ComponentParser: Parser,
  ComponentParser.Input == Substring
{
  @usableFromInline
  let componentParser: ComponentParser

  @inlinable
  public init(_ component: ComponentParser) {
    self.componentParser = component
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) -> ComponentParser.Output? {
    guard
      var component = input.path.first,
      let output = self.componentParser.parse(&component),
      component.isEmpty
    else { return nil }

    input.path.removeFirst()
    return output
  }
}

extension Path: Printer where ComponentParser: Printer {
  @inlinable
  public func print(_ output: ComponentParser.Output) -> URLRequestData? {
    self.componentParser.print(output).map { .init(path: [$0]) }
  }
}
