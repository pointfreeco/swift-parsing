@resultBuilder
enum StringBuilder {
  typealias Expression = String
  typealias Component = [String]

  static func buildExpression(_ expression: Expression) -> Component {
    [expression]
  }
  static func buildBlock(_ components: Component...) -> Component {
    components.flatMap { $0 }
  }
  static func buildArray(_ components: [Component]) -> Component {
    components.flatMap { $0 }
  }
  static func buildOptional(_ component: Component?) -> Component {
    component ?? []
  }
  static func buildEither(first component: Component) -> Component {
    component
  }
  static func buildEither(second component: Component) -> Component {
    component
  }
  static func buildLimitedAvailability(_ component: Component) -> Component {
    component
  }
  static func buildFinalResult(_ component: Component) -> String {
    component.joined(separator: "\n")
  }
}

extension String {
  // Using String.init is a little too much for the compiler.
  static func build(
    @StringBuilder lines: () -> String
  ) -> String {
    lines()
  }
}
