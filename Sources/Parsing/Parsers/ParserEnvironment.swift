import Foundation

public protocol ParserEnvironmentKey {
  associatedtype Value
  static var value: Value { get }
}

public struct ParserEnvironmentValues {
  @usableFromInline
  @TaskLocal static var current = ParserEnvironmentValues()

  private var storage: [ObjectIdentifier: Any] = [:]

  public subscript<Key>(key: Key.Type) -> Key.Value where Key: ParserEnvironmentKey {
    get {
      (self.storage[ObjectIdentifier(key)] ?? Key.value) as! Key.Value
    }
    set {
      self.storage[ObjectIdentifier(key)] = newValue
    }
  }
}

@propertyWrapper
public struct ParserEnvironment<Value> {
  public let keyPath: WritableKeyPath<ParserEnvironmentValues, Value>

  public init(_ keyPath: WritableKeyPath<ParserEnvironmentValues, Value>) {
    self.keyPath = keyPath
  }

  public var wrappedValue: Value {
    ParserEnvironmentValues.current[keyPath: self.keyPath]
  }
}

extension Parser {
  public func environment<Value>(
    _ keyPath: WritableKeyPath<ParserEnvironmentValues, Value>,
    _ value: Value
  ) -> Parsers.EnvironmentKeyWritingParser<Self, Value> {
    .init(upstream: self, keyPath: keyPath, value: value)
  }
}

extension Parsers {
  public struct EnvironmentKeyWritingParser<Upstream, Value> {
    public let upstream: Upstream
    public let keyPath: WritableKeyPath<ParserEnvironmentValues, Value>
    public let value: Value
  }
}

extension Parsers.EnvironmentKeyWritingParser: Parser where Upstream: Parser {
  public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
    var values = ParserEnvironmentValues.current
    values[keyPath: self.keyPath] = self.value
    return ParserEnvironmentValues.$current.withValue(values) {
      self.upstream.parse(&input)
    }
  }
}
