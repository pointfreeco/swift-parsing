extension Array: Parser where Element: Equatable {
  @inlinable
  public func parse(_ input: inout SubSequence) -> Void? {
    guard input.starts(with: self) else { return nil }
    input.removeFirst(self.count)
    return ()
  }
}

extension Array: Printer {
  @inlinable
  public func print(_ output: Void) -> SubSequence? {
    self[...]
  }
}
