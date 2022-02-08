extension Conversion {
  @inlinable
  public static func `struct`<Values, Root>(
    _ initializer: @escaping (Values) -> Root
  ) -> Self where Self == Conversions.Structure<Values, Root> {
    .init(initializer: initializer)
  }
}

extension Conversions {
  public struct Structure<Values, Root>: Conversion {
    @usableFromInline
    let initializer: (Values) -> Root

    @usableFromInline
    init(initializer: @escaping (Values) -> Root) {
      self.initializer = initializer
    }

    @inlinable
    public func apply(_ input: Values) -> Root {
      self.initializer(input)
    }

    @inlinable
    public func unapply(_ output: Root) throws -> Values {
      guard MemoryLayout<Values>.size == MemoryLayout<Root>.size
      else { throw ConvertingError() }
      return unsafeBitCast(output, to: Values.self)
    }
  }
}
