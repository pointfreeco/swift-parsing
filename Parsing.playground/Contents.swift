import Parsing


1


var input = """
1,Blob,admin
2,Blob Jr,guest
3,Blob Sr,member
"""[...]

struct User {
  var id: Int
  var name: String
  var role: Role
}

enum Role {
  case admin, guest, member
}

let role = Parsers.OneOf {
  "admin".map { Role.admin }
  "guest".map { Role.guest }
  "member".map { Role.member }
}

let user = Parse(User.init(id:name:role:)) {
  Int.parser()
  ","
  Prefix { $0 != "," }.map(String.init)
  ","
  role
}

let users = Many {
  Parse(User.init(id:name:role:)) {
    Int.parser()
    ","
    Prefix { $0 != "," }.map(String.init)
    ","
    Parsers.OneOf {
      "admin".map { Role.admin }
      "guest".map { Role.guest }
      "member".map { Role.member }
    }
  }
} separatedBy: {
  "\n"
}

users.parse(&input)
input
