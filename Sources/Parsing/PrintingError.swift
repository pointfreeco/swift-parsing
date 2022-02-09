@usableFromInline
struct PrintingError: Error {
  @usableFromInline
  init() {}

  @usableFromInline
  static func manyFailed(_: [Error], at _: Any) -> Self {
    .init()
  }
}
