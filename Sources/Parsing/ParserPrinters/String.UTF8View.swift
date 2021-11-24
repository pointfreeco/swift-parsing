extension String.UTF8View: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Substring.UTF8View) -> Void? {
    guard input.starts(with: self) else { return nil }
    input.removeFirst(self.count)
    return ()
  }

  @inlinable
  public func print(_ output: Void) -> Substring.UTF8View? {
    String(self)[...].utf8
  }
}
