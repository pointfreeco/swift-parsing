/// A parser that consumes whitespace from the beginning of input.
public struct Whitespace<Input: Collection>: Parser
where
  Input.SubSequence == Input,
  Input.Element == UTF8.CodeUnit
{
  public enum Configuration {
    case all
    case horizontal
    case vertical
  }

  public let configuration: Configuration

  @usableFromInline
  let maximum: Int?

  @usableFromInline
  let minimum: Int

  @inlinable
  public init<R: CountingRange>(_ length: R, _ configuration: Configuration = .all) {
    self.minimum = length.minimum
    self.maximum = length.maximum
    self.configuration = configuration
  }

  @inlinable
  public init(_ configuration: Configuration = .all) {
    self.init(0..., configuration)
  }

  @inlinable
  public func parse(_ input: inout Input) throws {
    @inline(__always)
    func consumeHorizontal() -> Bool {
      // Unicode chars from `CharacterSet.whitespaces`
      // General category Zs + \t
      switch input.first {
      case 0x20, 0x9:  // U+0020, \t (U+0009)
        input.removeFirst()
        return true

      case 194:  // U+00A0
        if input.dropFirst().first == 0xA0 {
          input.removeFirst(2)
          return true
        }
        return false

      case 225:  // U+1680
        if input.dropFirst().first == 154,
          input.dropFirst(2).first == 128
        {
          input.removeFirst(3)
          return true
        }
        return false

      case 226:  // U+2000 ~ U+200A, U+202F
        switch input.dropFirst().first {
        case 128:
          if let byte = input.dropFirst(2).first,
            (128...138).contains(byte) || byte == 175
          {
            input.removeFirst(3)
            return true
          }
          return false

        case 129:  // U+205F
          if input.dropFirst(2).first == 159 {
            input.removeFirst(3)
            return true
          }
          return false

        default:
          return false
        }

      case 227:  // U+3000
        if input.dropFirst().starts(with: [128, 128]) {
          input.removeFirst(3)
          return true
        }
        return false

      default:
        return false
      }
    }

    @inline(__always)
    func consumeVertical() -> Bool {
      // Unicode chars from `CharacterSet.newlines`
      switch input.first {
      case 0xA, 0xB, 0xC, 0xD:  // U+000A ~ U+000D
        input.removeFirst()
        return true

      case 194:  // U+0085
        if input.dropFirst().first == 0x85 {
          input.removeFirst(2)
          return true
        }
        return false

      case 226:  // U+2028, U+2029
        if input.dropFirst().first == 128,
          let byte = input.dropFirst(2).first,
          byte == 168 || byte == 169
        {
          input.removeFirst(3)
          return true
        }
        return false

      default:
        return false
      }
    }

    var count = 0

    switch self.configuration {
    case .all:
      while self.maximum.map({ count < $0 }) ?? true, consumeHorizontal() || consumeVertical() {
        count += 1
      }

    case .horizontal:
      while self.maximum.map({ count < $0 }) ?? true, consumeHorizontal() { count += 1 }

    case .vertical:
      while self.maximum.map({ count < $0 }) ?? true, consumeVertical() { count += 1 }
    }

    guard count >= self.minimum else {
      let atLeast = self.minimum - count
      throw ParsingError.expectedInput(
        """
        \(self.minimum - count) \(count == 0 ? "" : "more ")whitespace
        character\(atLeast == 1 ? "" : "s")
        """,
        at: input
      )
    }
  }
}

extension Whitespace where Input == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init<R: CountingRange>(_ length: R, _ configuration: Configuration = .all) {
    self.minimum = length.minimum
    self.maximum = length.maximum
    self.configuration = configuration
  }

  @_disfavoredOverload
  @inlinable
  public init(_ configuration: Configuration = .all) {
    self.init(0..., configuration)
  }
}

extension Parsers {
  public typealias Whitespace = Parsing.Whitespace  // NB: Convenience type alias for discovery
}
