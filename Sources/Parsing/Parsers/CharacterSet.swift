import Foundation

extension CharacterSet: Parser {
  @inlinable
  public func parse(_ input: inout Substring) -> Substring? {
    let output = input.unicodeScalars
      .prefix(EnvironmentValues.shared.maximum)
      .prefix(while: self.contains)
    guard output.count >= EnvironmentValues.shared.minimum
    else {
      return nil
    }
    input.unicodeScalars.removeFirst(output.count)
    return Substring(output)
  }
}
