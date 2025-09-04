/// A parser that consumes whitespace from the beginning of input.
public struct Whitespace<Length: CountingRange, InputToBytes: Conversion>: Parser
where
  InputToBytes.Input: Collection,
  InputToBytes.Input.SubSequence == InputToBytes.Input,
  InputToBytes.Output: Collection,
  InputToBytes.Output.Element == UTF8.CodeUnit,
  InputToBytes.Output.SubSequence == InputToBytes.Output
{
  public enum Configuration: Sendable {
    case all
    case horizontal
    case vertical
  }

  public let configuration: Configuration

  @usableFromInline
  let length: Length

  @usableFromInline
  let inputToBytes: InputToBytes

  @inlinable
  public func parse(_ input: inout InputToBytes.Input) throws {
    var bytes = try self.inputToBytes.apply(input)

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
      while self.length.maximum.map({ count < $0 }) ?? true,
        consumeHorizontal() || consumeVertical()
      {
        count += 1
      }

    case .horizontal:
      while self.length.maximum.map({ count < $0 }) ?? true, consumeHorizontal() { count += 1 }

    case .vertical:
      while self.length.maximum.map({ count < $0 }) ?? true, consumeVertical() { count += 1 }
    }

    input = try self.inputToBytes.unapply(bytes)

    guard count >= self.length.minimum else {
      let atLeast = self.length.minimum - count
      throw ParsingError.expectedInput(
        """
        \(self.length.minimum - count) \(count == 0 ? "" : "more ")whitespace
        character\(atLeast == 1 ? "" : "s")
        """,
        at: input
      )
    }
  }
}

extension Whitespace: ParserPrinter
where InputToBytes.Input: PrependableCollection, InputToBytes.Output: PrependableCollection {
  @inlinable
  public func print(_ output: (), into input: inout Input) rethrows {
    var bytes = InputToBytes.Output()

    switch self.configuration {
    case .all, .horizontal:
      for _ in 0..<self.length.minimum {
        bytes.prepend(.init(ascii: " "))
      }

    case .vertical:
      for _ in 0..<self.length.minimum {
        bytes.prepend(.init(ascii: "\n"))
      }
    }

    input.prepend(contentsOf: try self.inputToBytes.unapply(bytes))
  }
}

// NB: Swift 5.7 fails to build with a simpler `Bytes == Input` constraint
extension Whitespace {
  @inlinable
  public init<C>(_ configuration: Configuration = .all)
  where Length == PartialRangeFrom<Int>, InputToBytes == Conversions.Identity<C> {
    self.init(0..., configuration)
  }

  @inlinable
  public init<C>(_ length: Length, _ configuration: Configuration = .all)
  where InputToBytes == Conversions.Identity<C> {
    self.length = length
    self.configuration = configuration
    self.inputToBytes = .init()
  }
}

extension Parsers {
  public typealias Whitespace = Parsing.Whitespace  // NB: Convenience type alias for discovery
}

extension Whitespace: Sendable where Length: Sendable, InputToBytes: Sendable { }
