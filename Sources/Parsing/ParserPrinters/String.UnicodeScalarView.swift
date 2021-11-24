extension String.UnicodeScalarView: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Substring.UnicodeScalarView) -> Void? {
    guard input.starts(with: self) else { return nil }
    input.removeFirst(self.count)
    return ()
  }

  @inlinable
  public func print(_ output: Void) -> Substring.UnicodeScalarView? {
    String(self)[...].unicodeScalars
  }
}
