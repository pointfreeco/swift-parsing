# swift-parsing

![CI](https://github.com/pointfreeco/swift-parsing/workflows/CI/badge.svg)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fpointfreeco%2Fswift-parsing%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/pointfreeco/swift-parsing)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fpointfreeco%2Fswift-parsing%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/pointfreeco/swift-parsing)

A library for turning unstructured data into structured data, with a focus on composition, performance, generality, and invertibility:

* **Composition**: Ability to break large, complex parsing problems down into smaller, simpler ones. And the ability to take small, simple parsers and easily combine them into larger, more complex ones.

* **Performance**: Parsers that have been composed of many smaller parts should perform as well as highly-tuned, hand-written parsers.

* **Generality**: Ability to parse _any_ kind of input into _any_ kind of output. This allows you to choose which abstraction levels you want to work on based on how much performance you need or how much correctness you want guaranteed. For example, you can write a highly tuned parser on collections of UTF-8 code units, and it will automatically plug into parsers of strings, arrays, unsafe buffer pointers and more.

* **Invertibility**: Ability to invert your parsers so that they are printers. This allows you to transform your well-structured data back into unstructured data, which is useful for serialization, sending data over the network, [URL routing][swift-url-routing], and more.

---

* [Motivation](#motivation)
* [Getting started](#getting-started)
* [Benchmarks](#benchmarks)
* [Documentation](#documentation)
* [Other libraries](#other-libraries)
* [License](#license)

## Learn More

This library was designed over the course of many [episodes](https://www.pointfree.co/collections/parsing) on [Point-Free](https://www.pointfree.co), a video series exploring functional programming and the Swift language, hosted by [Brandon Williams](https://twitter.com/mbrandonw) and [Stephen Celis](https://twitter.com/stephencelis). You can watch all of the episodes [here](https://www.pointfree.co/collections/parsing).

<a href="https://www.pointfree.co/collections/parsing">
  <img alt="video poster image" src="https://d3rccdn33rt8ze.cloudfront.net/episodes/0126.jpeg" width="600">
</a>

## Motivation

Parsing is a surprisingly ubiquitous problem in programming. We can define parsing as trying to transform unstructured data into structured data. The Swift standard library comes with a number of parsers that we reach for every day. For example, there are initializers on `Int`, `Double`, and even `Bool`, that attempt to parse numbers and booleans from strings:

```swift
Int("42")          // 42
Int("Hello")       // nil

Double("123.45")   // 123.45
Double("Goodbye")  // nil

Bool("true")       // true
Bool("0")          // nil
```

And there are types like `JSONDecoder` and `PropertyListDecoder` that attempt to parse `Decodable`-conforming types from data:

```swift
try JSONDecoder().decode(User.self, from: data)
try PropertyListDecoder().decode(Settings.self, from: data)
```

While parsers are everywhere in Swift, Swift has no holistic story _for_ parsing. Instead, we typically parse data in an ad hoc fashion using a number of unrelated initializers, methods, and other means. And this typically leads to less maintainable, less reusable code.

This library aims to write such a story for parsing in Swift. It introduces a single unit of parsing that can be combined in interesting ways to form large, complex parsers that can tackle the programming problems you need to solve in a maintainable way.

## Getting started

> This is an abridged version of the ["Getting Started"][getting-started-docs] article in the library's [documentation][swift-parsing-docs].

Suppose you have a string that holds some user data that you want to parse into an array of `User`s:

```swift
var input = """
1,Blob,true
2,Blob Jr.,false
3,Blob Sr.,true
"""

struct User {
  var id: Int
  var name: String
  var isAdmin: Bool
}
```

A naive approach to this would be a nested use of `.split(separator:)`, and then a little bit of extra work to convert strings into integers and booleans:

```swift
let users = input
  .split(separator: "\n")
  .compactMap { row -> User? in
    let fields = row.split(separator: ",")
    guard
      fields.count == 3,
      let id = Int(fields[0]),
      let isAdmin = Bool(String(fields[2]))
    else { return nil }

    return User(id: id, name: String(fields[1]), isAdmin: isAdmin)
  }
```

Not only is this code a little messy, but it is also inefficient since we are allocating arrays for the `.split` and then just immediately throwing away those values.

It would be more straightforward and efficient to instead describe how to consume bits from the beginning of the input and convert that into users. This is what this parser library excels at 😄.

We can start by describing what it means to parse a single row, first by parsing an integer off the front of the string, and then parsing a comma. We can do this by using the `Parse` type, which acts as an entry point into describing a list of parsers that you want to run one after the other to consume from an input:

```swift
let user = Parse {
  Int.parser()
  ","
}
```

Already this can consume the beginning of the input:

```swift
try user.parse("1,") // 1
```

Next we want to take everything up until the next comma for the user's name, and then consume the comma:

```swift
let user = Parse {
  Int.parser()
  ","
  Prefix { $0 != "," }
  ","
}
```

And then we want to take the boolean at the end of the row for the user's admin status:

```swift
let user = Parse {
  Int.parser()
  ","
  Prefix { $0 != "," }
  ","
  Bool.parser()
}
```

Currently this will parse a tuple `(Int, Substring, Bool)` from the input, and we can `.map` on that to turn it into a `User`:

```swift
let user = Parse {
  Int.parser()
  ","
  Prefix { $0 != "," }
  ","
  Bool.parser()
}
.map { User(id: $0, name: String($1), isAdmin: $2) }
```

To make the data we are parsing to more prominent, we can instead pass the transform closure as the first argument to `Parse`:

```swift
let user = Parse {
  User(id: $0, name: String($1), isAdmin: $2)
} with: {
  Int.parser()
  ","
  Prefix { $0 != "," }
  ","
  Bool.parser()
}
```

Or we can pass the `User` initializer to `Parse` in a point-free style by transforming the `Prefix` parser's output from a `Substring` to ` String` first:

```swift
let user = Parse(User.init(id:name:isAdmin:)) {
  Int.parser()
  ","
  Prefix { $0 != "," }.map(String.init)
  ","
  Bool.parser()
}
```

That is enough to parse a single user from the input string:

```swift
try user.parse("1,Blob,true")
// User(id: 1, name: "Blob", isAdmin: true)
```

To parse multiple users from the input we can use the `Many` parser to run the user parser many times:

```swift
let users = Many {
  user
} separator: {
  "\n"
}

try users.parse(input)
// [User(id: 1, name: "Blob", isAdmin: true), ...]
```

Now this parser can process an entire document of users, and the code is simpler and more straightforward than the version that uses `.split` and `.compactMap`.

Even better, it's more performant. We've written [benchmarks](Sources/swift-parsing-benchmark/ReadmeExample.swift) for these two styles of parsing, and the `.split`-style of parsing is more than twice as slow:

```
name                             time        std        iterations
------------------------------------------------------------------
README Example.Parser: Substring 3426.000 ns ±  63.40 %     385395
README Example.Ad hoc            7631.000 ns ±  47.01 %     169332
Program ended with exit code: 0
```

Further, if you are willing write your parsers against `UTF8View` instead of `Substring`, you can eke out even more performance, more than doubling the speed:

```
name                             time        std        iterations
------------------------------------------------------------------
README Example.Parser: Substring 3693.000 ns ±  81.76 %     349763
README Example.Parser: UTF8      1272.000 ns ± 128.16 %     999150
README Example.Ad hoc            8504.000 ns ±  59.59 %     151417
```

We can also compare these times to a tool that Apple's Foundation gives us: `Scanner`. It's a type that allows you to consume from the beginning of strings in order to produce values, and provides a nicer API than using `.split`:

```swift
var users: [User] = []
while scanner.currentIndex != input.endIndex {
  guard
    let id = scanner.scanInt(),
    let _ = scanner.scanString(","),
    let name = scanner.scanUpToString(","),
    let _ = scanner.scanString(","),
    let isAdmin = scanner.scanBool()
  else { break }

  users.append(User(id: id, name: name, isAdmin: isAdmin))
  _ = scanner.scanString("\n")
}
```

However, the `Scanner` style of parsing is more than 5 times as slow as the substring parser written above, and more than 15 times slower than the UTF-8 parser:

```
name                             time         std        iterations
-------------------------------------------------------------------
README Example.Parser: Substring  3481.000 ns ±  65.04 %     376525
README Example.Parser: UTF8       1207.000 ns ± 110.96 %    1000000
README Example.Ad hoc             8029.000 ns ±  44.44 %     163719
README Example.Scanner           19786.000 ns ±  35.26 %      62125
```

We can take things even further. With one small change we can turn the parser into a _printer_.

```diff
-let user = Parse(User.init(id:name:isAdmin:)) {
+let user = ParsePrint(.memberwise(User.init(id:name:isAdmin:))) {
   Int.parser()
   ","
   Prefix { $0 != "," }.map(String.init)
   ","
   Bool.parser()
 }

 let users = Many {
   user
 } separator: {
   "\n"
 }
```

With this one change we can now print an array of users back into a string:

```swift
users.print([
  User(id: 1, name: "Blob", isAdmin: true),
  User(id: 2, name: "Blob Jr.", isAdmin: false),
  User(id: 3, name: "Blob Sr.", isAdmin: true),
])
// 1,Blob,true
// 2,Blob Jr.,false
// 3,Blob Sr.,true
```

That's the basics of parsing and printing a simple string format, but there's a lot more operators and tricks to learn in order to performantly parse larger inputs. Read the [documentation][swift-parsing-docs] to dive more deeply into the concepts of parser-printers, and view the [benchmarks](Sources/swift-parsing-benchmark) for more examples of real life parsing scenarios.

## Benchmarks

This library comes with a benchmark executable that not only demonstrates the performance of the library, but also provides a wide variety of parsing examples:

* [Hex color](Sources/swift-parsing-benchmark/Color.swift)
* [Simplified CSV](Sources/swift-parsing-benchmark/CSV.swift)
* [Simplified JSON](Sources/swift-parsing-benchmark/JSON.swift)
* [ISO8601 date](Sources/swift-parsing-benchmark/Date.swift)
* [HTTP request](Sources/swift-parsing-benchmark/HTTP.swift)
* [DNS header](Sources/swift-parsing-benchmark/BinaryData.swift)
* [Arithmetic grammar](Sources/swift-parsing-benchmark/Arithmetic.swift)
* [Xcode test logs](Sources/swift-parsing-benchmark/XCTestLogs.swift)
* and more

These are the times we currently get when running the benchmarks:

```text
MacBook Pro (16-inch, 2021)
Apple M1 Pro (10 cores, 8 performance and 2 efficiency)
32 GB (LPDDR5)

name                                         time            std        iterations
----------------------------------------------------------------------------------
Arithmetic.Parser                                6542.000 ns ±   8.24 %     210834
BinaryData.Parser                                  42.000 ns ± 124.78 %    1000000
Bool.Bool.init                                     41.000 ns ±  66.19 %    1000000
Bool.Bool.parser                                   83.000 ns ±  57.55 %    1000000
Bool.Scanner.scanBool                            1166.000 ns ±  28.02 %    1000000
Color.Parser                                      167.000 ns ±  39.10 %    1000000
CSV.Parser                                    3016208.000 ns ±   1.78 %        460
CSV.Ad hoc mutating methods                    734375.000 ns ±   3.89 %       1895
Date.Parser                                      5500.000 ns ±   9.95 %     251041
Date.DateFormatter                              24000.000 ns ±   7.33 %      57526
Date.ISO8601DateFormatter                       30458.000 ns ±   5.76 %      45374
HTTP.HTTP                                        8209.000 ns ±   4.92 %     168638
JSON.Parser                                     35666.000 ns ±   4.96 %      38827
JSON.JSONSerialization                           1834.000 ns ±  98.89 %     737741
Numerics.Int.init                                  41.000 ns ±  73.75 %    1000000
Numerics.Int.parser                                83.000 ns ±  69.02 %    1000000
Numerics.Scanner.scanInt                          125.000 ns ±  40.70 %    1000000
Numerics.Digits                                    84.000 ns ±  65.02 %    1000000
Numerics.Comma separated: Int.parser         12150104.000 ns ±   1.20 %        114
Numerics.Comma separated: Scanner.scanInt    54608375.000 ns ±   0.58 %         25
Numerics.Comma separated: String.split       14168958.000 ns ±   2.61 %         98
Numerics.Double.init                               42.000 ns ± 108.03 %    1000000
Numerics.Double.parser                            125.000 ns ±  38.09 %    1000000
Numerics.Scanner.scanDouble                       167.000 ns ±  38.52 %    1000000
Numerics.Comma separated: Double.parser      17265125.000 ns ±   1.23 %         81
Numerics.Comma separated: Scanner.scanDouble 57721583.000 ns ±   0.56 %         24
Numerics.Comma separated: String.split       18073875.000 ns ±   1.60 %         77
PrefixUpTo.Parser: Substring                   165583.000 ns ±   2.86 %       8341
PrefixUpTo.Parser: UTF8                         31084.000 ns ±   4.30 %      44603
PrefixUpTo.String.range(of:)                    46750.000 ns ±   3.40 %      29615
PrefixUpTo.Scanner.scanUpToString               54208.000 ns ±   3.48 %      25599
Race.Parser                                     46625.000 ns ±   3.13 %      29774
README Example.Parser: Substring                 2417.000 ns ±  12.92 %     572308
README Example.Parser: UTF8                      1042.000 ns ±  18.72 %    1000000
README Example.Ad hoc                            2750.000 ns ±  10.04 %     507599
README Example.Scanner                          13500.000 ns ±   6.43 %     102508
String Abstractions.Substring                  455292.000 ns ±   2.04 %       3064
String Abstractions.UTF8                       208292.000 ns ±   3.19 %       6650
UUID.UUID.init                                    208.000 ns ±  35.85 %    1000000
UUID.UUID.parser                                  167.000 ns ±  46.44 %    1000000
Xcode Logs.Parser                             5200000.500 ns ±   1.46 %        268
```

## Documentation

The documentation for releases and main are available here:

* [main][swift-parsing-docs]
* [0.9.0](https://pointfreeco.github.io/swift-parsing/0.9.0/documentation/parsing)
<details>
  <summary>
  Other versions
  </summary>

  * [0.8.0](https://pointfreeco.github.io/swift-parsing/0.8.0/documentation/parsing)
  * [0.7.1](https://pointfreeco.github.io/swift-parsing/0.7.1/documentation/parsing)
  * [0.7](https://pointfreeco.github.io/swift-parsing/0.7.0/documentation/parsing)
  * [0.6](https://pointfreeco.github.io/swift-parsing/0.6.0/documentation/parsing)
  * [0.5](https://pointfreeco.github.io/swift-parsing/0.5.0/documentation/parsing)

</details>

## Other libraries

There are a few other parsing libraries in the Swift community that you might also be interested in:

* [Consumer](https://github.com/nicklockwood/Consumer)
* [Sparse](https://github.com/johnpatrickmorgan/Sparse)
* [SwiftParsec](https://github.com/davedufresne/SwiftParsec)

The printing functionality in this library is inspired by the paper ["Invertible syntax descriptions: Unifying parsing and pretty printing"](https://www.informatik.uni-marburg.de/~rendel/unparse/rendel10invertible.pdf), by Tillmann Rendel and Klaus Ostermann.

## License

This library is released under the MIT license. See [LICENSE](LICENSE) for details.

[getting-started-docs]: https://pointfreeco.github.io/swift-parsing/main/documentation/parsing/gettingstarted
[string-abstractions-docs]: https://pointfreeco.github.io/swift-parsing/main/documentation/parsing/stringabstractions
[swift-parsing-docs]: https://pointfreeco.github.io/swift-parsing
[swift-url-routing]: https://github.com/pointfreeco/swift-url-routing
