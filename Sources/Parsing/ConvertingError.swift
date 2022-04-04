@usableFromInline
struct ConvertingError: Error {
  @usableFromInline
  let message: String

  @usableFromInline
  init(_ message: String = "") {
    self.message = message
  }
}
