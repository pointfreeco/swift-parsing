
import Parsing

var input = """
1,Blob,true
2,Blob Jr,false
3,Blob Sr,true
4,"Blob, Esq.",true
"""[...]

enum Role {
  case admin, guest, member
}


Substring.UnicodeScalarView.init

let role = OneOf {
  "admin".map { Role.admin }
  "guest".map { Role.guest }
  "member".map { Role.member }
}

role.print
input = "admin"
try role.parse(&input)
try role.print(Role.admin, to: &input)
input

struct User {
  var id: Int
  var name: String
  var role: Role
}

let field = OneOf {
  Parse {
    "\""
    Prefix { $0 != "\"" }
    "\""
  }

  Prefix { $0 != "," }
}
  .map(.string)

let zeroOrOneSpace = OneOf {
  " "
  ""
}
  .printing(" ")

//extension Conversion where Input == (Int, String, Role), Output == User {
//  static let user = Self(
//    apply: User.init(id:name:role:),
//    unapply: { unsafeBitCast($0, to: Input.self) }
//  )
//}

"dog".starts(with: "")
"cat".starts(with: "")
"".starts(with: "")

MemoryLayout<(String, String)>.size
MemoryLayout<(String, String, String)>.size
MemoryLayout<(String, String)>.stride
MemoryLayout<(String, String, String)>.stride
MemoryLayout<(String, String)>.alignment
MemoryLayout<(String, String, String)>.alignment



let user = Parse(.struct(User.init)) {
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
//  Bool.parser()
  role
}

//  .map(.struct(User.init))

//  .map(.user)

//  .map(
//    .init(
//      apply: User.init,
//      unapply: { ($0.id, $0.name, $0.admin) }
//    )
//  )

input = ""
try user.print(
  User(id: 1, name: "Blob", role: .member),
  to: &input
)
input // "1,Blob,true"
1

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

input = ""
try users.print(
  [
    User(id: 1, name: "Blob", role: .member),
    User(id: 2, name: "Blob, Esq.", role: .admin),
  ],
  to: &input
)
input


func print(user: User) -> String {
  "\(user.id), "
  + (user.name.contains(",") ? "\"\(user.name)\"" : user.name)
  + ", \(user.role)"
}
func print(users: [User]) -> String {
  users.map(print(user:)).joined(separator: "\n")
}

//print(print(users: parsedUsers))



struct UserPrinter: Printer {
  func print(_ user: User, to input: inout String) {
    input.append(contentsOf: "\(user.id), ")
    if user.name.contains(",") {
      input.append(contentsOf: "\"\(user.name)\"")
    } else {
      input.append(contentsOf: user.name)
    }
    input.append(contentsOf: ", \(user.role)")
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
    .init(id: 1, name: "Blob", role: .member),
    .init(id: 2, name: "Blob jr", role: .guest),
    .init(id: 3, name: "Blob, Esq.", role: .admin),
  ],
  to: &inputString
)
inputString

input = "Hello World"
try "Hello".parse(&input)
"Hello".print((), to: &input)
input


input = ""
"Hello".print((), to: &input)
try "Hello".parse(&input)
input

//"Hello".print("Hello".parse("Hello")!) == "Hello" // true


//extension Prefix: Printer where Input: AppendableCollection {
//  func print(_ output: Input, to input: inout Input) throws {
//    input.append(contentsOf: output)
//  }
//}



//input = ""
//try Prefix
//{ $0 != "," }.print("Blob,", to: &input)
//input
//
//try Prefix
//{ $0 != "," }.parse(&input)
//input


1

1

try Prefix
{ $0 != "," }.parse("Hello")

//input = ""
//try Prefix
//{ $0 != "," }.print("Hello,", to: &input) // error was thrown: PrintingError()
//input

input = ""
try Prefix
{ $0 != "\"" }.print("Blob, Esq.", to: &input) // error was thrown: PrintingError()
input

/*
 error: unexpected output

 output:
 "Hello,"
       ^ element satisfying predicate
 */

1
2



input = ""
try Parse {
  Prefix { $0 != "\"" }
}
.print("Blob, Esq.", to: &input)
input

//extension Parsers.Map: Printer where Upstream: Printer {
//  func print(_ output: Output, to input: inout Upstream.Input) throws {
//    self.upstream.print(<#T##output: Upstream.Output##Upstream.Output#>, to: &<#T##Upstream.Input#>)
//  }
//}


let quotedField = Parse {
  "\""
  Prefix { $0 != "\"" }
  "\""
}

input = ""
try quotedField.print("Blob, Esq.", to: &input)
input // ""Blob, Esq.""

try quotedField.parse(&input)
input // ""

try quotedField.print("Blob, Esq.", to: &input)
input // ""Blob, Esq.""


let _field = OneOf {
  Parse {
    "\""
    Prefix { $0 != "\"" }
    "\""
  }

  Prefix { $0 != "," }
}

try field.parse("\"Blob, Esq.\",true") // "\"Blob,"


input = ""
try _field.print("Blob, Esq.", to: &input)
input // ""Blob, Esq.""

