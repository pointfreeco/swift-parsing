/// A parser that consumes whitespace from the beginning of input.
public struct Whitespace<Input: Collection, Bytes: Collection>: Parser
where
  Input.SubSequence == Input,
  Bytes.Element == UTF8.CodeUnit,
  Bytes.SubSequence == Bytes
{
  public enum Configuration {
    case all
    case horizontal
    case vertical
  }

  public let configuration: Configuration

  @usableFromInline
  let toBytes: (Input) -> Bytes

  @usableFromInline
  let fromBytes: (Bytes) -> Input

  @inlinable
  public func parse(_ input: inout Input) {
    var bytes = self.toBytes(input)
    defer { input = self.fromBytes(bytes) }

    @inline(__always)
    func consumeHorizontal() -> Bool {
      // Unicode chars from `CharacterSet.whitespaces`
      // General category Zs + \t
      switch bytes.first {
      case 0x20, 0x9:  // U+0020, \t (U+0009)
        bytes.removeFirst()
        return true

      case 194:  // U+00A0
        if bytes.dropFirst().first == 0xA0 {
          bytes.removeFirst(2)
          return true
        }
        return false

      case 225:  // U+1680
        if bytes.dropFirst().first == 154,
          bytes.dropFirst(2).first == 128
        {
          bytes.removeFirst(3)
          return true
        }
        return false

      case 226:  // U+2000 ~ U+200A, U+202F
        switch bytes.dropFirst().first {
        case 128:
          if let byte = bytes.dropFirst(2).first,
            (128...138).contains(byte) || byte == 175
          {
            bytes.removeFirst(3)
            return true
          }
          return false

        case 129:  // U+205F
          if bytes.dropFirst(2).first == 159 {
            bytes.removeFirst(3)
            return true
          }
          return false

        default:
          return false
        }

      case 227:  // U+3000
        if bytes.dropFirst().starts(with: [128, 128]) {
          bytes.removeFirst(3)
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
      switch bytes.first {
      case 0xA, 0xB, 0xC, 0xD:  // U+000A ~ U+000D
        bytes.removeFirst()
        return true

      case 194:  // U+0085
        if bytes.dropFirst().first == 0x85 {
          bytes.removeFirst(2)
          return true
        }
        return false

      case 226:  // U+2028, U+2029
        if bytes.dropFirst().first == 128,
          let byte = bytes.dropFirst(2).first,
          byte == 168 || byte == 169
        {
          bytes.removeFirst(3)
          return true
        }
        return false

      default:
        return false
      }
    }

    switch self.configuration {
    case .all:
      while consumeHorizontal() || consumeVertical() {}

    case .horizontal:
      while consumeHorizontal() {}

    case .vertical:
      while consumeVertical() {}
    }
  }
}

extension Whitespace where Input == Substring, Bytes == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init(_ configuration: Configuration = .all) {
    self.configuration = configuration
    self.toBytes = { $0.utf8 }
    self.fromBytes = Substring.init
  }
}

extension Whitespace where Input == Substring.UTF8View, Bytes == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init(_ configuration: Configuration = .all) {
    self.configuration = configuration
    self.toBytes = { $0 }
    self.fromBytes = { $0 }
  }
}

extension Parsers {
  public typealias Whitespace = Parsing.Whitespace  // NB: Convenience type alias for discovery
}
