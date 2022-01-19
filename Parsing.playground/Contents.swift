import Parsing

var input = """
1,Blob,true
2,Blob Jr,false
3,Blob Sr,true
4,"Blob, Esq.",true
"""[...]

struct User: Equatable {
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

let user = Parse(User.init(id:name:admin:)) {
  Int.parser()
  ","
  field
  ","
  Bool.parser()
}

let users = Many {
  user
} separator: {
  "\n"
}

//let parsedUsers = users.parse(&input)!
//input



func print(user: User) -> String {
  "\(user.id),"
  + (user.name.contains(",") ? "\"\(user.name)\"" : user.name)
  + ",\(user.admin)"
}


print(user: .init(id: 42, name: "Blob", admin: true))


func print(users: [User]) -> Substring {
  users.map(print(user:)).joined(separator: "\n")[...]
}

//users.parse(print(users: parsedUsers)) == parsedUsers // true

let output = users.parse(input)!

print(users: output)

print(users: users.parse(input)!) == input
users.parse(print(users: output)) == output


protocol Printer {
  associatedtype Input
  associatedtype Output
  func print(_ output: Output) -> Input?
}

extension String: Printer {
  func print(_ output: ()) -> Substring? {
    self[...]
  }
}


"Hello".parse("Hello 123".print(())!)

"Hello".print("Hello".parse("Hello")!) == "Hello"
"Hello".print("Hello".parse("Hello 123")!) == "Hello 123"



extension Prefix: Printer {
  func print(_ output: Input) -> Input? {
    if output.allSatisfy(self.predicate!) {
      return output
    } else {
      return nil
    }
  }
}




//Prefix { $0 != "," }
//.parse(
//  Prefix { $0 != "," }.print("Blob, Esq.")!
//)
//
//Prefix
//{ $0 != "," }
//.print(
//  Prefix { $0 != "," }.parse("Blob, Esq.")!
//)

Prefix
{ $0 != "," }
.print(
Prefix { $0 != "," }.print("Blob Jr.")!
)
// "Blob Jr."

extension Parse: Printer where Parsers: Printer {
  func print(_ output: Parsers.Output) -> Parsers.Input? {
    self.parsers.print(output)
  }
}
1


Parse
{
  Prefix { $0 != "\"" }
}
.print("Blob, Esq.") // "Blob, Esq."


extension Parsers.ZipVOV: Printer
where
P0: Printer,
P1: Printer,
P2: Printer,
P0.Input: RangeReplaceableCollection
{
  func print(_ output: P1.Output) -> P0.Input? {
    guard
      let input0 = self.p0.print(()),
      let input1 = self.p1.print(output),
      let input2 = self.p2.print(())
    else {
      return nil
    }
    return input0 + input1 + input2
  }
}
1



let quotedField = Parse {
  "\""
  Prefix { $0 != "\"" }
  "\""
}


quotedField
  .parse(
    quotedField.print("Blob, Esq.")!
  )! == "Blob, Esq."

quotedField
  .print(
    quotedField.parse("\"Blob, Esq.\"")!
  ) == "\"Blob, Esq.\""


extension Parsers.OneOf2: Printer where P0: Printer, P1: Printer {
  func print(_ output: P0.Output) -> P0.Input? {
    self.p1.print(output)
    ?? self.p0.print(output)
  }
}

extension Skip: Printer where Parsers: Printer, Parsers.Output == Void {
  func print(_ output: ()) -> Parsers.Input? {
    self.parsers.print(())
  }
}


extension Parsers.ZipVV: Printer
where
  P0: Printer,
  P1: Printer,
  P0.Input: RangeReplaceableCollection
{
  func print(_ output: ()) -> P0.Input? {
    guard let input0 = self.p0.print(())
    else { return nil }
    guard let input1 = self.p1.print(())
    else { return nil }
    return input0 + input1
  }
}


extension Parsers.IntParser: Printer where Input == Substring.UTF8View {
  public func print(_ output: Output) -> Input? {
    String(output, radix: self.radix)[...].utf8
  }
}

extension FromUTF8View: Printer where UTF8Parser: Printer {
  func print(_ output: UTF8Parser.Output) -> Input? {
    self.utf8Parser.print(output).map(self.fromUTF8)
  }
}


let field_ = OneOf {
  Parse {
    "\""
    Prefix { $0 != "\"" }
    "\""
  }

  Prefix { $0 != "," }
}

1

Parse
{
  "Hello "
  Int.parser()
  "!"
}
.parse("Hello 42!") // 42
Parse
{
  "Hello "
  Int.parser()
  "!"
}
.print(42) // "Hello 42!"



extension Parsers.ZipOVOVO: Printer
where
  P0: Printer,
  P1: Printer,
  P2: Printer,
  P3: Printer,
  P4: Printer,
  P0.Input: RangeReplaceableCollection
{
  func print(_ output: (P0.Output, P2.Output, P4.Output)) -> P0.Input? {
    guard
      let input0 = self.p0.print(output.0),
      let input1 = self.p1.print(()),
      let input2 = self.p2.print(output.1),
      let input3 = self.p3.print(()),
      let input4 = self.p4.print(output.2)
    else { return nil }
    return input0 + input1 + input2 + input3 + input4
  }
}

extension Parsers.BoolParser: Printer where Input == Substring.UTF8View {
  public func print(_ output: Bool) -> Input? {
    switch output {
    case true:
      return "true"[...].utf8
    case false:
      return "false"[...].utf8
    }
  }
}
extension OneOf: Printer where Parsers: Printer {
  func print(_ output: Parsers.Output) -> Parsers.Input? {
    self.parsers.print(output)
  }
}


let user_ = Parse {
  Int.parser()
  Skip {
    ","
//    zeroOrOneSpace
  }
  field_
  Skip {
    ","
//    zeroOrOneSpace
  }
  Bool.parser()
}
1


user_.print((id: 2, name: "Blob, Esq.", admin: true)) // "2,"Blob, Esq.",true"



extension Many: Printer
where
Element: Printer,
Element.Input == Substring,
Result == [Element.Output],
Separator: Printer,
Separator.Output == Void
{
  func print(_ output: [Element.Output]) -> Element.Input? {
    var input = ""[...]
    var firstElement = true
    for elementOutput in output {
      defer { firstElement = false }

      if !firstElement {
        guard let separator = self.separator?.print(())
        else { return input }
        input.append(contentsOf: separator)
      }

      guard let elementInput = self.element.print(elementOutput)
      else { return input }

      input.append(contentsOf: elementInput)
    }
    return input
  }
}

let users_ = Many {
  user_
} separator: {
  "\n"
}

print(
users_.print([
  (1, "Blob", true),
  (1, "Blob, Esq.", true),
])!
)




extension Substring.UTF8View: RangeReplaceableCollection {
  public init() {
    self = ""[...].utf8
  }

  public mutating func append<S>(contentsOf newElements: S) where S : Sequence, String.UTF8View.Element == S.Element {
    var result = Substring(self)
    result.append(contentsOf: Substring(decoding: Array(newElements), as: UTF8.self))
    self = result.utf8
  }
}

extension String.UTF8View: Printer {
  func print(_ output: ()) -> Substring.UTF8View? {
    String(self)[...].utf8
  }
}

let quotedFieldUtf8 = Parse {
  "\"".utf8
  Prefix { $0 != .init(ascii: "\"") }
  "\"".utf8
}
let fieldUtf8 = OneOf {
  quotedFieldUtf8
  Prefix { $0 != .init(ascii: ",") }
}

Substring(fieldUtf8.print("Blob"[...].utf8)!)
Substring(fieldUtf8.print("Blob, Esq."[...].utf8)!)

let userUtf8 = Parse {
  Int.parser()
  ",".utf8
  fieldUtf8
  ",".utf8
  Bool.parser()
}

Substring(userUtf8.print((42, "Blob, Esq."[...].utf8, true))!)
