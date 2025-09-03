@usableFromInline
enum PrintingError: Error {
  case failed(Context)
  case manyFailed([any Error], Context)

  @available(*, deprecated)
  @usableFromInline
  init() {
    self = .failed(.init(input: "", debugDescription: ""))
  }

  @usableFromInline
  static func failed(summary: String, input: Any) -> Self {
    .failed(.init(input: input, debugDescription: summary))
  }

  @usableFromInline
  static func manyFailed(_ errors: [any Error], at input: Any) -> Self {
    .manyFailed(errors, .init(input: input, debugDescription: ""))
  }

  @usableFromInline
  var context: Context {
    switch self {
    case let .failed(context), let .manyFailed(_, context):
      return context
    }
  }

  @usableFromInline
  func flattened() -> Self {
    func flatten(_ depth: Int = 0) -> (any Error) -> [(depth: Int, error: any Error)] {
      { error in
        switch error {
        case let PrintingError.manyFailed(errors, _):
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
            switch ($0.error, $1.error) {
            case let (lhs as PrintingError, rhs as PrintingError):
              return lhs.context > rhs.context
            default:
              return $0.depth > $1.depth
            }
          }
          .map { $0.error },
        context
      )
    }
  }

  @usableFromInline
  struct Context {
    @usableFromInline
    var debugDescription: String

    @usableFromInline
    var input: Any

    @usableFromInline
    var underlyingError: (any Error)?

    @usableFromInline
    init(
      input: Any,
      debugDescription: String,
      underlyingError: (any Error)? = nil
    ) {
      self.input = input
      self.debugDescription = debugDescription
      self.underlyingError = underlyingError
    }
  }
}

extension PrintingError: CustomDebugStringConvertible {
  @usableFromInline
  var debugDescription: String {
    switch self.flattened() {
    case let .failed(context):
      return "error: \(context.debugDescription)"

    case let .manyFailed(errors, _):
      return errors.count == 1
        ? "\(errors[0])"
        : """
        error: multiple failures occurred

        \(errors.map { "\($0)" }.joined(separator: "\n\n"))
        """
    }
  }
}

extension PrintingError.Context {
  fileprivate static func > (lhs: Self, rhs: Self) -> Bool {
    switch (describe(lhs.input), describe(rhs.input)) {
    case let (lhsInput?, rhsInput?):
      return lhsInput.count > rhsInput.count

    default:
      return false
    }
  }
}

@usableFromInline
func describe(_ input: Any) -> String? {
  // TODO: Use `_openExistential` for `C: Collection`?
  switch input {
  case let input as Substring:
    return input.base

  case let input as Substring.UnicodeScalarView:
    return describe(Substring(input))

  case let input as Substring.UTF8View:
    return describe(Substring(input))

  case let input as String:
    return input

  case let input as String.UTF8View:
    return String(input)

  default:
    return nil
  }
}
