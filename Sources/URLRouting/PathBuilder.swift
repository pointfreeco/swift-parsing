@resultBuilder
public enum PathBuilder {
  @inlinable
  public static func buildBlock<P>(_ parser: P) -> PathComponent<P> where P: Parser {
    .init(parser)
  }
}
