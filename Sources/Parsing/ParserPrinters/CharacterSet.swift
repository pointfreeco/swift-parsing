import Foundation

extension CharacterSet: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Substring) -> Substring? {
    let output = input.unicodeScalars.prefix(while: self.contains)
    input.unicodeScalars.removeFirst(output.count)
    return Substring(output)
  }

  public func print(_ output: Substring) -> Substring? {
    output.unicodeScalars.allSatisfy(self.contains) ? output : nil
  }
}
