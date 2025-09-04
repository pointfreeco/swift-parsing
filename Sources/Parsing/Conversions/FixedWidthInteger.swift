extension Conversion where Self == Conversions.BinaryFloatingPointToFixedWidthInteger<Double, Int> {
  /// A conversion from a `Double` to an `Int`.
  ///
  /// This conversion can be used to transform a ``ParserPrinter``'s double output into an integer
  /// output, rounding toward zero.
  ///
  /// ```swift
  /// Double.parser().map(.int).parse("123.45")  // 123
  /// ```
  @inlinable
  public static var int: Self { .init() }
}

extension Conversion where Output == Double {
  /// Transforms this conversion to `Double` into a conversion to `Int`.
  ///
  /// A fluent version of ``Conversion/int-swift.type.property``. Equivalent to calling ``map(_:)``
  /// with ``Conversion/int-swift.type.property``:
  ///
  /// ```swift
  /// doubleConversion.int
  /// // =
  /// doubleConversion.map(.int)
  /// ```
  @inlinable
  public var int:
    Conversions.Map<
      Self, Conversions.BinaryFloatingPointToFixedWidthInteger<Double, Int>
    >
  { self.map(.int) }
}

extension Conversions {
  /// A conversion from a `Double` to an `Int`.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/int-swift.type.property`` operation, which constructs this type.
  public struct BinaryFloatingPointToFixedWidthInteger<
    Input: BinaryFloatingPoint, Output: FixedWidthInteger
  >: Conversion, Sendable {
    @usableFromInline
    init() {}

    @inlinable
    public func apply(_ input: Input) -> Output {
      .init(input)
    }

    @inlinable
    public func unapply(_ output: Output) -> Input {
      .init(output)
    }
  }
}
