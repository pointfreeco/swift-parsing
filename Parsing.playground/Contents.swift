import Parsing

// (inout Input) -> Output?

var input = "123 Hello World!"[...]
Int.parser().parse(&input)
input

//StartsWith(" Hello ").parse(&input)
" Hello ".parse(&input)
input

Prefix
  .init(while: { $0 != "!" }).parse(&input)
input

".".parse(&input)
input

input = "123 Hello World!"[...]
Int.parser()
  .skip(" Hello ")
  .take(Prefix { $0 != "!" })
  .skip("!")
  .parse(&input)
input

input = """
1,   Blob   ,member
2,Blob Jr   ,guest
  3,   Blob Sr,admin
"""[...]

enum Role {
  case admin, guest, member
}

let role = "admin".map { Role.admin }
  .orElse("guest".map { Role.guest })
  .orElse("member".map { Role.member })
//  .orElse(...)
//  .orElse(...)
//  .orElse(...)
//  .orElse(...)
//  .orElse(...)

//let role = OneOf {
//  "admin".map { Role.admin }
//  "guest".map { Role.guest }
//  "member".map { Role.member }
//}

struct User {
  var id: Int
  var name: String
  var role: Role
}

let zeroOrMoreSpaces = Prefix { $0 == " " }

let user = Skip(zeroOrMoreSpaces)
  .take(Int.parser())
  .skip(zeroOrMoreSpaces)
  .skip(",")
  .skip(zeroOrMoreSpaces)
  .take(Prefix { $0 != "," }.map(String.init))
  .skip(zeroOrMoreSpaces)
  .skip(",")
  .skip(zeroOrMoreSpaces)
  .take(role)
  .skip(zeroOrMoreSpaces)
  .map(User.init(id:name:role:))

//let user = Parse(User.init(id:name:role:)) {
//  zeroOrMoreSpaces
//  Int.parser()
//  zeroOrMoreSpaces
//  ","
//  zeroOrMoreSpaces
//  Prefix { $0 != "," }.map(String.init)
//  zeroOrMoreSpaces
//  ","
//  zeroOrMoreSpaces
//  role
//  zeroOrMoreSpaces
//}
//  .map(User.init(id:name:role:))

pow(2, 11)
//pow(2, n) + pow(2, n-1) + pow(2, n-2) + ... + pow(2, 0)
// = pow(2, n+1) - 1
pow(2, 6+1) - 1

let users = Many(user, separator: "\n")
//let users = Many {
//  user
//} separator: {
//  "\n"
//}
users.parse(&input)

input

/*
 Parsing.Many<Parsing.Parsers.Map<Parsing.Parsers.Take3<Parsing.Parsers.SkipSecond<Parsing.Parsers.Take2<Parsing.Parsers.SkipSecond<Parsing.Parsers.UTF8ViewToSubstring<Parsing.Parsers.IntParser<Substring.UTF8View, Int>>, String>, Parsing.Parsers.Map<Parsing.Prefix<Substring>, String>>, String>, Int, String, Parsing.Parsers.UTF8ViewToSubstring<Parsing.Parsers.BoolParser<Substring.UTF8View>>>, User>, Array<__lldb_expr_45.User>, String>
 */


import Combine

let publisher = Just(1)
  .map { $0 + 1 }
  .flatMap { Just($0) }
  .filter { $0.isMultiple(of: 2) }
  .dropFirst()
  .ignoreOutput()
/*
 Combine.Publishers.IgnoreOutput<Combine.Publishers.Drop<Combine.Publishers.Filter<Combine.Publishers.FlatMap<Combine.Just<Int>, Combine.Just<Int>>>>>
 */

import SwiftUI

let view = Group {
  ForEach(1...10, id: \.self) { index in
    Button(action: {}) {
      HStack {
        Text("Number")
        Text("\(index)")
      }
    }
  }
}
/*
 SwiftUI.ForEach<ClosedRange<Int>, Int, SwiftUI.Button<SwiftUI.HStack<SwiftUI.TupleView<(SwiftUI.Text, SwiftUI.Text)>>>>
 */

VStack { Text(""); Text(""); Text(""); Text(""); Text(""); Text(""); Text(""); Text(""); Text(""); Text(""); }

Section {
  Text("Content")
} header: {
  Text("Header")
} footer: {
  Text("Footer")
}

NavigationLink {
  Text("Destination")
} label: {
  Text("Label")
}


