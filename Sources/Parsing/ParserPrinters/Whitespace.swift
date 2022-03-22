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
  let maxLength: Int?

  @usableFromInline
  let minLength: Int

  @usableFromInline
  let toBytes: (Input) -> Bytes

  @usableFromInline
  let fromBytes: (Bytes) -> Input

  @inlinable
  public func parse(_ input: inout Input) {
    var bytes = self.toBytes(input)
    defer {

      input = self.fromBytes(bytes)
    }

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

extension Whitespace: ParserPrinter
where Input: PrependableCollection, Bytes: PrependableCollection {
  @inlinable
  public func print(_ output: (), into input: inout Input) {
    var bytes = Bytes()
    defer { input.prepend(contentsOf: self.fromBytes(bytes)) }

    switch self.configuration {
    case .all, .horizontal:
      for _ in 0..<self.minLength {
        bytes.prepend(.init(ascii: " "))
      }

    case .vertical:
      for _ in 0..<self.minLength {
        bytes.prepend(.init(ascii: "\n"))
      }
    }
  }
}

// NB: Swift 5.7 fails to build with a simpler `Bytes == Input` constraint
extension Whitespace where Bytes == Input.SubSequence, Bytes.SubSequence == Input {
  @inlinable
  public init(_ configuration: Configuration = .all) {
    self.minLength = 0
    self.maxLength = nil
    self.configuration = configuration
    self.toBytes = { $0 }
    self.fromBytes = { $0 }
  }

  @inlinable
  public init(_ length: Int, _ configuration: Configuration = .all) {
    self.minLength = length
    self.maxLength = length
    self.configuration = configuration
    self.toBytes = { $0 }
    self.fromBytes = { $0 }
  }

  @inlinable
  public init(_ length: PartialRangeFrom<Int>, _ configuration: Configuration = .all) {
    self.minLength = length.lowerBound
    self.maxLength = nil
    self.configuration = configuration
    self.toBytes = { $0 }
    self.fromBytes = { $0 }
  }
}

extension Whitespace where Input == Substring, Bytes == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init(_ configuration: Configuration = .all) {
    self.minLength = 0
    self.maxLength = nil
    self.configuration = configuration
    self.toBytes = { $0.utf8 }
    self.fromBytes = Substring.init
  }

  @_disfavoredOverload
  @inlinable
  public init(_ length: Int, _ configuration: Configuration = .all) {
    self.minLength = length
    self.maxLength = length
    self.configuration = configuration
    self.toBytes = { $0.utf8 }
    self.fromBytes = Substring.init
  }

  @_disfavoredOverload
  @inlinable
  public init(_ length: PartialRangeFrom<Int>, _ configuration: Configuration = .all) {
    self.minLength = length.lowerBound
    self.maxLength = nil
    self.configuration = configuration
    self.toBytes = { $0.utf8 }
    self.fromBytes = Substring.init
  }
}

extension Whitespace where Input == Substring.UTF8View, Bytes == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init(_ configuration: Configuration = .all) {
    self.init(configuration)
  }

  @_disfavoredOverload
  @inlinable
  public init(_ length: Int, _ configuration: Configuration = .all) {
    self.init(length, configuration)
  }

  @_disfavoredOverload
  @inlinable
  public init(_ length: PartialRangeFrom<Int>, _ configuration: Configuration = .all) {
    self.init(length, configuration)
  }
}

extension Parsers {
  public typealias Whitespace = Parsing.Whitespace  // NB: Convenience type alias for discovery
}
