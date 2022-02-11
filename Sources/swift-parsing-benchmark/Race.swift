import Benchmark
import Parsing

/*
 This benchmark implements a parser for a custom format covered in a collection of episodes on
 Point-Free: https://www.pointfree.co/collections/parsing
 */

// MARK: - Parser

private struct Coordinate {
  let latitude: Double
  let longitude: Double
}

private enum Currency { case eur, gbp, usd }

private struct Money {
  let currency: Currency
  let dollars: Int
}

private struct Race {
  let location: String
  let entranceFee: Money
  let path: [Coordinate]
}

private let northSouth = OneOf {
  "N".utf8.map { 1.0 }
  "S".utf8.map { -1.0 }
}

private let eastWest = OneOf {
  "E".utf8.map { 1.0 }
  "W".utf8.map { -1.0 }
}

let multiplySign = Conversion<(Double, Double), Double>(
  apply: { magitude, sign in magitude * sign },
  unapply: { value in
    value < 0 ? (-value, -1) : (value, 1) 
  }
)

private let latitude = ParsePrint(multiplySign) {
  Double.parser()
  "° ".utf8
  northSouth
}

func foo() {
//  coord.print(<#T##output: Coordinate##Coordinate#>, to: &<#T##Substring.UTF8View#>)
//  currency.print(<#T##output: Currency##Currency#>, to: &<#T##Substring.UTF8View#>)
//  money.print(<#T##output: Money##Money#>, to: &<#T##Substring.UTF8View#>)
//  locationName.print(<#T##output: Substring.UTF8View##Substring.UTF8View#>, to: &<#T##Substring.UTF8View#>)
//  race.print(<#T##output: Race##Race#>, to: &<#T##Substring.UTF8View#>)
//  races.print(<#T##output: [Race]##[Race]#>, to: &<#T##Substring.UTF8View#>)
}

private let longitude = ParsePrint(multiplySign) {
  Double.parser()
  "° ".utf8
  eastWest
}

private let zeroOrMoreSpaces = Skip { Prefix { $0 == .init(ascii: " ") } }.printing(" "[...].utf8)

private let coord = ParsePrint(.struct(Coordinate.init(latitude:longitude:))) {
  latitude
  Skip {
    ",".utf8
    zeroOrMoreSpaces
  }
  longitude
}

private let currency = OneOf {
  "€".utf8.map { Currency.eur }
  "£".utf8.map { Currency.gbp }
  "$".utf8.map { Currency.usd }
}

let count = Conversion<[Void], Int>(
  apply: \.count,
  unapply: { .init(repeating: (), count: $0) }
)

//Always<Substring, Void>.init(()).print(<#T##output: Void##Void#>, to: &<#T##Substring#>)

func foo1() throws {
  var input = ""[...]
  let tmp = try Many { "$" }
//  tmp.print(<#T##output: [()]##[()]#>, to: &<#T##Substring#>)
    //.print([()], to: &input)

}

private let _money = OneOf {
  Many { "€" }.map(count).map(Conversion(apply: { Money(currency: .eur, dollars: $0 * 100)}, unapply: { $0.dollars / 100 }))
  Many { "£" }.map(count).map(Conversion(apply: { Money(currency: .gbp, dollars: $0 * 100)}, unapply: { $0.dollars / 100 }))
  Many { "$" }.map(count).map(Conversion(apply: { Money(currency: .usd, dollars: $0 * 100)}, unapply: { $0.dollars / 100 }))
}

private let money = ParsePrint(.struct(Money.init(currency:dollars:))) {
  currency
  Int.parser()
}

private let locationName = Prefix { $0 != .init(ascii: ",") }

private let race = ParsePrint(.struct(Race.init(location:entranceFee:path:))) {
  locationName.map(.string)
  Skip {
    ",".utf8
    zeroOrMoreSpaces
  }
  money
  "\n".utf8
  Many {
    coord
  } separator: {
    "\n".utf8
  }
}

private let races = Many {
  race
} separator: {
  "\n---\n".utf8
} terminator: {
  End()
}
 
// MARK: - Benchmarks

let raceSuite = BenchmarkSuite(name: "Race") { suite in
  let originalInput = """
    New York City, $300🥵
    40.60248° N, 74.06433° W
    40.61807° N, 74.02966° W
    40.64953° N, 74.00929° W
    40.67884° N, 73.98198° W
    40.69894° N, 73.95701° W
    40.72791° N, 73.95314° W
    40.74882° N, 73.94221° W
    40.7574° N, 73.95309° W
    40.76149° N, 73.96142° W
    40.77111° N, 73.95362° W
    40.8026° N, 73.93061° W
    40.80409° N, 73.92893° W
    40.81432° N, 73.93292° W
    40.80325° N, 73.94472° W
    40.77392° N, 73.96917° W
    40.77293° N, 73.97671° W
    ---
    Berlin, €
    13.36015° N, 52.51516° E
    13.33999° N, 52.51381° E
    13.32539° N, 52.51797° E
    13.33696° N, 52.52507° E
    13.36454° N, 52.52278° E
    13.38152° N, 52.52295° E
    13.40072° N, 52.52969° E
    13.42555° N, 52.51508° E
    13.41858° N, 52.49862° E
    13.40929° N, 52.48882° E
    13.37968° N, 52.49247° E
    13.34898° N, 52.48942° E
    13.34103° N, 52.47626° E
    13.32851° N, 52.47122° E
    13.30852° N, 52.46797° E
    13.28742° N, 52.47214° E
    13.29091° N, 52.4827° E
    13.31084° N, 52.49275° E
    13.32052° N, 52.5019° E
    13.34577° N, 52.50134° E
    13.36903° N, 52.50701° E
    13.39155° N, 52.51046° E
    13.37256° N, 52.51598° E
    ---
    London, £££££
    51.48205° N, 0.04283° E
    51.47439° N, 0.0217° E
    51.47618° N, 0.02199° E
    51.49295° N, 0.05658° E
    51.47542° N, 0.03019° E
    51.47537° N, 0.03015° E
    51.47435° N, 0.03733° E
    51.47954° N, 0.04866° E
    51.48604° N, 0.06293° E
    51.49314° N, 0.06104° E
    51.49248° N, 0.0474° E
    51.48888° N, 0.03564° E
    51.48655° N, 0.0183° E
    51.48085° N, 0.02223° W
    51.4921° N, 0.0451° W
    51.49324° N, 0.04699° W
    51.50959° N, 0.05491° W
    51.50961° N, 0.0539° W
    51.4995° N, 0.01356° W
    51.50898° N, 0.02341° W
    51.51069° N, 0.04225° W
    51.51056° N, 0.04353° W
    51.50946° N, 0.0781° W
    51.51121° N, 0.09786° W
    51.50964° N, 0.1187° W
    51.50273° N, 0.1385° W
    51.50095° N, 0.12411° W
    """
  var output: [Race]!

  suite.benchmark(
    name: "Parser",
    run: { output = try races.parse(originalInput) },
    tearDown: { precondition(output.count == 3) }
  )

  var input = ""[...].utf8
  suite.benchmark(
    name: "Printer",
    setUp: { input = ""[...].utf8 },
    run: {
      try races.print(output, to: &input)
    },
    tearDown: {
      precondition(String(Substring(input)) == originalInput)
    }
  )
}
