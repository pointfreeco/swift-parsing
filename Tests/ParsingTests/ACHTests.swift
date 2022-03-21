import Parsing
import XCTest

class ACHTests: XCTestCase {
  func testEmail() throws {
    // let emailPattern = Regex {
    //   let word = OneOrMore(.word)
    //   Capture {
    //     ZeroOrMore {
    //       word
    //       "."
    //     }
    //     word
    //   }
    //   "@"
    //   Capture {
    //     word
    //     OneOrMore {
    //       "."
    //       word
    //     }
    //   }
    // } // => Regex<(Substring, Substring, Substring)>
    //
    // let email = "My email is my.name@mail.swift.org."
    // if let match = email.firstMatch(of: emailPattern) {
    //   let (wholeMatch, name, domain) = match.output
    //   // wholeMatch: "My email is my.name@mail.swift.org

    let email = ParsePrint {
      PrefixUpTo("@")
      "@"
      Rest()
    }

    XCTAssert(
      try email.parse("my.name@mail.swift.org") == ("my.name", "mail.swift.org")
    )

    let word = Prefix<Substring>(1...) { $0. }
  }

  func testACH() throws {
    enum TransactionKind: String, CaseIterable {
      case credit = "CREDIT"
      case debit = "DEBIT"
    }

    struct Date {
      var month, day, year: Int
    }

    struct Amount {
      var cents: Int
    }

    let statement = ParsePrint {
      // Parse the transaction kind.
      TransactionKind.parser()
      Whitespace(.horizontal).printing("\t")
      // Parse the date, e.g. "01012021".
      ParsePrint(.memberwise(Date.init(month:day:year:))) {
        Digits(2)
        Digits(2)
        Digits(4)
      }
      Whitespace(.horizontal).printing("\t")
      // Parse the transaction description, e.g. "ACH transfer".
//      PrefixUpTo("$").map(
//        AnyConversion(
//          apply: { $0.trimmingCharacters(in: .whitespaces) },
//          unapply: { $0 + "\t" }
//        )
//      )
//      Consumed {
//        Many {
//          Word()
//          Whitespace(.horizontal)
//        }
//        Word()
//      }
      Whitespace(.horizontal).printing("\t")
      // Parse the amount, e.g. `$100.00`.
      ParsePrint(
        AnyConversion(
          apply: { $0 * 100 + $1 },
          unapply: { $0.quotientAndRemainder(dividingBy: 100) }
        )
        .memberwise(Amount.init(cents:))
      ) {
        "$"
        Digits(1...)
        "."
        Digits(2)
      }
    }

    let statements = Many {
      statement
    } separator: {
      "\n"
    }

    print(
      try statements.parse(
        """
        CREDIT    04062020    PayPal transfer    $4.99
        CREDIT    04032020    Payroll            $69.73
        DEBIT     04022020    ACH transfer       $38.25
        DEBIT     03242020    IRS tax payment    $52249.98
        """
      )
    )

    print(
      try statements.print([
        (.credit, Date(month: 4, day: 6, year: 2020), "PayPal transfer", .init(cents: 4_99)),
        (.debit, Date(month: 4, day: 2, year: 2020), "ACH transfer", .init(cents: 25)),
      ])
    )
  }
}

struct Word: Parser {
  input.words.first
}

// (CREDIT|DEBIT)\s+(\d{2}\d{2}\d{4})\s+([\w\s]+\w)\s+(\$\d+\.\d{2})

////      OneOrMore(.whitespace)
////      // Parse the transaction description, e.g. "ACH transfer".
////      Capture {
////        OneOrMore(.custom([
////          .characterClass(.word),
////          .characterClass(.whitespace)
////        ]))
////        CharacterClass.word
////      } transform: { String($0) }
////      OneOrMore(.whitespace)
////      "$"
////      // Parse the amount, e.g. `$100.00`.
////      TryCapture {
////        OneOrMore(.digit)
////        "."
////        Repeat(.digit, count: 2)
////      } transform: { Amount(twoDecimalPlaces: $0) }
////    } // => Regex<(Substring, TransactionKind, Date, String, Amount)>
//
//
//    let statement = """
//      CREDIT    04062020    PayPal transfer    $4.99
//      CREDIT    04032020    Payroll            $69.73
//      DEBIT     04022020    ACH transfer       $38.25
//      DEBIT     03242020    IRS tax payment    $52249.98
//      """
//    for match in statement.matches(of: statementPattern) {
//      let (line, kind, date, description, amount) = match.output
//      ...
//    }
//  }
//}

