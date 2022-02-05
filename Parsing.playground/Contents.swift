
import Parsing

var input = """
1,Blob,true
2,Blob Jr,false
3,Blob Sr,true
4,"Blob, Esq.",true
"""[...]

struct Conversion<Input, Output> {
  let apply: (Input) -> Output
  let unapply: (Output) -> Input

  static func destructure(
    _ `init`: @escaping (Input) -> Output
  ) -> Conversion<Input, Output> {
    .init(
      apply: `init`,
      unapply: {
        unsafeBitCast($0, to: Input.self)
      }
    )
  }
}
extension Parser where Self: Printer {
  func map<NewOutput>(
    _ conversion: Conversion<Output, NewOutput>
  ) -> AnyParserPrinter<Input, NewOutput> {
    .init(
      parse: { input in
        try conversion.apply(self.parse(&input))
      },
      print: { newOutput, input in
        try self.print(conversion.unapply(newOutput), to: &input)
      }
    )
  }
}


struct User {
  var id: Int
  var name: String
  var admin: Bool
}

let field = OneOf {
  Parse {
    "\""
    Prefix { $0 != "\"" }
    "\""
  }

  Prefix { $0 != "," }
}
  .map(.init(apply: { String($0) }, unapply: { Substring($0) }))

let zeroOrOneSpace = OneOf {
  " "
  ""
}

let user = Parse {
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
  .map(
    .init(
      apply: User.init(id:name:admin:),
      unapply: { ($0.id, $0.name, $0.admin) }
    )
  )
//  .map(
//    .init(
//      apply: User.init,
//      unapply: { ($0.id, $0.name, $0.admin) }
//    )
//  )

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
    .init(id: 1, name: "Blob", admin: true),
    .init(id: 2, name: "Blob, Esq.", admin: true),
  ],
  to: &input
)
input


func print(user: User) -> String {
  "\(user.id), "
  + (user.name.contains(",") ? "\"\(user.name)\"" : user.name)
  + ", \(user.admin)"
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

extension Prefix: Printer where Input: AppendableCollection {
  func print(_ output: Input, to input: inout Input) throws {
    guard output.allSatisfy(self.predicate!)
    else { throw PrintingError() }

    input.append(contentsOf: output)
  }
}

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
try user.print(User(id: 1, name: "Blob, Esq.", admin: true), to: &input)
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
    User(id: 1, name: "Blob", admin: true),
    User(id: 2, name: "Blob, Esq.", admin: true)
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

struct AnyParserPrinter<Input, Output>: Parser, Printer {
  let parse: (inout Input) throws -> Output
  let print: (Output, inout Input) throws -> Void
  func parse(_ input: inout Input) throws -> Output {
    try self.parse(&input)
  }
  func print(_ output: Output, to input: inout Input) throws {
    try self.print(output, &input)
  }
}


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

