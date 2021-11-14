import Parsing


let user = Parse {
  Int.parser()
  OneOf {
    "\t"
    ","
  }
  Prefix { $0 != "\t" && $0 != "," }
  OneOf {
    "\t"
    ","
  }
  Bool.parser()
}

let user1 = OneOf {
  Parse {
    Int.parser()
    "\t"
    Prefix { $0 != "\t" }
    "\t"
    Bool.parser()
  }
  Parse {
    Int.parser()
    ","
//    FromUTF8View { Whitespace().preferredPrinting(" "[...].utf8) }
    Prefix { $0 != "," }
    ","
    Bool.parser()
  }
}

user.parse("42,Blob,true")
user.parse("42\tBlob\ttrue")
user.print((42, "Blob", true))

11



//struct Color {
//  let red, green, blue: UInt8
//}
//
//let hexPrimary = Prefix(2)
//  .compactMap { UInt8($0, radix: 16) }
//
//let hexColor = Parse {
//  "#"
//  hexPrimary
//  hexPrimary
//  hexPrimary
//}
//.map(Color.init)
//
//do {
//  var hex = "#000000"[...]
//  print(hexColor.parse(&hex)!)
//}
//
//do {
//  var hex = "#FF0000"[...]
//  print(hexColor.parse(&hex)!)
//}