struct Whitespace: Parser {
  struct Options: RawRepresentable, OptionSet {
    static let horizontal = Self(rawValue: 1)
    static let vertical = Self(rawValue: 1 << 1)

    let rawValue: Int8
  }

  var options: Options

  init(_ options: Options) {
    self.options = options
  }

  var body: some Parser<Substring, Void> {
    Skip { Prefix(while: [" ", "\t"].contains) }
  }
}

struct Digits/*TODO: <Input: Collection>*/: ParserPrinter {
  var length: ClosedRange<Int>

  init(_ length: PartialRangeFrom<Int> = 1...) {
    self.length = length.lowerBound...Int.max
  }

  init(_ length: Int) {
    self.length = length...length
  }

  func parse(_ input: inout Substring) throws -> Int {
    var prefix = self.length.upperBound == .max ? input : input.prefix(self.length.upperBound)
    prefix = prefix.prefix(while: ("0"..."9").contains)
    let count = prefix.count
    guard prefix.count >= self.length.lowerBound, let digits = Int(prefix)
    else { throw DigitsError() }
    input.removeFirst(count)
    return digits
  }

  func print(_ output: Int, into input: inout Substring) throws {
    guard output >= 0 else { throw DigitsError() }
    let prefix = String(output)
    let count = prefix.count
    guard count <= self.length.upperBound else { throw DigitsError() }
    input.prepend(contentsOf: prefix)
    input.prepend(contentsOf: String(repeating: "0", count: max(0, self.length.lowerBound - count)))
  }

  struct DigitsError: Error {}

//  var body: some ParserPrinter<Substring, Int> {
//    Prefix(self.length, while: ("0"..."9").contains)
//      .map(.string.trimmingPrefix("0", paddingTo: length.lowerBound).lossless(Int.self))
//  }
}

extension Conversion where Self == AnyConversion<(Int, Int), Int> {
  static var cents: Self {
    .init(
      apply: { $0 >= 0 && (0..<100).contains($1) ? $0 + 1 : nil },
      unapply: { $0 >= 0 ? $0.quotientAndRemainder(dividingBy: 100) : nil }
    )
  }
}

extension Conversion where Output == String {
  func trimmingPrefix(
    _ character: Character,
    paddingTo count: Int
  ) -> Conversions.Map<Self, AnyConversion<String, String>> {
    self.map(
      .init(
        apply: { String($0.drop(while: { $0 == character }))  },
        unapply: { String(repeating: character, count: max(0, count - $0.count)) + $0 }
      )
    )
  }

  func trimmingSuffix(
    _ character: Character,
    paddingTo count: Int
  ) -> Conversions.Map<Self, AnyConversion<String, String>> {
    self.map(
      .init(
        apply: { String($0.reversed().drop(while: { $0 == character }))  },
        unapply: { $0 + String(repeating: character, count: max(0, count - $0.count)) }
      )
    )
  }
}

extension BidirectionalCollection {
  public func trimmingSuffix(while predicate: (Element) throws -> Bool) rethrows -> SubSequence {
    var subSequence = self[...]
    try subSequence.trimSuffix(while: predicate)
    return subSequence
  }
}

extension BidirectionalCollection where SubSequence == Self {
  public mutating func trimSuffix(while predicate: (Element) throws -> Bool) rethrows {
    while let last = self.last, try predicate(last) {
      self.removeLast()
    }
  }
}

//let x = Capture {
//  Many { "Hello" } separator: { "," }
//}
//  .parse("Hello,Hello") -> "Hello,Hello"

struct Consumed<Upstream: Parser>: Parser
where
  Upstream.Input: Collection,
  Upstream.Input.SubSequence == Upstream.Input
{
  @ParserBuilder let upstream: Upstream

  func parse(_ input: inout Upstream.Input) rethrows -> Upstream.Input {
    let original = input
    _ = try self.upstream.parse(&input)
    return original[..<input.startIndex]
  }
}
extension Consumed: ParserPrinter
where
  Upstream: ParserPrinter
{
  func print(_ output: Upstream.Input, into input: inout Upstream.Input) rethrows {
    let upstreamOutput = try self.upstream.parse(output)
    try self.upstream.print(upstreamOutput, into: &input)
  }
}
