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
1,Blob,member
2,Blob Jr,guest
3,Blob Sr,admin
"""[...]

enum Role {
  case admin, guest, member
}

let role = "admin".map { Role.admin }
  .orElse("guest".map { Role.guest })
  .orElse("member".map { Role.member })

struct User {
  var id: Int
  var name: String
  var role: Role
}

let user = Int.parser()
  .skip(",")
  .take(Prefix { $0 != "," }.map(String.init))
  .skip(",")
  .take(role)
  .map(User.init(id:name:role:))

let users = Many(user, separator: "\n")
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
