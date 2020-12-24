//import Parsing
//
//let parseHex = Prefix<Substring>(1...6) { $0.isHexDigit }
//let parseDelimitedHex = StartsWith("u{").take(parseHex).skip(StartsWith("}"))
//let parseUInt32 = parseDelimitedHex.compactMap { UInt32($0, radix: 16) }
//let parseUnicode = parseUInt32.compactMap { UnicodeScalar($0).map(Character.init) }
//
//let parseEscapedCharacter = StartsWith<Substring>(#"\"#)
//  .take(
//    StartsWith("n").map { "\n" as Character }
//      .orElse(StartsWith("r").map { "\r" })
//      .orElse(StartsWith("t").map { "\t" })
//      .orElse(StartsWith("b").map { "\u{8}" })
//      .orElse(StartsWith("f").map { "\u{c}" })
//      .orElse(StartsWith(#"\"#).map { #"\"# })
//      .orElse(StartsWith("/").map { "/" })
//      .orElse(StartsWith("\"").map { "\"" })
//  )
//
//let parseEscapedWhitespace = StartsWith<Substring>(#"\"#)
//  .skip(Prefix(1...) { $0 == " " || $0 == "\t" || $0 == "\n" || $0 == "\r" })
//
//let parseLiteral = Prefix<Substring>(1...) { $0 != "\"" && $0 != #"\"# }
//
//enum StringFragment {
//  case literal(Substring)
//  case escapedCharacter(Character)
//  case escapedWhitespace
//}
//
//let parseFragment = parseLiteral.map(StringFragment.literal)
//  .orElse(parseEscapedCharacter.map(StringFragment.escapedCharacter))
//  .orElse(parseEscapedWhitespace.map { .escapedWhitespace })
//
//let parseString = StartsWith("\"")
//  .take(
//    Many(parseFragment, into: "") {
//      switch $1 {
//      case let .literal(string):
//        $0.append(contentsOf: string)
//      case let .escapedCharacter(character):
//        $0.append(character)
//      case .escapedWhitespace:
//        return
//      }
//    }
//  )
//  .skip(StartsWith("\""))
