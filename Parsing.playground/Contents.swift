
import Parsing

var input = """
1,Blob,true
2,Blob Jr,false
3,Blob Sr,true
4,"Blob, Esq.",true
"""[...]

struct User {
  var id: Int
  var name: String
  var admin: Bool
}

let field = OneOf {
  Parse {
    "\""
    Prefix { $0 != "\"" }.map(String.init)
    "\""
  }

  Prefix { $0 != "," }.map(String.init)
}

let zeroOrOneSpace = OneOf {
  " "
  ""
}

let user = Parse(User.init(id:name:admin:)) {
  Int.parser()
  Skip {
    ","
    zeroOrOneSpace
  }
  field
  Skip {
    ","
    zeroOrOneSpace
  }
  Bool.parser()
}

let users = Many {
  user
} separator: {
  "\n"
} terminator: {
  End()
}

let parsedUsers = try users.parse(&input)
input
1



func print(user: User) -> String {
  "\(user.id), "
  + (user.name.contains(",") ? "\"\(user.name)\"" : user.name)
  + ", \(user.admin)"
}
func print(users: [User]) -> String {
  users.map(print(user:)).joined(separator: "\n")
}

print(print(users: parsedUsers))


protocol Printer {
  associatedtype Input
  associatedtype Output
  func print(_ output: Output, to input: inout Input) throws
}

struct UserPrinter: Printer {
  func print(_ user: User, to input: inout String) {
    input.append(contentsOf: "\(user.id), ")
    if user.name.contains(",") {
      input.append(contentsOf: "\"\(user.name)\"")
    } else {
      input.append(contentsOf: user.name)
    }
    input.append(contentsOf: ", \(user.admin)")
  }
}


struct UsersPrinter: Printer {
  func print(_ output: [User], to input: inout String) {
    for user in output {
      UserPrinter().print(user, to: &input)
      input += "\n"
    }
    input.removeLast()
  }
}

var inputString = ""
UsersPrinter().print(
  [
    .init(id: 1, name: "Blob", admin: true),
    .init(id: 2, name: "Blob jr", admin: false),
    .init(id: 3, name: "Blob, Esq.", admin: true),
  ],
  to: &inputString
)
inputString

extension String: Printer {
  func print(_ output: (), to input: inout Substring) {
    input.append(contentsOf: self)
  }
}

input = "Hello World"
try "Hello".parse(&input)
"Hello".print((), to: &input)
input


input = ""
"Hello".print((), to: &input)
try "Hello".parse(&input)
input

//"Hello".print("Hello".parse("Hello")!) == "Hello" // true

struct PrintingError: Error {}

extension Prefix: Printer where Input == Substring {
  func print(_ output: Input, to input: inout Input) throws {
    guard output.allSatisfy(self.predicate!)
    else { throw PrintingError() }

    input.append(contentsOf: output)
  }
}

try Prefix(5)
{ $0 != "," }
.parse("Hello, World")


1