input = ""
try _field.print("Blob Jr.", to: &input)
input // ""Blob Jr.""



input = ""
try Parse { "Hello "; Int.parser(); "!" }
  .print(42, to: &input)
input // "Hello 42!"



input = ""
try user.print(User(id: 1, name: "Blob, Esq.", role: .admin), to: &input)
input // "1,"Blob, Esq.",true"



input = ""
try users.print(
  [
    User(id: 1, name: "Blob", role: .member),
    User(id: 2, name: "Blob, Esq.", role: .guest)
  ],
  to: &input
)
input // "1,Blob,true\n2,"Blob, Esq.",true\n"



let fieldUtf8 = OneOf {
  Parse {
    "\"".utf8
    Prefix { $0 != .init(ascii: "\"") }
    "\"".utf8
  }

  Prefix { $0 != .init(ascii: ",") }
}

Substring(try fieldUtf8.parse("\"Blob, Esq.\"".utf8))

var inputUtf8 = ""[...].utf8
try fieldUtf8.print("Blob, Esq."[...].utf8, to: &inputUtf8)
Substring(inputUtf8) // ""Blob, Esq.""




let userUtf8 = Parse {
  Int.parser()
  ",".utf8
  fieldUtf8
  ",".utf8
  Bool.parser()
}

inputUtf8 = ""[...].utf8
try userUtf8.print((id: 1, name: "Blob"[...].utf8, true), to: &inputUtf8)
Substring(inputUtf8) // "1,Blob,true"

let usersUtf8 = Many {
  userUtf8
} separator: {
  "\n".utf8
} terminator: {
  End()
}

inputUtf8 = ""[...].utf8
try usersUtf8.print(
  [
    (id: 1, name: "Blob"[...].utf8, true),
    (id: 2, name: "Blob Jr."[...].utf8, false),
    (id: 3, name: "Blob, Esq."[...].utf8, true),
  ],
  to: &inputUtf8
)
Substring(inputUtf8) // "1,Blob,true\n2,Blob Jr.,false\n3,"Blob, Esq.",true"




struct SomeError: Error {}
let adHocQuotedField = AnyParser<Substring, Substring> { input in
  guard input.removeFirst() == "\n"
  else { throw SomeError() }
  let field = input.prefix(while: { $0 != "\"" })
  guard input.removeFirst() == "\n"
  else { throw SomeError() }
  return field
}



let fieldString = OneOf {
  Parse {
    "\""
    Prefix { $0 != "\"" }
    "\""
  }

  Prefix { $0 != "," }
}
//  .map(.init(apply: <#T##(Substring) -> String#>, unapply: <#T##(String) -> Substring#>))
  .map(.init(apply: { String($0) }, unapply: { Substring($0) }))

input = ""
try fieldString.print("Blob, Esq.", to: &input)
input


//extension Parse {
//  init<Upstream, NewOutput>(
//    apply: @escaping (Upstream.Output) -> NewOutput,
//    unapply: @escaping (NewOutput) -> Upstream.Output,
//    @ParserBuilder with build: () -> Upstream
//  ) where Parsers == Parsing.Parsers.MapConversion<Upstream, NewOutput> {
//    self.init({ build().map(apply: apply, unapply: unapply) })
//  }
//  init<Upstream, NewOutput>(
//    _ conversion: Conversion<Upstream.Output, NewOutput>,
//    @ParserBuilder with build: () -> Upstream
//  ) where Parsers == Parsing.Parsers.MapConversion<Upstream, NewOutput> {
//    self.init({ build().map(apply: conversion.apply, unapply: conversion.unapply) })
//  }
//}




let user_ = Parse { // (.destructure(User.init(id:name:admin:)))
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


//unsafeBitCast("Hello", to: Substring.self)



1



1



unsafeBitCast((1, "Blob", true), to: User.self)


struct Private {
  let value: Int
  private init(value: Int) {
    self.value = value
  }
}

//Private(value: 10)
// 'Private' initializer is inaccessible due to 'private' protection level

unsafeBitCast(1, to: Private.self)


struct Person {
  let firstName, lastName: String
  let bio: String
  init(lastName: String, firstName: String) {
    self.firstName = firstName
    self.lastName = lastName
    self.bio = ""
  }
}
1


let person = Parse(.struct(Person.init)) {
  Prefix { $0 != " " }.map(.string)
  " "
  Prefix { $0 != " " }.map(.string)
}

input = "Blob McBlob"
let p = try person.parse(&input)
print(p)
//try person.print(p, to: &input)
input

//unsafeBitCast(("A", "B"), to: (String, String, String).self)



//MemoryLayout<(Int, String)>.alignment == MemoryLayout<(String, Int)>.alignment
//MemoryLayout<(Int, String)>.size == MemoryLayout<(String, Int)>.size
//MemoryLayout<(Int, String)>.offset(of: <#T##PartialKeyPath<(Int, String)>#>)stride == MemoryLayout<(String, Int)>.stride


//unsafeBitCast((1, ""), to: (String, Int).self)

