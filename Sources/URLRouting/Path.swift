public struct Path<ComponentParsers>: Parser
where
  ComponentParsers: Parser,
  ComponentParsers.Input == URLRequestData
{
  @usableFromInline
  let componentParsers: ComponentParsers

  @inlinable
  public init(@PathBuilder build: () -> ComponentParsers) {
    self.componentParsers = build()
  }

  @inlinable
  public func parse(_ input: inout URLRequestData) -> ComponentParsers.Output? {
    self.componentParsers.parse(&input)
  }
}

extension Path: Printer where ComponentParsers: Printer {
  @inlinable
  public func print(_ output: ComponentParsers.Output) -> URLRequestData? {
    self.componentParsers.print(output)
  }
}

public struct PathComponent<ComponentParser>: Parser
where
  ComponentParser: Parser,
  ComponentParser.Input == Substring
{
  @usableFromInline
  let componentParser: ComponentParser

  @usableFromInline
  init(_ componentParser: ComponentParser) {
    self.componentParser = componentParser
  }

  public func parse(_ input: inout URLRequestData) -> ComponentParser.Output? {
    guard
      input.path.count >= 1,
      case var componentInput = input.path[input.path.startIndex],
      let output = self.componentParser.parse(&componentInput),
      componentInput.isEmpty
    else { return nil }
    input.path.removeFirst()
    return output
  }
}

extension PathComponent: Printer where ComponentParser: Printer {
  public func print(_ output: ComponentParser.Output) -> URLRequestData? {
    self.componentParser.print(output).map { .init(path: [$0]) }
  }
}
