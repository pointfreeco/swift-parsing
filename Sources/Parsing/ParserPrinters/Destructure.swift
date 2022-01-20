extension Parser where Self: Printer {
  public static func destructure<Values, Root>(_ initializer: @escaping (Values) -> Root) -> Self
  where Self == Destructure<Values, Root> {
    .init(initializer: initializer)
  }
}

// TODO: `Parser` namespace? Or `Conversions` namespace?
public struct Destructure<Values, Root>: ParserPrinter {
  @usableFromInline
  let initializer: (Values) -> Root

  @inlinable
  public func parse(_ input: inout Values) -> Root? {
    self.initializer(input)
  }

  @inlinable
  public func print(_ output: Root) -> Values? {
    unsafeBitCast(output, to: Values.self)
  }
}
