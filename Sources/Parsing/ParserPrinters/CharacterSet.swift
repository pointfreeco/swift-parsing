import Foundation

extension CharacterSet: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Substring) -> Substring {
    let output = input.unicodeScalars.prefix(while: self.contains)
    input.unicodeScalars.removeFirst(output.count)
    return Substring(output)
  }

  @inlinable
  public func print(_ output: Substring, to input: inout Substring) throws {
    guard output.unicodeScalars.allSatisfy(self.contains)
    else { throw PrintingError() }
    input.prepend(contentsOf: output)
  }
}
