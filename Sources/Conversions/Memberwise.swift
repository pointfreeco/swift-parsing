extension Conversion {
  /// A conversion from a tuple of values into a struct and a struct into a tuple of values, using a
  /// memberwise initializer.
  ///
  /// Useful for transforming the output of a ``ParserPrinter`` into a struct.
  ///
  /// For example, given a simple `Coordinate` struct, we can build a parser-printer using
  /// ``memberwise(_:)``:
  ///
  /// ```swift
  /// struct Coordinate {
  ///   var x: Double
  ///   var y: Double
  /// }
  ///
  /// let coord = ParsePrint(.memberwise(Coordinate.init(x:y:))) {
  ///   "("
  ///   Double.parser()
  ///   ","
  ///   Double.parser()
  ///   ")"
  /// }
  ///
  /// try coord.parse("(1,-2)")           // Coordinate(x: 1.0, y: -2.0)
  /// coord.print(.init(x: -5, y: 10))  // "(-5.0,10.0)"
  /// ```
  ///
  /// To transform the output of a ``ParserPrinter`` into an enum, see ``Conversion/case(_:)-4j2n7``.
  ///
  /// ## Careful usage
  ///
  /// This conversion works by using the memberwise initializer you supply to ``memberwise(_:)`` in
  /// order to turn tuples into a struct, and it uses `unsafeBitcast` to turn the struct back into
  /// a tuple. Because of this, it is _not_ valid to use ``memberwise(_:)`` with anything other than
  /// the default synthesized memberwise initializer that structs are given for free by the compiler
  /// as that function most correctly maps the data inside a struct to its tuple representation,
  /// even enforcing the order of the fields.
  ///
  /// If you alter the initializer in any way you run the risk of introducing subtle bugs into
  /// your parser-printer and potentially causing crashes.
  ///
  /// For example, suppose we provided an alternative initializer to `Coordinate` above that
  /// allowed you to create a coordinate from a radius and angle measured in degrees:
  ///
  /// ```swift
  /// extension Coordinate {
  ///   init(radius: Double, angle: Double) {
  ///     self.x = radius * cos(angle * Double.pi / 180)
  ///     self.y = radius * sin(angle * Double.pi / 180)
  ///   }
  /// }
  /// ```
  ///
  /// This may seem innocent enough, but it is _not_ safe to use this initializer with
  /// ``memberwise(_:)``. The following parser-printer will correctly parse a radius and angle into
  /// an x/y coordinate:
  ///
  /// ```swift
  /// let coord = ParserPrint(.memberwise(Coordinate.init(radius:angle:))) {
  ///   Double.parser()
  ///   " @ "
  ///   Double.parser()
  ///   "°"
  /// }
  ///
  /// try coord.parse("1 @ 90°")  // (x: 0, y: 1)
  /// ```
  ///
  /// However, printing a coordinate will _not_ convert it back into a radius and angle, and
  /// instead will erroneously use (0, 1) as the radius and angle:
  ///
  /// ```swift
  /// try coord.print(.init(x: 0, y: 1))  // "0 @ 1°"
  /// ```
  ///
  /// This means this parser-printer does not round trip (see <doc:Roundtripping>), _i.e._ if we
  /// parse and input and then print that output we do not get back the original input we started
  /// with:
  ///
  /// ```swift
  /// try coord.print(try coord.parse("1 @ 90°")) == "1 @ 90°"  // ❌
  /// ```
  ///
  /// Further, it is possible to provide a custom initializer for a type that either re-orders the
  /// fields or add/removes fields, both of which will cause the underlying `unsafeBitCast` to
  /// crash. For example, we could have a `User` struct that holds onto a string for the bio and an
  /// integer for the id, and provide a custom initializer so that the id is provided first:
  ///
  /// ```swift
  /// struct User {
  ///   let bio: String
  ///   let id: Int
  ///   init(id: Int, bio: String) {
  ///     self.bio = bio
  ///     self.id = id
  ///   }
  /// }
  /// ```
  ///
  /// However, using this initializer with ``memberwise(_:)`` will cause printing to crash because
  /// it will try to bitcast a `(String, Int)` struct into a `(Int, String)` tuple:
  ///
  /// ```swift
  /// let user = ParsePrint(.memberwise(User.init(id:bio:))) {
  ///   Int.parser()
  ///   ","
  ///   Rest()
  /// }
  ///
  /// try user.print(.init(id: 42, bio: "Hello world!"))  // ❌
  /// ```
  ///
  /// - Parameter initializer: A memberwise initializer where `Values` directly maps to the memory
  ///   layout of `Root`, for example the internal, default initializer that is automatically
  ///   synthesized for structs.
  /// - Returns: A conversion that can embed a tuple of values into a struct, and destructure a
  ///   struct back into a tuple of values.
  @inlinable
  public static func memberwise<Values, Struct>(
    _ initializer: @escaping @Sendable (Values) -> Struct
  ) -> Self where Self == Conversions.Memberwise<Values, Struct> {
    .init(initializer: initializer)
  }
}

extension Conversions {
  public struct Memberwise<Values, Struct>: Conversion {
    @usableFromInline
    let initializer: @Sendable (Values) -> Struct

    @usableFromInline
      init(initializer: @escaping @Sendable (Values) -> Struct) {
      self.initializer = initializer
    }

    @inlinable
    public func apply(_ input: Values) -> Struct {
      self.initializer(input)
    }

    @inlinable
    public func unapply(_ output: Struct) throws -> Values {
      let ptr = unsafeBitCast(Struct.self as Any.Type, to: UnsafeRawPointer.self)
      guard ptr.load(as: Int.self) == 512
      else {
        throw ConvertingError(
          """
          memberwise: Can't convert \(Values.self) to non-struct type \(Struct.self). This \
          conversion should only be used with a memberwise initializer matching the memory layout \
          of the struct. The "memberwise" initializer is the internal, compiler-generated \
          initializer that specifies its arguments in the same order as the struct specifies its \
          properties.
          """
        )
      }
      guard
        MemoryLayout<Struct>.alignment == MemoryLayout<Values>.alignment,
        MemoryLayout<Struct>.size == MemoryLayout<Values>.size
      else {
        throw ConvertingError(
          """
          memberwise: Can't convert \(Values.self) type \(Struct.self) as their memory layouts \
          differ. This conversion should only be used with a memberwise initializer matching the \
          memory layout of the struct. The "memberwise" initializer is the internal, \
          compiler-generated initializer that specifies its arguments in the same order as the \
          struct specifies its properties.
          """
        )
      }
      return unsafeBitCast(output, to: Values.self)
    }
  }
}
