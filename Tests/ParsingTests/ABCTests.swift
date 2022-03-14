import Parsing
import XCTest

enum Letter: String, CaseIterable {
  case c, d, e, f, g, a, b
}

enum Mode: String, CaseIterable {
  case major, minor
}

struct Key: Equatable {
  var letter: Letter
  var accidental: Accidental?
  var mode: Mode
//  var accidentals
}

struct Pitch: Equatable {
  var letter: Letter
  var octave: Int
}

enum Accidental: String, CaseIterable {
  case doubleFlat = "__"
  case doubleSharp = "^^"
  case flat = "_"
  case natural = "="
  case sharp = "^"
}

struct Fraction: Equatable {
  var numerator: Int
  var denominator: Int
}

struct Note: Equatable {
  var accidental: Accidental?
  var pitch: Pitch
  var length: Fraction
}

enum Token: Equatable {
  case beamed([Note])
  case comment(String)
  case key(Key)
  case note(Note)
}

class ABCTests: XCTestCase {
  func testABC() throws {
    let input = """
      CDEF GABc cdef gabc'
      """

    let key = ParsePrint(.memberwise(Key.init)) {
      "K:"
      Skip { Prefix { $0 == " " } }.printing(" ")

      OneOf {
        for letter in Letter.allCases {
          letter.rawValue.uppercased().map { letter }
        }
      }

      Optionally {
        OneOf {
          "b".map { Accidental.flat }
          "#".map { Accidental.sharp }
        }
      }

      Prefix { $0.isLetter }
        .map(.lowercased)
        .pipe {
          OneOf {
            "major".map { Mode.major }
            "maj".map { Mode.major }
            "minor".map { Mode.minor }
            "min".map { Mode.minor }
            "m".map { Mode.minor }
            "".map { Mode.major }
          }
        }
    }

    let keyField = OneOf {
      Parse {
        "["
        Skip { Prefix { $0.isWhitespace } }.printing("")
        key
        Skip { Prefix { $0.isWhitespace } }.printing("")
        "]"
      }

      Parse {
        key
        Skip { Prefix { $0 == " " } }.printing("")
        "\n"
      }
    }

    let letter = OneOf {
      for letter in Letter.allCases {
        letter.rawValue.uppercased().map { Pitch(letter: letter, octave: 4) }
        letter.rawValue.lowercased().map { Pitch(letter: letter, octave: 5) }
      }
    }

    let octaveAdjustment = OneOf {
      Count { "'" }
      Count { "," }.map(.negate)
    }

    let adjust = AnyConversion<(Pitch, Int), Pitch>(
      apply: { Pitch(letter: $0.letter, octave: $0.octave + $1) },
      unapply: {
        let adjustment = $0.octave - ($0.octave > 4 ? 5 : 4)
        return (Pitch(letter: $0.letter, octave: $0.octave - adjustment), adjustment)
      }
    )

    let pitch = Parse {
      letter
      octaveAdjustment
    }
    .map(adjust)

    let digits = Prefix { $0.isNumber }.map(.string.lossless(Int.self))

    let length = Parse(.memberwise(Fraction.init)) {
      digits.replaceError(with: 1)

      OneOf {
        Parse { "/"; digits }

        Count(atLeast: 1) { "/" }.map(.double.pow2.int)
      }
      .replaceError(with: 1)
    }

    let note = ParsePrint(.memberwise(Note.init)) {
      Optionally { Accidental.parser() }
      pitch
      length
    }

    let beamed = Many(atLeast: 2) { note }

    let comment = ParsePrint(.string) {
      "%"
      OneOf { " "; "" }.printing(" ")
      Prefix { $0 != "\n" }
      "\n"
    }

    let token = OneOf {
      beamed.map(.case(Token.beamed))
      comment.map(.case(Token.comment))
      keyField.map(.case(Token.key))
      note.map(.case(Token.note))
    }

    let tokens = Many {
      token
    } separator: {
      Skip { Whitespace() }.printing(" ")
    }

    var i = input[...]
    let output = try tokens.parse(&i)
    print("parsed:")
    dump(output)
    print("printed:", try tokens.print(
      [
        .key(.init(letter: .c, accidental: .sharp, mode: .minor)),
        .comment("A scale:"),
        .note(.init(accidental: .doubleFlat, pitch: .init(letter: .c, octave: 1), length: .init(numerator: 1, denominator: 1))),
        .note(.init(accidental: .flat, pitch: .init(letter: .c, octave: 2), length: .init(numerator: 1, denominator: 1))),
        .note(.init(accidental: nil, pitch: .init(letter: .c, octave: 3), length: .init(numerator: 1, denominator: 2))),
        .note(.init(accidental: nil, pitch: .init(letter: .c, octave: 4), length: .init(numerator: 1, denominator: 4))),
        .note(.init(accidental: nil, pitch: .init(letter: .c, octave: 5), length: .init(numerator: 1, denominator: 8))),
        .note(.init(accidental: nil, pitch: .init(letter: .c, octave: 6), length: .init(numerator: 1, denominator: 1))),
        .note(.init(accidental: .sharp, pitch: .init(letter: .c, octave: 7), length: .init(numerator: 1, denominator: 1))),
        .note(.init(accidental: .doubleSharp, pitch: .init(letter: .c, octave: 8), length: .init(numerator: 1, denominator: 1))),
      ]
//      output
    ))
  }
}

extension Conversion where Self == AnyConversion<[Void], Int> {
  static var count: Self {
    .init(apply: { $0.count }, unapply: { $0 >= 0 ? .init(repeating: (), count: $0) : nil })
  }
}

extension Conversion where Output == [Void] {
  var count: Conversions.Map<Self, AnyConversion<[Void], Int>> { self.map(.count) }
}

extension Conversion where Self == AnyConversion<Int, Int> {
  static var negate: Self { .init(apply: -, unapply: -) }
}

extension Conversion where Self == AnyConversion<Substring, Substring> {
  static var lowercased: Self {
    .init(
      apply: { $0.lowercased()[...] },
      unapply: { $0.lowercased()[...] }
    )
  }
}

extension Conversion where Self == AnyConversion<Double, Double> {
  static var pow2: Self {
    .init(
      apply: { $0 > 0 ? pow(2, $0) : nil },
      unapply: { $0 > 0 ? log2($0) : nil }
    )
  }
}

extension Conversion where Output == Double {
  var pow2: Conversions.Map<Self, AnyConversion<Double, Double>>  {
    self.map(.pow2)
  }
}

extension Conversion where Output == Int {
  var negate: Conversions.Map<Self, AnyConversion<Int, Int>> { self.map(.negate) }
}

struct Counter: IteratorProtocol {
  var count: Int

  mutating func next() -> Void? {
    if self.count > 0 {
      self.count -= 1
      return ()
    }
    return nil
  }
}

struct Count<Upstream: ParserPrinter>: ParserPrinter
where Upstream.Output == Void {
  struct BelowMinimum: Error {}
  struct NegativeCount: Error {}

  var atLeast: Int = 0
  @ParserBuilder let upstream: Upstream

  func parse(_ input: inout Upstream.Input) throws -> Int {
    var count = 0
    while let _ = try? self.upstream.parse(&input) {
      count += 1
    }
    guard count >= self.atLeast else { throw BelowMinimum() }
    return count
  }

  func print(_ output: Int, into input: inout Upstream.Input) throws {
    guard output >= 0 else { throw NegativeCount() }
    for _ in 0..<output {
      try self.upstream.print(into: &input)
    }
  }
}
