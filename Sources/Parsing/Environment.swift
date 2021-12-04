public protocol EnvironmentKey {
  associatedtype Value
  static var value: Value { get }
}

public class EnvironmentValues {
  static var shared = EnvironmentValues()

  private var storage: [[ObjectIdentifier: Any]] = [[:]]

  func withDependencies<Result>(_ transform: (EnvironmentValues) -> Result) -> Result {
    self.storage.append(self.storage.last!)
    defer { self.storage.removeLast() }
    return transform(Self.shared)
  }

  public subscript<Key: EnvironmentKey>(key: Key.Type) -> Key.Value {
    get {
      let id = ObjectIdentifier(key)
      guard let environmentValue = self.storage.last?[id]
      else {
        let value = Key.value
        self.storage[self.storage.count - 1][id] = value
        return value
      }
      guard let value = environmentValue as? Key.Value
      else { fatalError() }

      return value
    }
    set {
      self.storage[self.storage.count - 1][ObjectIdentifier(key)] = newValue
    }
  }
}

extension Parser {
  public func environment<Value>(
    _ keyPath: ReferenceWritableKeyPath<EnvironmentValues, Value>,
    _ value: Value
  ) -> Parsers.EnvironmentKeyWritingParser<Self, Value> {
    .init(upstream: self, keyPath: keyPath, value: value)
  }
}

@propertyWrapper
public struct Environment<Value> {
  public let keyPath: WritableKeyPath<EnvironmentValues, Value>
  public init(_ keyPath: WritableKeyPath<EnvironmentValues, Value>) {
    self.keyPath = keyPath
  }
  public var wrappedValue: Value {
    EnvironmentValues.shared[keyPath: self.keyPath]
  }
}

extension Parsers {
  public struct EnvironmentKeyWritingParser<Upstream, Value>: Parser
  where Upstream: Parser
  {
    public let upstream: Upstream
    public let keyPath: ReferenceWritableKeyPath<EnvironmentValues, Value>
    public let value: Value

    public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
      EnvironmentValues.shared.withDependencies {
        $0[keyPath: self.keyPath] = value
        return self.upstream.parse(&input)
      }
    }
  }
}

private enum SkipWhitespaceKey: EnvironmentKey {
  static var value = false
}

extension EnvironmentValues {
  public var skipWhitespace: Bool {
    get { self[SkipWhitespaceKey.self] }
    set { self[SkipWhitespaceKey.self] = newValue }
  }
}

@inline(__always)
public func _trimSpacePrefix<Input>(_ input: inout Input) {
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
  }
}
