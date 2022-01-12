public struct UnsafeBitCast<Values, Root>: ParserPrinter {
  @usableFromInline
  let initializer: (Values) -> Root

  @inlinable
  public init(_ initializer: @escaping (Values) -> Root) {
    self.initializer = initializer
  }

  @inlinable
  public func parse(_ input: inout Values) -> Root? {
    self.initializer(input)
  }

  @inlinable
  public func print(_ output: Root) -> Values? {
    unsafeBitCast(output, to: Values.self)
  }
}
