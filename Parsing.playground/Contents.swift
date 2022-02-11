import Parsing

var input = ""[...]

protocol Printer {
  associatedtype Input
  associatedtype Output
  func print(_ output: Output, to input: inout Input) throws
}

extension String: Printer {
  func print(_ output: (), to input: inout Substring) {
    input.append(contentsOf: self)
  }
}

struct PrintingError: Error {}

extension Prefix: Printer where Input == Substring {
  func print(_ output: Input, to input: inout Input) throws {
    guard output.allSatisfy(self.predicate!)
    else { throw PrintingError() }

    input.append(contentsOf: output)
  }
}

input = ""
try Prefix { $0 != "\"" }.print("Blob, Esq.", to: &input)
input

try Prefix
{ $0 != "\"" }.parse(&input)

input = ""
"Hello".print((), to: &input)
try "Hello".parse(&input) // ()

//print(<#T##items: Any...##Any#>, to: &<#T##TextOutputStream#>)

// parse: (inout Input) throws -> Output

// parse: (Input) throws -> (Output, Input)
// print: (Output, Input) throws -> Input

// print: (Output, inout Input) throws -> Void

// (S) -> (S, A)
// (inout S) -> A

let usersCsv = """
1, Blob, true
2, Blob Jr, false
3, Blob Sr, true
4, "Blob, Esq.", true
"""

struct User: Equatable {
  var id: Int
  var name: String
  var admin: Bool
}

//OneOf {
//  a.map(f)
//  b.map(f)
//  c.map(f)
//}
//==
//OneOf {
//  a
//  b
//  c
//}
//.map(f)

let quotedField = Parse {
  "\""
  Prefix { $0 != "\"" }
  "\""
}

//quotedField.print("Blob, Esq.", to: &input)

let field = OneOf {
  quotedField

  Prefix { $0 != "," }
}
.map(String.init)

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

input = usersCsv[...]
let output = try users.parse(&input)
input

"，" == ","

func print(user: User) -> String {
  "\(user.id), \(user.name.contains(",") ? "\"\(user.name)\"" : "\(user.name)"), \(user.admin)"
}
struct UserPrinter: Printer {
  func print(_ user: User, to input: inout String) {
    input.append(contentsOf: "\(user.id),")
    if user.name.contains(",") {
      input.append(contentsOf: "\"\(user.name)\"")
    } else {
      input.append(contentsOf: user.name)
    }
    input.append(contentsOf: ",\(user.admin)")
  }
}

print(user: .init(id: 42, name: "Blob", admin: true))

func print(users: [User]) -> String {
  users.map(print(user:)).joined(separator: "\n")
}
struct UsersPrinter: Printer {
  func print(_ users: [User], to input: inout String) {
    var firstElement = true
    for user in users {
      defer { firstElement = false }
      if !firstElement {
        input += "\n"
      }
      UserPrinter().print(user, to: &input)
    }
  }
}

input = ""
//users.print(output, to: &input)

print(users: output)

input = usersCsv[...]
try print(users: users.parse(input)) == input
try users.parse(print(users: output)) == output

var inputString = ""
UsersPrinter().print(output, to: &inputString)
inputString
