
import Parsing

var input = """
1,Blob,true
2,Blob Jr,false
3,Blob Sr,true
4,"Blob, Esq.",true
"""[...]

struct Conversion<Input, Output> {
  let apply: (Input) throws -> Output
  let unapply: (Output) throws -> Input
}

enum Role {
  case admin, guest, member
}


extension Parsers.Map: Printer
where
  Upstream: Printer,
  Upstream.Output == Void,
  Output: Equatable
{
  func print(_ output: Output, to input: inout Upstream.Input) throws {
    guard self.transform(()) == output
    else {
      throw PrintingError()
    }
    try self.upstream.print((), to: &input)
  }
}

extension Parsers.OneOf3: Printer where P0: Printer, P1: Printer, P2: Printer {
  func print(_ output: P0.Output, to input: inout P0.Input) throws {
    do {
      try self.p2.print(output, to: &input)
    } catch {
      do {
        try self.p1.print(output, to: &input)
      } catch {
        try self.p0.print(output, to: &input)
      }
    }
  }
}

struct ConversionError: Error {}

extension Conversion where Input == Void, Output: Equatable {
  static func exactly(_ output: Output) -> Self {
    .init(
      apply: { output },
      unapply: {
        guard $0 == output
        else { throw ConversionError() }
      }
    )
  }
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

extension Parsers {
  struct Printing<Upstream: Parser>: Parser, Printer where Upstream.Input: AppendableCollection {
    let upstream: Upstream
    let input: Upstream.Input

    func parse(_ input: inout Upstream.Input) throws -> Upstream.Output {
      try self.upstream.parse(&input)
    }

