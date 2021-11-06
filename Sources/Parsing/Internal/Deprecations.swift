// NB: Deprecated after 0.3.1:

extension Parsers {
  @available(*, deprecated, message: "'Bool.parser(of: Substring.self)' now returns 'FromUTF8View<BoolParser<Substring.UTF8View>>'")
  public typealias SubstringBoolParser = FromUTF8View<BoolParser<Substring.UTF8View>>

  @available(*, deprecated, message: "'Double.parser(of: Substring.self)' now returns 'FromUTF8View<DoubleParser<Substring.UTF8View>>'")
  public typealias SubstringDoubleParser = FromUTF8View<DoubleParser<Substring.UTF8View>>

  #if !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
    @available(*, deprecated, message: "'Float80.parser(of: Substring.self)' now returns 'FromUTF8View<Float80Parser<Substring.UTF8View>>'")
    public typealias SubstringFloat80Parser = FromUTF8View<Float80Parser<Substring.UTF8View>>
  #endif

  @available(*, deprecated, message: "'Float.parser(of: Substring.self)' now returns 'FromUTF8View<FloatParser<Substring.UTF8View>>'")
  public typealias SubstringFloatParser = FromUTF8View<FloatParser<Substring.UTF8View>>

  @available(*, deprecated, message: "'FixedWidthInteger.parser(of: Substring.self)' now returns 'FromUTF8View<IntParser<Substring.UTF8View, FixedWidthInteger>>'")
  public typealias SubstringIntParser<Output> = FromUTF8View<IntParser<Substring.UTF8View, Output>> where Output: FixedWidthInteger

  @available(*, deprecated, message: "'UUID.parser(of: Substring.self)' now returns 'FromUTF8View<UUID<Substring.UTF8View>>'")
  public typealias SubstringUUIDParser<Output> = FromUTF8View<UUIDParser<Substring.UTF8View>>
}

// NB: Deprecated after 0.1.2:

@available(*, deprecated, message: "Use 'First().filter(predicate) instead")
public struct FirstWhere<Input>: Parser
where
  Input: Collection,
  Input.SubSequence == Input
{
  public let predicate: (Input.Element) -> Bool

  @inlinable
  public init(_ predicate: @escaping (Input.Element) -> Bool) {
    self.predicate = predicate
  }

  @inlinable
  public func parse(_ input: inout Input) -> Input.Element? {
    guard let first = input.first, self.predicate(first) else { return nil }
    input.removeFirst()
    return first
  }
}

@available(*, deprecated, message: "Use 'First().filter(predicate) instead")
extension Parsers {
  public typealias FirstWhere = Parsing.FirstWhere  // NB: Convenience type alias for discovery
}
