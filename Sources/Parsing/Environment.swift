import Foundation

public protocol EnvironmentKey {
  associatedtype Value
  static var value: Value { get }
}

public struct EnvironmentValues {
  @TaskLocal public static var current = EnvironmentValues()

  private var storage: [ObjectIdentifier: Any] = [:]

  public subscript<Key>(key: Key.Type) -> Key.Value where Key: EnvironmentKey {
    get {
      (self.storage[ObjectIdentifier(key)] ?? Key.value) as! Key.Value
    }
    set {
      self.storage[ObjectIdentifier(key)] = newValue
    }
  }
}

@propertyWrapper
public struct Environment<Value> {
  public let keyPath: WritableKeyPath<EnvironmentValues, Value>

  public init(_ keyPath: WritableKeyPath<EnvironmentValues, Value>) {
    self.keyPath = keyPath
  }

  public var wrappedValue: Value {
    EnvironmentValues.current[keyPath: self.keyPath]
  }
}

extension Parser {
  public func environment<Value>(
    _ keyPath: WritableKeyPath<EnvironmentValues, Value>,
    _ value: Value
  ) -> Parsers.EnvironmentKeyWritingParser<Self, Value> {
    .init(upstream: self, keyPath: keyPath, value: value)
  }
}

extension Parsers {
  public struct EnvironmentKeyWritingParser<Upstream, Value>: Parser where Upstream: Parser {
    public let upstream: Upstream
    public let keyPath: WritableKeyPath<EnvironmentValues, Value>
    public let value: Value

    public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
      var values = EnvironmentValues.current
      values[keyPath: self.keyPath] = self.value
      return EnvironmentValues.$current.withValue(values) {
        self.upstream.parse(&input)
      }
    }
  }
}

private enum SkipSpacesKey: EnvironmentKey {
  static var value = false
}

extension EnvironmentValues {
  public var skipSpaces: Bool {
    get { self[SkipSpacesKey.self] }
    set { self[SkipSpacesKey.self] = newValue }
  }
}

extension Parsers {
  public struct SkipSpaces<Upstream>: Parser where Upstream: Parser {
    let upstream: Parsers.EnvironmentKeyWritingParser<Upstream, Bool>

    public init(upstream: Upstream) {
      self.upstream = upstream.environment(\.skipSpaces, true)
    }

    public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
      let original = input
      _trimSpacePrefix(&input)
      guard let output = self.upstream.parse(&input)
      else {
        input = original
        return nil
      }
      return output
    }
  }
}

@usableFromInline
@inline(__always)
func _trimSpacePrefix<Input>(_ input: inout Input) {
  if var stringInput = input as? Substring {
    stringInput.removeFirst(
      stringInput.prefix { $0 == " " }.count
    )
    input = unsafeBitCast(stringInput, to: Input.self)
  } else if var stringInput = input as? Substring.UTF8View {
    stringInput.removeFirst(
      stringInput.prefix { $0 == .init(ascii: " ") }.count
    )
    input = unsafeBitCast(stringInput, to: Input.self)
  } else if var stringInput = input as? ArraySlice<UInt8> {
    stringInput.removeFirst(
      stringInput.prefix { $0 == .init(ascii: " ") }.count
    )
    input = unsafeBitCast(stringInput, to: Input.self)
  }
}

extension Parser {
  public func skipSpaces() -> Parsers.SkipSpaces<Self> {
    .init(upstream: self)
  }
}
