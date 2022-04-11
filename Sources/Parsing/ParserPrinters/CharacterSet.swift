import Foundation

extension CharacterSet: ParserPrinter {
  @inlinable
  public func parse(_ input: inout Substring) -> Substring {
    let output = input.unicodeScalars.prefix(while: self.contains)
    input.unicodeScalars.removeFirst(output.count)
    return Substring(output)
  }

  @inlinable
  public func print(_ output: Substring, into input: inout Substring) throws {
    let prefix = output.unicodeScalars.prefix(while: self.contains)
    guard prefix.endIndex == output.unicodeScalars.endIndex
    else {
      let indent = String(repeating: " ", count: Substring(prefix).debugDescription.count - 1)
      throw PrintingError.failed(
        summary: """
          round-trip expectation failed

          A character set does not contain a character to be printed.

          \(output.debugDescription)
          \(indent)^ not found in set

          \(self)

          During a round-trip, the character set would have failed to parse this character, which \
          means its data is in an invalid state.
          """,
        input: input
      )
    }

    guard input.first?.unicodeScalars.allSatisfy(self.contains) != true
    else {
      var prefix = input.prefix(70)
      if prefix.endIndex != input.endIndex { prefix.append("…") }
      throw PrintingError.failed(
        summary: """
          round-trip expectation failed

          A character set contains a character that is printed by the next printer.

          \(prefix.debugDescription)
           ^ found in set

          \(self)

          During a round-trip, the character set would have parsed this character, which means the \
          data handed to the next printer is in an invalid state.
          """,
        input: input
      )
    }

    input.prepend(contentsOf: output)
  }
}
