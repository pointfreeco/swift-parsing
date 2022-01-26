import Foundation

@usableFromInline
enum ParsingError: Error {
  case failed(String, Context)
  case manyFailed([Error], Context)

  @usableFromInline
  static func expectedInput(_ description: String, at remainingInput: Any) -> Self {
    .failed(
      summary: "unexpected input",
      label: "expected \(description)",
      at: remainingInput
    )
  }

  @usableFromInline
  static func expectedInput(
    _ description: String,
    from originalInput: Any,
    to remainingInput: Any
  ) -> Self {
    .failed(
      summary: "unexpected input",
      label: "expected \(description)",
      from: originalInput,
      to: remainingInput
    )
  }

  @usableFromInline
  static func failed(summary: String, label: String = "", at remainingInput: Any) -> Self {
    .failed(label, .init(remainingInput: remainingInput, debugDescription: summary))
  }

  @usableFromInline
  static func failed(
    summary: String, label: String = "", from originalInput: Any, to remainingInput: Any
  ) -> Self {
    .failed(
      label,
      .init(
        originalInput: originalInput,
        remainingInput: remainingInput,
        debugDescription: summary
      )
    )
  }

  @usableFromInline
  static func manyFailed(_ errors: [Error], at remainingInput: Any) -> Self {
    .manyFailed(errors, .init(remainingInput: remainingInput, debugDescription: ""))
  }

  @usableFromInline
  struct Context {
    @usableFromInline
    var debugDescription: String

    @usableFromInline
    var originalInput: Any

    @usableFromInline
    var remainingInput: Any

    @usableFromInline
    var underlyingError: Error?

    @usableFromInline
    init(
      originalInput: Any,
      remainingInput: Any,
      debugDescription: String,
      underlyingError: Error? = nil
    ) {
      self.originalInput = originalInput
      self.remainingInput = remainingInput
      self.debugDescription = debugDescription
      self.underlyingError = underlyingError
    }

    @usableFromInline
    init(
      remainingInput: Any,
      debugDescription: String,
      underlyingError: Error? = nil
    ) {
      self.originalInput = remainingInput
      self.remainingInput = remainingInput
      self.debugDescription = debugDescription
      self.underlyingError = underlyingError
    }
  }
}

extension ParsingError: CustomDebugStringConvertible {
  @usableFromInline
  var debugDescription: String {
    switch self {
    case let .failed(label, context):
      func format<Input>(from originalInput: Input, to remainingInput: Input) -> String? {
        switch (originalInput, remainingInput) {
        case let (originalInput as Substring, remainingInput as Substring):
          let input = originalInput.startIndex == remainingInput.startIndex
            ? originalInput
            : originalInput.base[originalInput.startIndex..<remainingInput.startIndex]
          let substring = input.endIndex == input.base.endIndex
            ? input[..<input.startIndex]
            : input

          let position = substring.base[..<substring.startIndex].reduce(
            into: (0, 0)
          ) { (position: inout (line: Int, column: Int), character: Character) in
            if character.isNewline {
              position.line += 1
              position.column = 0
            } else {
              position.column += 1
            }
          }

          let selectedLine = substring.base[
            substring.base.index(substring.startIndex, offsetBy: -position.column)..<(
              substring.base[substring.startIndex...].firstIndex(where: \.isNewline)
              ?? substring.base.endIndex
            )]

          return formatError(
            summary: context.debugDescription,
            location: "input:\(position.line + 1):\(position.column + 1)",
            prefix: "\(position.line + 1)",
            diagnostic: """
              \(selectedLine)
              \(String(repeating: " ", count: position.column))\
              \(String(repeating: "^", count: max(1, substring.count)))\
              \(label.isEmpty ? "" : " \(label)")
              """
          )

        case let (originalInput as Substring.UTF8View, remainingInput as Substring.UTF8View):
          return format(from: Substring(originalInput), to: Substring(remainingInput))

        case let (originalInput as Slice<[Substring]>, remainingInput as Slice<[Substring]>):
          let input = originalInput.startIndex == remainingInput.startIndex
            ? originalInput
            : originalInput.base[originalInput.startIndex..<remainingInput.startIndex]
          let slice = input.endIndex == input.base.endIndex
            ? input[..<input.startIndex]
            : input

          let expectation: String
          if
            let error = context.underlyingError as? ParsingError,
            case let .failed(elementLabel, elementContext) = error,
            let originalInput = elementContext.originalInput as? Substring,
            let remainingInput = elementContext.remainingInput as? Substring
          {
            let input = originalInput.startIndex == remainingInput.startIndex
              ? originalInput
              : originalInput.base[originalInput.startIndex..<remainingInput.startIndex]
            let substring = input.endIndex == input.base.endIndex
              ? input[..<input.startIndex]
              : input
            let indent = String(
              repeating: " ",
              count: substring.distance(
                from: substring.base.startIndex,
                to: substring.startIndex
              ) + 1
            )
            expectation = """
              \(indent)\(String(repeating: "^", count: max(1, substring.count)))\
              \(elementLabel.isEmpty ? "" : " \(elementLabel)")
              """
          } else {
            let count = slice.map { "\"\($0)\"" }.joined(separator: ", ").count
            expectation = """
              \(String(repeating: "^", count: max(1, count)))\(label.isEmpty ? "" : " \(label)")
              """
          }

          let indent = slice.base[..<slice.startIndex].map { "\"\($0.base)\", " }.joined()
          return formatError(
            summary: context.debugDescription,
            location: "input[\(slice.startIndex)]",
            prefix: "\(slice.startIndex)",
            diagnostic: """
              \(slice.base)
              \(String(repeating: " ", count: indent.count + 1))\(expectation)
              """
          )

        default:
          return nil
        }
      }
      return format(from: context.originalInput, to: context.remainingInput) ?? "FAIL"

    case let .manyFailed(errors, _):
      let failures = errors
        .map { ($0 as? ParsingError)?.debugDescription ?? $0.localizedDescription }
        .joined(separator: "\n\n")

      return """
        error: multiple failures occurred

        \(failures)
        """
    }
  }
}

@usableFromInline
func formatValue<Input>(
  _ input: Input
) -> String {
  switch input {
  case let input as Substring:
    return input.debugDescription
  case let input as Substring.UTF8View:
    return formatValue(Substring(input))
  default:
    return "\(input)"
  }
}

private func formatError(
  summary: String,
  location: String,
  prefix: String,
  diagnostic: String
) -> String {
  let indent = String(repeating: " ", count: prefix.count)
  var diagnostic = diagnostic
    .split(separator: "\n", omittingEmptySubsequences: false)
    .map { "\(indent) |\($0.isEmpty ? "" : " \($0)")" }
    .joined(separator: "\n")
  diagnostic.replaceSubrange(..<indent.endIndex, with: prefix)
  return """
    error: \(summary)
    \(indent)--> \(location)
    \(diagnostic)
    """
}
