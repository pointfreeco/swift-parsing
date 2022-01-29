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
  func flattened() -> Self {
    func flatten(_ depth: Int = 0) -> (Error) -> [(depth: Int, error: Error)] {
      { error in
        switch error {
        case let ParsingError.manyFailed(errors, _):
          return errors.flatMap(flatten(depth + 1))
        default:
          return [(depth, error)]
        }
      }
    }

    switch self {
    case .failed:
      return self
    case let .manyFailed(errors, context):
      return .manyFailed(
        errors.flatMap(flatten())
          .sorted {
            guard $0.depth == $1.depth else { return $0.depth > $1.depth }
            switch ($0.error, $1.error) {
            case let (lhs as ParsingError, rhs as ParsingError):
              return input(
                lhs.context.remainingInput,
                isMoreConsumedThan: rhs.context.remainingInput
              )
            case (is ParsingError, _):
              return true
            default:
              return false
            }
          }
          .map { $0.error },
        context
      )
    }
  }

  @usableFromInline
  var context: Context {
    switch self {
    case let .failed(_, context), let .manyFailed(_, context):
      return context
    }
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
    switch self.flattened() {
    case let .failed(label, context):
      return format(label: label, context: context) ?? "FAIL"

    case let .manyFailed(errors, context) where errors.isEmpty:
      #if DEBUG
        breakpoint(
          """
          ---
          "ParsingError.manyFailed" was thrown with no errors.
          ---
          """
        )
      #endif
      return format(label: "processed up to", context: context) ?? "FAIL"

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
func format(label: String, context: ParsingError.Context) -> String? {
  func formatHelp<Input>(from originalInput: Input, to remainingInput: Input) -> String? {
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

      let through = substring.reduce(
        into: position
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
        location: """
          input:\(position.line + 1):\(position.column + 1)\
          \(
            through.line == position.line
              ? (through.column == position.column ? "" : "-\(through.column)")
              : "-\(through.line):\(through.column)")
          """,
        prefix: "\(position.line + 1)",
        diagnostic: """
        \(selectedLine)
        \(String(repeating: " ", count: position.column))\
        \(String(repeating: "^", count: max(1, substring.count)))\
        \(label.isEmpty ? "" : " \(label)")
        """
      )

    case let (originalInput as Substring.UTF8View, remainingInput as Substring.UTF8View):
      return formatHelp(from: Substring(originalInput), to: Substring(remainingInput))

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
        let originalInput = elementContext.originalInput as? Substring
          ?? (elementContext.originalInput as? Substring.UTF8View).flatMap(Substring.init),
        let remainingInput = elementContext.remainingInput as? Substring
          ?? (elementContext.remainingInput as? Substring.UTF8View).flatMap(Substring.init)
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
          )
        )
        expectation = """
           \(indent)\(String(repeating: "^", count: max(1, substring.count)))\
          \(elementLabel.isEmpty ? "" : " \(elementLabel)")
          """
      } else {
        let count = slice.map(formatValue).joined(separator: ", ").count
        expectation = """
          \(String(repeating: "^", count: max(1, count)))\(label.isEmpty ? "" : " \(label)")
          """
      }

      let indent = slice.base[..<slice.startIndex].map { "\(formatValue($0.base)), " }.joined()
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

  return formatHelp(from: context.originalInput, to: context.remainingInput)
}

@usableFromInline
func formatValue<Input>(
  _ input: Input
) -> String {
  switch input {
  case let input as String:
    return input.debugDescription
  case let input as String.UTF8View:
    return String(input).debugDescription
  case let input as Substring:
    return input.debugDescription
  case let input as Substring.UTF8View:
    return Substring(input).debugDescription
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

private func input(_ lhs: Any, isMoreConsumedThan rhs: Any) -> Bool {
  switch (lhs, rhs) {
  case let (lhs as Substring, rhs as Substring):
    let lhs = lhs.endIndex == lhs.base.endIndex ? lhs[..<lhs.startIndex] : lhs
    let rhs = rhs.endIndex == rhs.base.endIndex ? rhs[..<rhs.startIndex] : rhs
    return lhs.endIndex > rhs.endIndex
  case let (lhs as Substring.UTF8View, rhs as Substring.UTF8View):
    return input(Substring(lhs), isMoreConsumedThan: Substring(rhs))
  case let (lhs as Slice<[Substring]>, rhs as Slice<[Substring]>):
    let lhs = lhs.endIndex == lhs.base.endIndex ? lhs[..<lhs.startIndex] : lhs
    let rhs = rhs.endIndex == rhs.base.endIndex ? rhs[..<rhs.startIndex] : rhs
    return lhs.endIndex > rhs.endIndex
  default:
    return false
  }
}