    func print(_ output: Upstream.Output, to input: inout Upstream.Input) {
      input.append(contentsOf: self.input)
    }
  }
}

extension Parser {
  func printing(_ input: Input) -> Parsers.Printing<Self> where Input: AppendableCollection {
    .init(upstream: self, input: input)
  }
}

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

extension Conversion {
  static func `struct`(_ `init`: @escaping (Input) -> Output) -> Self {
    .init(
      apply: `init`,
      unapply: {
//        guard
//          MemoryLayout<Input>.size == MemoryLayout<Output>.size,
//          MemoryLayout<Input>.stride == MemoryLayout<Output>.stride,
//          MemoryLayout<Input>.alignment == MemoryLayout<Output>.alignment,
//          MemoryLayout<Input>.offset(of: <#T##PartialKeyPath<Input>#>)
//        else {
//          throw ...
//        }

        unsafeBitCast($0, to: Input.self)
      }
    )
  }
}

MemoryLayout<(String, String)>.size
MemoryLayout<(String, String, String)>.size
MemoryLayout<(String, String)>.stride
MemoryLayout<(String, String, String)>.stride
MemoryLayout<(String, String)>.alignment
MemoryLayout<(String, String, String)>.alignment


extension Parse {
  init<Upstream, NewOutput>(
    _ conversion: Conversion<Upstream.Output, NewOutput>,
    @ParserBuilder with build: () -> Upstream
  ) where Parsers == Parsing.Parsers.ReversibleMap<Upstream, NewOutput> {
    self.init { build().map(conversion) }
  }
}

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

//extension Prefix: Printer where Input: AppendableCollection {
//  func print(_ output: Input, to input: inout Input) throws {
//    input.append(contentsOf: output)
//  }
//}


extension Prefix: Printer where Input: AppendableCollection {
  func print(_ output: Input, to input: inout Input) throws {
    guard output.allSatisfy(self.predicate!)
    else { throw PrintingError() }

    input.append(contentsOf: output)
  }
}

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

extension Parse: Printer where Parsers: Printer {
  func print(_ output: Parsers.Output, to input: inout Parsers.Input) throws {
    try self.parsers.print(output, to: &input)
  }
}


input = ""
try Parse {
  Prefix { $0 != "\"" }
}
.print("Blob, Esq.", to: &input)
input


extension Parsers.ZipVOV: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer
{
  func print(_ output: (P1.Output), to input: inout P0.Input) throws {
    try self.p0.print((), to: &input)
    try self.p1.print(output, to: &input)
    try self.p2.print((), to: &input)
  }
}

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

extension OneOf: Printer where Parsers: Printer {
  func print(_ output: Parsers.Output, to input: inout Parsers.Input) throws {
    try self.parsers.print(output, to: &input)
  }
}

extension Parsers.OneOf2: Printer where P0: Printer, P1: Printer {
  func print(_ output: P0.Output, to input: inout P0.Input) throws {
    do {
      try self.p1.print(output, to: &input)
    } catch {
      try self.p0.print(output, to: &input)
    }
  }
}


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


extension Skip: Printer where Parsers: Printer, Parsers.Output == Void {
  func print(_ output: (), to input: inout Parsers.Input) throws {
    try self.parsers.print((), to: &input)
  }
}

extension Parsers.ZipVV: Printer where P0: Printer, P1: Printer {
  func print(_ output: (), to input: inout P0.Input) throws {
    try self.p0.print((), to: &input)
    try self.p1.print((), to: &input)
  }
}


extension Parsers.IntParser: Printer where Input: AppendableCollection {
  func print(_ output: Output, to input: inout Input) throws {
    input.append(contentsOf: String(output, radix: self.radix).utf8)
  }
}

extension FromUTF8View: Printer where UTF8Parser: Printer {
  func print(_ output: UTF8Parser.Output, to input: inout Input) throws {
    var utf8Input = self.toUTF8(input)
    defer { input = self.fromUTF8(utf8Input) }
    try self.utf8Parser.print(output, to: &utf8Input)
  }
}


input = ""
try Parse { "Hello "; Int.parser(); "!" }
  .print(42, to: &input)
input // "Hello 42!"

extension Parsers.BoolParser: Printer where Input: AppendableCollection {
  func print(_ output: Bool, to input: inout Input) throws {
    input.append(contentsOf: String(output).utf8)
  }
}

extension Parsers.ZipOVOVO: Printer where P0: Printer, P1: Printer, P2: Printer, P3: Printer, P4: Printer {
  func print(_ output: (P0.Output, P2.Output, P4.Output), to input: inout P0.Input) throws {
    try self.p0.print(output.0, to: &input)
    try self.p1.print((), to: &input)
    try self.p2.print(output.1, to: &input)
    try self.p3.print((), to: &input)
    try self.p4.print(output.2, to: &input)
  }
}


input = ""
try user.print(User(id: 1, name: "Blob, Esq.", role: .admin), to: &input)
input // "1,"Blob, Esq.",true"



extension Many: Printer
where
  Element: Printer,
  Result == [Element.Output],
  Separator: Printer,
  Separator.Output == Void
{
  func print(_ output: [Element.Output], to input: inout Element.Input) throws {
    var firstElement = true
    for elementOutput in output {
      defer { firstElement = false }
      if !firstElement {
        try self.separator.print((), to: &input)
      }
      try self.element.print(elementOutput, to: &input)
    }
  }
}


input = ""
try users.print(
  [
    User(id: 1, name: "Blob", role: .member),
    User(id: 2, name: "Blob, Esq.", role: .guest)
  ],
  to: &input
)
input // "1,Blob,true\n2,"Blob, Esq.",true\n"


protocol AppendableCollection: Collection {
  mutating func append<S: Sequence>(contentsOf elements: S) where S.Element == Element
}

extension Substring.UTF8View: AppendableCollection {
  public mutating func append<S>(contentsOf newElements: S)
  where
S: Sequence,
  String.UTF8View.Element == S.Element
  {
    var result = Substring(self)
    result.append(contentsOf: Substring(decoding: Array(newElements), as: UTF8.self))
    self = result.utf8
  }
}

import Foundation

extension Substring: AppendableCollection {}
extension ArraySlice: AppendableCollection {}
extension Data: AppendableCollection {}
extension Substring.UnicodeScalarView: AppendableCollection {}

extension String.UTF8View: Printer {
  func print(_ output: (), to input: inout Substring.UTF8View) throws {
    input.append(contentsOf: self)
  }
}


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


extension Parsers {
  struct ReversibleMap<Upstream, Output>: Parser, Printer where Upstream: Parser, Upstream: Printer {
    public let upstream: Upstream
    public let transform: (Upstream.Output) throws -> Output
    public let untransform: (Output) throws -> Upstream.Output

    func parse(_ input: inout Upstream.Input) throws -> Output {
      try self.transform(self.upstream.parse(&input))
    }

    func print(_ output: Output, to input: inout Upstream.Input) throws {
      try self.upstream.print(self.untransform(output), to: &input)
    }
  }
}

extension Parser {
  func map<NewOutput>(
    transform: @escaping (Output) throws -> NewOutput,
    untransform: @escaping (NewOutput) throws -> Output
  ) -> Parsers.ReversibleMap<Self, NewOutput> {
    .init(upstream: self, transform: transform, untransform: untransform)
  }

  func map<NewOutput>(
    _ conversion: Conversion<Output, NewOutput>
  ) -> Parsers.ReversibleMap<Self, NewOutput> {
    .init(upstream: self, transform: conversion.apply, untransform: conversion.unapply)
  }
}


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

extension Conversion where Input == Substring, Output == String {
  static let string = Self(
    apply: { String($0) },
    unapply: { Substring($0) }
  )
}

extension Parsers.ZipOVO: Printer where P0: Printer, P1: Printer, P2: Printer {
  func print(_ output: (P0.Output, P2.Output), to input: inout P0.Input) throws {
    try self.p0.print(output.0, to: &input)
    try self.p1.print((), to: &input)
    try self.p2.print(output.1, to: &input)
  }
}

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
