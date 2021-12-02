import Parsing

var input = ""[...]

struct User {
  var id: Int
  var name: String
  var role: String
}

input = """
1,Blob,member
2,Blob Jr,guest
3,Blob Sr,admin
"""

let user = Int.parser()
  .skip(",")
  .take(Prefix { $0 != "," }.map(String.init))
  .skip(",")
  .take(Prefix { $0 != "\n" }.map(String.init))
  .map(User.init(id:name:role:))

1

let users = Many(user, separator: "\n")

users.parse(&input)
input

1
