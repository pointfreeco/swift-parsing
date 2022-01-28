import Parsing
import XCTest

/*
 p.print(.gbp)

 You tried printing a value (.gbp) that was not recognized by OneOf the parsers

 - Didn't match "E" (.eur)
 - Didn't match "$" (.usd)

 London,
         ^ tried to print here
 */

class JSONTests: XCTestCase {
  func testJson() throws {
//    var s1 = ""[...].utf8
//    try stringLiteral.print("hel\nlo", to: &s1)
//    print(s1)

    var str = ""[...].utf8
    try json.print(
      .object([
        "hel\nlo": .boolean(true),
        "goodbye": .number(42.42),
        "whatever": .null,
        "xs": .array([.number(1), .string("hello"), .null, .boolean(false)]),
        "ys": .object([
          "0": .number(2),
          "1": .string("goodbye"),
        ]),
      ]),
      to: &str
    )
    let s = Substring(str)
    print(s)
    
  }
}

private enum JSONValue: Equatable {
  indirect case array([JSONValue])
  case boolean(Bool)
  case null
  case number(Double)
  indirect case object([String: JSONValue])
  case string(String)
}

private var json: AnyParserPrinter<Substring.UTF8View, JSONValue> {
  Parse {
    Skip {
      Whitespace().printing("".utf8)
    }

    OneOf {
      object
      array
      string
      number
      boolean
      null
    }

    Skip {
      Whitespace().printing("".utf8)
    }
  }
  .eraseToAnyParserPrinter()
}

// MARK: Object

private let object = Parse(/JSONValue.object) {
  "{".utf8
  Many(into: [String: JSONValue]()) { object, pair in
    let (name, value) = pair
    object[name] = value
  } iterator: { object in
    object.map { $0 }.makeIterator()
  } element: {
    Skip {
      Whitespace().printing("".utf8)
    }
    stringLiteral
    Skip {
      Whitespace().printing("".utf8)
    }
    ":".utf8
    Lazy {
      json
    }
  } separator: {
    ",".utf8
    Skip {
      Whitespace().printing("".utf8)
    }
  } terminator: {
    "}".utf8
  }
}

// MARK: Array

private let array = Parse(/JSONValue.array) {
  "[".utf8
  Many {
    Lazy {
      json
    }
  } separator: {
    ",".utf8
  } terminator: {
    "]".utf8
  }
}

// MARK: String

private let unicode = Prefix(4) {
  (.init(ascii: "0") ... .init(ascii: "9")).contains($0)
    || (.init(ascii: "A") ... .init(ascii: "F")).contains($0)
    || (.init(ascii: "a") ... .init(ascii: "f")).contains($0)
}
.map(
  AnyConversion<Substring.UTF8View, Character>(
    apply: {
      UInt32(Substring($0), radix: 16)
        .flatMap(UnicodeScalar.init)
        .map(Character.init)
    },
    unapply: {
      $0.unicodeScalars.first
        .map(UInt32.init)
        .map { String($0, radix: 16)[...].utf8 } // TODO: Left-pad 0s
    }
  )
)

private let escape = Parse {
  "\\".utf8

  OneOf {
    "\"".utf8.map(.exactly("\"" as Character))
    "\\".utf8.map(.exactly("\\" as Character))
    "/".utf8.map(.exactly("/" as Character))
    "b".utf8.map(.exactly("\u{8}" as Character))
    "f".utf8.map(.exactly("\u{c}" as Character))
    "n".utf8.map(.exactly("\n" as Character))
    "r".utf8.map(.exactly("\r" as Character))
    "t".utf8.map(.exactly("\t" as Character))
    unicode
  }
}

private let literal = Parse(.string) {
  Prefix(1...) {
    $0 != .init(ascii: "\"") && $0 != .init(ascii: "\\") && $0 != .init(ascii: "\n")
  }
}

private enum StringFragment {
  case escape(Character)
  case literal(String)
}

private let fragment = OneOf {
  literal.map(/StringFragment.literal)
  escape.map(/StringFragment.escape)
}

private let stringLiteral = Parse {
  "\"".utf8
  Many(into: "") { string, fragment in
    switch fragment {
    case let .escape(character):
      string.append(character)
    case let .literal(other):
      string.append(contentsOf: other)
    }
  } iterator: { string in
    string
      .map {
        .literal(String($0))
      }
      .makeIterator()
  } element: {
    fragment
  }
  "\"".utf8
}

private let string = Parse(/JSONValue.string) {
  stringLiteral
}

// MARK: Number

private let number = Parse(/JSONValue.number) {
  Double.parser(of: Substring.UTF8View.self)
}

// MARK: Boolean

private let boolean = Parse(/JSONValue.boolean) {
  Bool.parser(of: Substring.UTF8View.self)
}

// MARK: Null

// FIXME:
//private let null = Parse(/JSONValue.null) {
//  "null".utf8
//}
private let null = "null".utf8.map(/JSONValue.null)
