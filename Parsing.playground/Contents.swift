import Parsing

struct GraphemeBreakProperty {
  let range: Range<UInt>
  let property: Property
  let comment: String

  enum Property: String, CaseIterable {
    case prepend = "Prepend"
    case cr = "CR"
    case lf = "LF"
    case control = "Control"
    case extend = "Extend"
    case spacingMark = "SpacingMark"
    case l = "L"
    case v = "V"
    case t = "T"
    case lv = "LV"
    case zwj = "ZWJ"
    case lvt = "LVT"
  }
}

var input = """
0000..0009    ; Control # Cc  [10] <control-0000>..<control-0009>
000B..000C    ; Control # Cc   [2] <control-000B>..<control-000C>
000E..001F    ; Control # Cc  [18] <control-000E>..<control-001F>
007F..009F    ; Control # Cc  [33] <control-007F>..<control-009F>
00AD          ; Control # Cf       SOFT HYPHEN
061C          ; Control # Cf       ARABIC LETTER MARK
180E          ; Control # Cf       MONGOLIAN VOWEL SEPARATOR
200B          ; Control # Cf       ZERO WIDTH SPACE
200E..200F    ; Control # Cf   [2] LEFT-TO-RIGHT MARK..RIGHT-TO-LEFT MARK
2028          ; Control # Zl       LINE SEPARATOR
2029          ; Control # Zp       PARAGRAPH SEPARATOR
202A..202E    ; Control # Cf   [5] LEFT-TO-RIGHT EMBEDDING..RIGHT-TO-LEFT OVERRIDE
"""[...]

let oneOrMoreSpaces = Prefix(minLength: 1) { $0 != " " }

public struct Optionally<Upstream>: Parser where Upstream: Parser {
  public let upstream: Upstream

  @inlinable
  public init(@ParserBuilder _ build: () -> Upstream) {
    self.upstream = build()
  }

  @inlinable
  public func parse(_ input: inout Upstream.Input) -> Upstream.Output?? {
    .some(self.upstream.parse(&input))
  }
}

let property = OneOf {
  for p in GraphemeBreakProperty.Property.allCases {
    p.rawValue.map { p }
  }
}

Range<Int>.init(1...2)

//let graphemeBreakProperty = Parse {
//  Prefix<Substring>(4)
//  Optionally {
//    ".."
//    Prefix<Substring>(4)
//  }
//  Skip {
//    zeroOrMoreSpaces
//    "; "
//  }
//  property
//  " # "
//  Prefix { $0 != "\n" }
//}





1
print("!!!!")


//1
//
//
//var input = """
//1,Blob,admin
//2,Blob Jr,guest
//3,Blob Sr,member
//"""[...]
//
//struct User {
//  var id: Int
//  var name: String
//  var role: Role
//}
//
//enum Role {
//  case admin, guest, member
//}
//
//let role = Parsers.OneOf {
//  "admin".map { Role.admin }
//  "guest".map { Role.guest }
//  "member".map { Role.member }
//}
//
//let user = Parse(User.init(id:name:role:)) {
//  Int.parser()
//  ","
//  Prefix { $0 != "," }.map(String.init)
//  ","
//  role
//}
//
//let users = Many {
//  Parse(User.init(id:name:role:)) {
//    Int.parser()
//    ","
//    Prefix { $0 != "," }.map(String.init)
//    ","
//    Parsers.OneOf {
//      "admin".map { Role.admin }
//      "guest".map { Role.guest }
//      "member".map { Role.member }
//    }
//  }
//} separatedBy: {
//  "\n"
//}
//
//users.parse(&input)
//input
