extension Conversion {
  /// Converts a tuple of values into a struct, and a struct into a tuple of values.
  ///
  /// Useful for transforming the output of parser-printers into structs.
  ///
  /// For example, given a simple `Coordinate` struct, we can build a parser-printer using `struct`:
  ///
  /// ```swift
  /// struct Coordinate {
  ///   var x: Double
  ///   var y: Double
  /// }
  ///
  /// let coord = ParsePrint(.struct(Coordinate.init(x:y:))) {
  ///   Double.parser()
  ///   ","
  ///   Double.parser()
  /// }
  ///
  /// try coord.parse("1,-2")           // Coordinate(x: 1.0, y: -2.0)
  /// coord.print(.init(x: -5, y: 10))  // "-5.0,10.0"
  /// ```
  ///
  /// - Parameter initializer: A memberwise initializer where `Values` directly maps to the memory
  ///   layout of `Root`, for example the internal, default initializer that is automatically
  ///   synthesized for structs.
  /// - Returns: A conversion that can embed a tuple of values into a struct, and destructure a
  ///   struct back into a tuple of values.
  @inlinable
  public static func `struct`<Values, Struct>(
    _ initializer: @escaping (Values) throws -> Struct
  ) -> Self where Self == Conversions.Structure<Values, Struct> {
    .init(initializer: initializer)
  }
}

extension Conversions {
  public struct Structure<Values, Struct>: Conversion {
    @usableFromInline
    let initializer: (Values) throws -> Struct

    @usableFromInline
    init(initializer: @escaping (Values) throws -> Struct) {
      self.initializer = initializer
    }

    @inlinable
    public func apply(_ input: Values) throws -> Struct {
      try self.initializer(input)
    }

    @inlinable
    public func unapply(_ output: Struct) throws -> Values {
      // TODO: Use runtime to determine if `Struct` is a struct
      // TODO: Use runtime to iterate over `Struct` and `Values` to compare memory layout
      guard
        MemoryLayout<Struct>.alignment == MemoryLayout<Struct>.alignment,
        MemoryLayout<Struct>.size == MemoryLayout<Struct>.size
      else { throw ConvertingError() }
      return unsafeBitCast(output, to: Values.self)
    }
  }
}
