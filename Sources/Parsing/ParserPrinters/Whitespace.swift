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
  let maximum: Int?

  @usableFromInline
  let minimum: Int

  @usableFromInline
  let toBytes: (Input) -> Bytes

  @usableFromInline
  let fromBytes: (Bytes) -> Input

  @inlinable
  public func parse(_ input: inout Input) throws {
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

    input = self.fromBytes(bytes)

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

extension Whitespace: ParserPrinter
where Input: PrependableCollection, Bytes: PrependableCollection {
  @inlinable
  public func print(_ output: (), into input: inout Input) {
    var bytes = Bytes()
    defer { input.prepend(contentsOf: self.fromBytes(bytes)) }

    switch self.configuration {
    case .all, .horizontal:
      for _ in 0..<self.minimum {
        bytes.prepend(.init(ascii: " "))
      }

    case .vertical:
      for _ in 0..<self.minimum {
        bytes.prepend(.init(ascii: "\n"))
      }
    }
  }
}

// NB: Swift 5.7 fails to build with a simpler `Bytes == Input` constraint
extension Whitespace where Bytes == Input.SubSequence, Bytes.SubSequence == Input {
  @inlinable
  public init<R: CountingRange>(_ length: R, _ configuration: Configuration = .all) {
    self.minimum = length.minimum
    self.maximum = length.maximum
    self.configuration = configuration
    self.toBytes = { $0 }
    self.fromBytes = { $0 }
  }

  @inlinable
  public init(_ configuration: Configuration = .all) {
    self.init(0..., configuration)
  }
}

extension Whitespace where Input == Substring, Bytes == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init<R: CountingRange>(_ length: R, _ configuration: Configuration = .all) {
    self.minimum = length.minimum
    self.maximum = length.maximum
    self.configuration = configuration
    self.toBytes = { $0.utf8 }
    self.fromBytes = Substring.init
  }

  @_disfavoredOverload
  @inlinable
  public init(_ configuration: Configuration = .all) {
    self.init(0..., configuration)
  }
}

extension Whitespace where Input == Substring.UTF8View, Bytes == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init<R: CountingRange>(_ length: R, _ configuration: Configuration = .all) {
    self.init(length, configuration)
  }

  @_disfavoredOverload
  @inlinable
  public init(_ configuration: Configuration = .all) {
    self.init(configuration)
  }
}

extension Parsers {
  public typealias Whitespace = Parsing.Whitespace  // NB: Convenience type alias for discovery
}
