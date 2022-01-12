import Parsing

//struct Color {
//  let red, green, blue: UInt8
//}
//
//let hexPrimary = Prefix(2)
//  .compactMap { UInt8($0, radix: 16) }
//
//let hexColor = Parse(Color.init(red:green:blue:)) {
//  "#"
//  hexPrimary
//  hexPrimary
//  hexPrimary
//}
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

let user = Parse {
  Int.parser()
  ","
  OneOf {
    Parse {
      "\""
      Prefix { $0 != "\"" }
      "\""
    }
    Prefix { $0 != "," }
  }
  ","
  Bool.parser()
}

let users = Many {
  user
} separator: {
  "\n"
}

users.print([
  (1, "Blob", true),
  (2, "Blob, Esq.", false),
])
