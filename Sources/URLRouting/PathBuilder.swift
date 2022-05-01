@resultBuilder
public enum PathBuilder {
  @inlinable
  public static func buildBlock<P: Parser>(_ parser: P) -> PathComponent<P> {
    .init(parser)
  }
}
