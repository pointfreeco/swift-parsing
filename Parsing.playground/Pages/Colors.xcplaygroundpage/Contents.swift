import Parsing

struct Color {
  let red, green, blue: UInt8
}

let hexPrimary = Prefix<Substring>(2)
  .map(
    PartialConversion(
      apply: { UInt8($0, radix: 16) },
      unapply: { String(format: "%02X", $0)[...] }
    )
  )

let hexColor = StartsWith("#")
  .take(hexPrimary)
  .take(hexPrimary)
  .take(hexPrimary)
  .map(Conversion.unsafeBitCast(to: Color.init(red:green:blue:)))

do {
  var hex = "#000000"[...]
  let color = hexColor.parse(&hex)!
  print(hexColor.print(color)!, color)
}

do {
  var hex = "#FF0000"[...]
  let color = hexColor.parse(&hex)!
  print(hexColor.print(color)!, color)
}
