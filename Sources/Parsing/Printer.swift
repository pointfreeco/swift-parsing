public protocol Printer {
  associatedtype Input
  associatedtype Output
  func print(_ output: Output) -> Input?
}

extension Printer where Output == Void {
  @inlinable
  public func print() -> Input? {
    self.print(())
  }
}
