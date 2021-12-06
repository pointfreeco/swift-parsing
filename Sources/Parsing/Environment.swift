public protocol EnvironmentKey {
  associatedtype Value
  static var value: Value { get }
}

import Foundation

public class EnvironmentValues {
  static var shared = EnvironmentValues()

  fileprivate var storage: [[ObjectIdentifier: Any]] {
    get {
      (Thread.current.threadDictionary["storage"] ?? [[:]]) as! [[ObjectIdentifier: Any]]
    }
    set {
      Thread.current.threadDictionary["storage"] = newValue
    }
  }

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

private enum SkipSpacesKey: EnvironmentKey {
  static var value = false
}

extension EnvironmentValues {
  public var skipSpaces: Bool {
    get { self[SkipSpacesKey.self] }
    set { self[SkipSpacesKey.self] = newValue }
  }
}

extension Parser {
  public func skipSpaces() -> Parsers.SkipSpaces<Self> {
    .init(upstream: self)
  }
}

extension Parsers {
  public struct SkipSpaces<Upstream>: Parser
  where Upstream: Parser
  {
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



private enum UserAgentKey: EnvironmentKey {
  static var value = ""[...]
}

extension EnvironmentValues {
  public var userAgent: Substring {
    get { self[UserAgentKey.self] }
    set { self[UserAgentKey.self] = newValue }
  }
}

extension Parser {
  public func environment(
    _ keyPath: WritableKeyPath<EnvironmentValues, Output>
  )
  -> Parsers.EnvironmentCaptureParser<Self>
  {
    .init(keyPath: keyPath, upstream: self)
  }
}

extension Parsers {
  public struct EnvironmentCaptureParser<Upstream>: Parser
  where
    Upstream: Parser
  {
    let keyPath: WritableKeyPath<EnvironmentValues, Upstream.Output>
    let upstream: Upstream

    public func parse(_ input: inout Upstream.Input) -> Upstream.Output? {
      let output = self.upstream.parse(&input)
      let id = ObjectIdentifier(self.keyPath)
      for index in EnvironmentValues.shared.storage.indices {
        EnvironmentValues.shared.storage[index][id] = output
      }
      return output
    }
  }
}

@propertyWrapper
@dynamicMemberLookup
public struct ParserOutput<Output> {
  public let wrappedValue: Output?

  public init(wrappedValue: Output?) {
    self.wrappedValue = wrappedValue
  }

  public subscript<Value>(dynamicMember keyPath: KeyPath<EnvironmentValues, Value>) -> Value {
    let id = ObjectIdentifier(keyPath)
    return EnvironmentValues.shared.storage[EnvironmentValues.shared.storage.count - 1][id] as! Value
  }
}
