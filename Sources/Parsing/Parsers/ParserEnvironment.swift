import Foundation

public protocol ParserEnvironmentKey {
  associatedtype Value
  static var value: Value { get }
}

public struct ParserEnvironmentValues {
  @usableFromInline
  @TaskLocal static var current = ParserEnvironmentValues()

  @inline(__always)
  @usableFromInline
  static func withValue<R>(_ values: Self, operation: () throws -> R) rethrows -> R {
    try Self.$current.withValue(values, operation: operation)
  }

  @usableFromInline
  var storage: [ObjectIdentifier: Any] = [:]

  @inlinable
  @inline(__always)
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

  @inlinable
  public init(_ keyPath: WritableKeyPath<ParserEnvironmentValues, Value>) {
    self.keyPath = keyPath
  }

  @inlinable
  @inline(__always)
  public var wrappedValue: Value {
    ParserEnvironmentValues.current[keyPath: self.keyPath]
  }
}

extension Parser {
  @inlinable
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

    @usableFromInline
    init(
      upstream: Upstream,
      keyPath: WritableKeyPath<ParserEnvironmentValues, Value>,
      value: Value
    ) {
      self.upstream = upstream
      self.keyPath = keyPath
      self.value = value
    }
  }
}

extension Parsers.EnvironmentKeyWritingParser: Parser where Upstream: Parser {
  @inlinable
  public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
    var values = ParserEnvironmentValues.current
    values[keyPath: self.keyPath] = self.value
    return ParserEnvironmentValues.withValue(values) {
      self.upstream.parse(&input)
    }
  }
}
