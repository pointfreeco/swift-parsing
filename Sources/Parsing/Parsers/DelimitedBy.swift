/// A parser that returns a subsequence by matching pairs of delimiters.
/// The data must begin with `start`, and each successful match for `start` or `end` respectively open and close a matchin pair.
/// The parser returns a subsequence of `Input` when it matches `end` with the initial `start`, closing the first level pair.
/// In case of success, the output doesn't include the delimiters, and the last `end` portion of the input is consumed.
/// This parser allows to parse arbitrary nested structures:
///
///     let delimitedParser = DelimitedBy<Substring>("(", ")")
///
///     var input = "(Hello,(world))!"[...]
///     delimitedParser.parse(&input) // "Hello,(world)"
///     input // "!"
///
/// If the input exceed the maximum level of nesting allowed, parsing will fail.
/// By default, this maximum level is unlimited (`maxLevel: 0`)
///
/// - Warning: If the input is known to not have nested pairs of delimiters, an adhoc parser in the form of:
///
///     let parser = Parsers
///     .Skip(StartsWith(start, by: areEquivalent))
///     .take(PrefixUpTo(end, by: areEquivalent))
///     .skip(StartsWith(end, by: areEquivalent))
///
/// may be more efficient. The same may also be true if the nesting level is known.
///
/// - Remark: If both delimiters are equivalent, this parser will be more efficient than an adhoc 1-level parser.
public struct DelimitedBy<Input>: Parser
  where
  Input: Collection,
  Input.SubSequence == Input
{
  public let start: Input
  public let end: Input
  public let areEquivalent: (Input.Element, Input.Element) -> Bool

  public let maxLevel: Int

  @usableFromInline
  let startAndEndAreEquivalent: Bool

  @inlinable
  public init(
    _ start: Input,
    _ end: Input? = nil,
    by areEquivalent: @escaping (Input.Element, Input.Element) -> Bool,
    maxLevel: Int = 0
  ) {
    self.start = start
    self.startAndEndAreEquivalent = end == nil || zip(start, end!).allSatisfy(areEquivalent)

    let end = end ?? start
    self.end = end
    self.areEquivalent = areEquivalent
    self.maxLevel = maxLevel
  }

  @inlinable
  @inline(__always)
  public func parse(_ input: inout Input) -> Input? {
    let maxLevel = self.maxLevel == 0 ? Int.max : self.maxLevel

    guard let firstOfStart = start.first else {
      return PrefixThrough(end, by: areEquivalent)
        .parse(&input)
        .map { $0.prefix($0.count - end.count) }
    }
    guard let firstOfEnd = end.first else {
      return StartsWith(start, by: areEquivalent)
        .parse(&input)
        .map { end }
    }
    let startCount = start.count
    let endCount = end.count
    guard input.count >= startCount + endCount else { return nil }
    guard input.starts(with: start, by: areEquivalent) else { return nil }

    let original = input
    input = input[input.index(input.startIndex, offsetBy: startCount)...]

    if maxLevel == 1 {
      while let index = input.firstIndex(where: { areEquivalent(firstOfEnd, $0) }) {
        if input[index...].starts(with: end, by: areEquivalent) {
          var candidate = original[original.index(original.startIndex, offsetBy: startCount)..<index]
          let originalCandidate = candidate
          while let firstIndex = candidate.firstIndex(where: { areEquivalent(firstOfStart, $0) }) {
            if candidate[firstIndex...].starts(with: start, by: areEquivalent) {
              input = original
              return nil
            }
            candidate = candidate[firstIndex...]
          }
          input = input[input.index(index, offsetBy: endCount)...]
          return originalCandidate
        }
      }
    } else {
      var level: Int = 1
      while let index = input.firstIndex(where: {
        areEquivalent(firstOfStart, $0)
          || (!startAndEndAreEquivalent && areEquivalent(firstOfEnd, $0))
      }) {
        input = input[index...]
        if startAndEndAreEquivalent {
          if input[index...].starts(with: start, by: areEquivalent) {
            input = input[input.index(index, offsetBy: startCount)...]
            return original[original.index(original.startIndex, offsetBy: startCount)..<index]
          }
        } else {
          if input[index...].starts(with: end, by: areEquivalent) {
            guard level == 1 else {
              level -= 1
              input.removeFirst(endCount)
              continue
            }
            input = input[input.index(index, offsetBy: endCount)...]
            return original[original.index(original.startIndex, offsetBy: startCount)..<index]
          }

          if input[index...].starts(with: start, by: areEquivalent) {
            guard level < maxLevel else {
              input = original
              return nil
            }
            level += 1
            input.removeFirst(startCount)
            continue
          }
        }
      }
    }

    input = original
    return nil
  }
}

public extension DelimitedBy where Input.Element: Equatable {
  @inlinable
  init(_ start: Input, _ end: Input? = nil, maxLevel: Int = 0) {
    self.init(start, end, by: ==, maxLevel: maxLevel)
  }
}

public extension Parsers {
  typealias Delimited = Parsing.DelimitedBy // NB: Convenience type alias for discovery
}

public extension DelimitedBy where Input == Substring {
  @inlinable
  init(_ start: String, _ end: String? = nil, maxLevel: Int = 0) {
    self.init(start[...], end?[...], maxLevel: maxLevel)
  }
}

public extension DelimitedBy where Input == Substring.UTF8View {
  @inlinable
  init(_ start: String.UTF8View, _ end: String.UTF8View? = nil, maxLevel: Int = 0) {
    self.init(String(start)[...].utf8, end.map { String($0)[...].utf8 }, maxLevel: maxLevel)
  }
}
