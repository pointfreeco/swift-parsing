import Foundation

/// A parser that consumes a subsequence from the beginning of its input up to a given parser succeed.
///
/// This parser behave a lot like `PrefixUpTo` but it can be slower because it can use a parser instead of
/// a static string and consume and return input up to a particular parser succeed.
///
/// If provided with a string that correspond to the begining of the parser it will be almost as fast as `PrefixUpTo` in most cases. The only case where it will be slow when providing a string is when there is a lot of false positive aka pattern that look like what the parser should valid but are not valid.
///
/// ```swift
/// let separatorParser = Parse {
///   "["
///   Int.parser()
///   Optionally {
///     ";"
///     Int.parser()
///   }
///   "m"
/// }
///
/// let lineParser = PrefixUntil("[") { separatorParser }
///
/// var input = "Hello[31mworld[30m\n"[...]
/// try line.parse(&input)  // "Hello"
/// input                   // "[31mworld[30m\n"
/// ```
///
/// - Tip: This is 15x slower than `PrefixUpTo` so use it only where a dynamic limit is needed caution.
public struct PrefixUntil<Input: Collection, Upstream: Parser>: Parser where Input.SubSequence == Input, Upstream.Input == Input {
  
  public let upstream: Upstream
  public let possibleMatch: Input?
  public let areEquivalent: (Input.Element, Input.Element) -> Bool
  
  @inlinable
  public init(
    _ possibleMatch: Input? = nil,
    by areEquivalent: @escaping (Input.Element, Input.Element) -> Bool,
    @ParserBuilder _ build: () -> Upstream) {
      self.upstream = build()
      self.possibleMatch = possibleMatch
      self.areEquivalent = areEquivalent
    }
  
  @inlinable
  public func fastPath(_ input: inout Input) throws -> Input {
    guard let possibleMatch = self.possibleMatch else { return input }
    guard let first = possibleMatch.first else { return possibleMatch }
    let count = possibleMatch.count
    let original = input
    
    while let index = input.firstIndex(where: { self.areEquivalent(first, $0) }) {
      input = input[index...]
      if input.count >= count,
        zip(input[index...], possibleMatch).allSatisfy(self.areEquivalent)
      {
        let outputSlow = try slowPath(&input)
        if outputSlow.count == 0 { return original[..<index] }
        return outputSlow
      }
      input.removeFirst()
    }
    input.removeFirst(original.count)
    return original
  }
  
  @inlinable
  public func slowPath(_ input: inout Input) throws -> Input {
    let original = input
    var testInput = input
    var index = input.startIndex
    var hasParsed = (try? self.upstream.parse(&testInput)) != nil

    while hasParsed == false && index != testInput.endIndex {
      testInput.removeFirst()
      index = testInput.startIndex
      hasParsed = (try? self.upstream.parse(&testInput)) != nil
    }
    
    let lenght = original[..<index].count
    input.removeFirst(lenght)
    return original[..<index]
  }
  
  @inlinable
  public func parse(_ input: inout Input) throws -> Input {
    guard !input.isEmpty
    else { throw ParsingError.expectedInput("a non-empty input", at: input) }
    guard let possibleMatch = self.possibleMatch
    else { return try slowPath(&input)  }
    return try fastPath(&input)
  }
}

extension PrefixUntil where Input.Element: Equatable {
  @inlinable
  public init(@ParserBuilder _ build: () -> Upstream) {
    self.init(nil, by: ==, build)
  }
}

extension PrefixUntil where Input == Substring {
  @_disfavoredOverload
  @inlinable
  public init(_ possiblePrefix: String, @ParserBuilder _ build: () -> Upstream) {
    self.init(possiblePrefix[...], by: ==, build)
  }
}

extension PrefixUntil where Input == Substring.UTF8View {
  @_disfavoredOverload
  @inlinable
  public init(_ possibleMatch: String.UTF8View, @ParserBuilder _ build: () -> Upstream) {
    self.init(String(possibleMatch)[...].utf8, by: ==, build)
  }
}

extension Parsers {
  public typealias PrefixUntil = Parsing.PrefixUntil  // NB: Convenience type alias for discovery
}
