extension Conversion {
  @inlinable
  public static func destructure<Values, Root>(
    _ initializer: @escaping (Values) -> Root
  ) -> Self where Self == Conversions.Destructure<Values, Root> {
    .init(initializer: initializer)
  }
}

extension Conversions {
  public struct Destructure<Values, Root>: Conversion {
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
    public func unapply(_ output: Root) -> Values {
      unsafeBitCast(output, to: Values.self)
    }
  }
}
