extension String: Parser {
  public func parse(_ input: inout Substring) -> Void? {
    guard input.starts(with: self)
    else { return nil }
    input.removeFirst(self.count)
    return ()
  }
}

extension String.UTF8View: Parser {
  public func parse(_ input: inout Substring.UTF8View) -> Void? {
    guard input.starts(with: self)
    else { return nil }
    input.removeFirst(self.count)
    return ()
  }
}
