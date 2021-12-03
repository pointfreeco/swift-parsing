import Parsing
import Foundation

var input = ""[...]

struct User {
  var id: Int
  var name: String
  var role: Role
}

enum Role {
  case admin, guest, member
}

input = """
1  ,  Blob  ,member
2,Blob Jr   , guest
    3,Blob Sr   ,admin
"""

OneOfMany(
  "admin".map { Role.admin },
  "guest".map { Role.guest },
  "member".map { Role.member }
)

let role = "admin".map { Role.admin }
  .orElse("guest".map { Role.guest })
  .orElse("member".map { Role.member })

import SwiftUI

let zeroOrMoreSpaces = Prefix<Substring> { $0 == " " }

let user = Skip(zeroOrMoreSpaces)
  .take(Int.parser())
  .skip(zeroOrMoreSpaces)
  .skip(",")
  .skip(zeroOrMoreSpaces)
  .take(Prefix { $0 != "," }.map(String.init(_:)))
  .skip(zeroOrMoreSpaces)
  .skip(",")
  .skip(zeroOrMoreSpaces)
  .take(role)
  .skip(zeroOrMoreSpaces)
  .map(User.init(id:name:role:))

1

let users = Many(user, separator: "\n")

users.parse(&input)
input

1
