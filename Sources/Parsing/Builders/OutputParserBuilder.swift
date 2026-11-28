// TODO: Rename to `ParserBuilder`, and rename `ParserBuilder` to `PartialParserBuilder`, in 1.0.
@resultBuilder
public final class _OutputParserBuilder<Input, Output>: ParserBuilder<Input> {
  @_disfavoredOverload
  @inlinable
  public static func buildExpression<P: Parser<Input, Output>>(_ parser: P) -> P {
    parser
  }
}
