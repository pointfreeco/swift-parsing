@resultBuilder
public enum PathBuilder {
  @inlinable
  public static func buildPartialBlock<P>(first: P) -> PathComponent<P> {
    .init(first)
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1>(
    accumulated: P0, next: P1
  ) -> ParserBuilder.SkipFirst<P0, PathComponent<P1>> {
    ParserBuilder.buildPartialBlock(accumulated: accumulated, next: .init(next))
  }

  @inlinable
  public static func buildPartialBlock<P0, P1>(
    accumulated: P0, next: P1
  ) -> ParserBuilder.SkipSecond<P0, PathComponent<P1>> {
    ParserBuilder.buildPartialBlock(accumulated: accumulated, next: .init(next))
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1>(
    accumulated: P0, next: P1
  ) -> ParserBuilder.Take2<P0, PathComponent<P1>> {
    ParserBuilder.buildPartialBlock(accumulated: accumulated, next: .init(next))
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1>(
    accumulated: P0, next: P1
  ) -> ParserBuilder.Take3<P0, PathComponent<P1>, O0, O1> {
    ParserBuilder.buildPartialBlock(accumulated: accumulated, next: .init(next))
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1, O2>(
    accumulated: P0, next: P1
  ) -> ParserBuilder.Take4<P0, PathComponent<P1>, O0, O1, O2> {
    ParserBuilder.buildPartialBlock(accumulated: accumulated, next: .init(next))
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1, O2, O3>(
    accumulated: P0, next: P1
  ) -> ParserBuilder.Take5<P0, PathComponent<P1>, O0, O1, O2, O3> {
    ParserBuilder.buildPartialBlock(accumulated: accumulated, next: .init(next))
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1, O2, O3, O4>(
    accumulated: P0, next: P1
  ) -> ParserBuilder.Take6<P0, PathComponent<P1>, O0, O1, O2, O3, O4> {
    ParserBuilder.buildPartialBlock(accumulated: accumulated, next: .init(next))
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1, O2, O3, O4, O5>(
    accumulated: P0, next: P1
  ) -> ParserBuilder.Take7<P0, PathComponent<P1>, O0, O1, O2, O3, O4, O5> {
    ParserBuilder.buildPartialBlock(accumulated: accumulated, next: .init(next))
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1, O2, O3, O4, O5, O6>(
    accumulated: P0, next: P1
  ) -> ParserBuilder.Take8<P0, PathComponent<P1>, O0, O1, O2, O3, O4, O5, O6> {
    ParserBuilder.buildPartialBlock(accumulated: accumulated, next: .init(next))
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1, O2, O3, O4, O5, O6, O7>(
    accumulated: P0, next: P1
  ) -> ParserBuilder.Take9<P0, PathComponent<P1>, O0, O1, O2, O3, O4, O5, O6, O7> {
    ParserBuilder.buildPartialBlock(accumulated: accumulated, next: .init(next))
  }

  @_disfavoredOverload
  @inlinable
  public static func buildPartialBlock<P0, P1, O0, O1, O2, O3, O4, O5, O6, O7, O8>(
    accumulated: P0, next: P1
  ) -> ParserBuilder.Take10<P0, PathComponent<P1>, O0, O1, O2, O3, O4, O5, O6, O7, O8> {
    ParserBuilder.buildPartialBlock(accumulated: accumulated, next: .init(next))
  }
}
