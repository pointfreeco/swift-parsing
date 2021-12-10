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
