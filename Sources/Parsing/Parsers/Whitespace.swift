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

    @inline(__always)
    func consumeHorizontal() -> Bool {
      switch bytes.first {
      case .init(ascii: " "), .init(ascii: "\t"):
        bytes.removeFirst()
        return true

      case 194:
        if bytes.dropFirst().first == 160 {
          bytes.removeFirst(2)
          return true
        }
        return false

      case 226:
        switch bytes.dropFirst().first {
        case 128:
          if let byte = bytes.dropFirst(2).first,
            (128...138).contains(byte) || byte == 175
          {
            bytes.removeFirst(3)
            return true
          }
          return false

        case 129:
          if bytes.dropFirst(2).first == 159 {
            bytes.removeFirst(3)
            return true
          }
          return false

        default:
          return false
        }

      case 227:
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
      switch bytes.first {
      case .init(ascii: "\n"), .init(ascii: "\r"):
        bytes.removeFirst()
        return true

      case 226:
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

// NB: Swift 5.7 fails to build with a simpler `Bytes == Input` constraint
extension Whitespace where Bytes == Input.SubSequence, Bytes.SubSequence == Input {
  @inlinable
  public init<L: Length>(_ length: L, _ configuration: Configuration = .all) {
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
  public init<L: Length>(_ length: L, _ configuration: Configuration = .all) {
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
  public init<L: Length>(_ length: L, _ configuration: Configuration = .all) {
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
