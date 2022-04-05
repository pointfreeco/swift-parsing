@resultBuilder
public enum PathBuilder {
  @inlinable
  public static func buildExpression<P: Parser>(_ parser: P) -> P {
    parser
  }

  @inlinable
  public static func buildExpression<P: Parser>(_ parser: P) -> P where P.Input == Substring {
    parser
  }

  @inlinable
  public static func buildExpression<P: Parser>(_ parser: P) -> FromUTF8View<P> {
    ParserBuilder.buildExpression(parser)
  }

  @inlinable
  public static func buildBlock<P: Parser>(_ parser: P) -> PathComponent<P> {
    .init(parser)
  }
}
