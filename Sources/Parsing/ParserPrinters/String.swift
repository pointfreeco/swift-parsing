extension String: Parser {
  @inlinable
  public func parse(_ input: inout Substring) -> Void? {
    guard input.starts(with: self) else { return nil }
    input.removeFirst(self.count)
    return ()
  }
}

extension String: Printer {
  @inlinable
  public func print(_ output: Void) -> Substring? {
    self[...]
  }
}
