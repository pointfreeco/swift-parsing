import Foundation

extension Conversion where Self == Conversions.FixedWidthIntegerToBinaryFloatingPoint<Int, Double> {
  /// A conversion from an `Int` to a `Double`.
  ///
  /// This conversion can be used to transform a ``ParserPrinter``'s integer output into a double
  /// output:
  ///
  /// ```swift
  /// Digits().map(.double).parse("123")  // ✅ 123.0
  /// 
  /// Digits().map(.double).parse("123.0")  // ❌
  /// // error: unexpected input
  /// //  --> input:1:4
  /// // 1 | 123.0
  /// //   |    ^ expected end of input
  /// ```
  @inlinable
  public static var double: Self { .init() }
}

extension Conversion where Output == Int {
  /// Transforms this conversion to `Int` into a conversion to `Double`.
  ///
  /// A fluent version of ``Conversion/double-swift.type.property``. Equivalent to calling
  /// ``map(_:)`` with ``Conversion/double-swift.type.property``:
  ///
  /// ```swift
  /// intConversion.double
  /// // =
  /// intConversion.map(.double)
  /// ```
  @inlinable
  public var double:
    Conversions.Map<
      Self, Conversions.FixedWidthIntegerToBinaryFloatingPoint<Int, Double>
    >
  { self.map(.double) }
}

extension Conversions {
  /// A conversion from an `Int` to a `Double`.
  ///
  /// You will not typically need to interact with this type directly. Instead you will usually use
  /// the ``Conversion/double-swift.type.property`` operation, which constructs this type.
  public struct FixedWidthIntegerToBinaryFloatingPoint<
    Input: FixedWidthInteger, Output: BinaryFloatingPoint
  >: Conversion {
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
