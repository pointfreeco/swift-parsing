import Foundation

extension CharacterSet: Parser {
  @inlinable
  public func parse(_ input: inout Substring) -> Substring? {
    var output = input.unicodeScalars
    if let max = ParserEnvironmentValues.current.maximum {
      output = output.prefix(max)
    }
    output = output.prefix(while: self.contains)
    guard output.count >= ParserEnvironmentValues.current.minimum
    else {
      return nil
    }
    input.unicodeScalars.removeFirst(output.count)
    return Substring(output)
  }
}
