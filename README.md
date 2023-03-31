# swift-parsing

![CI](https://github.com/pointfreeco/swift-parsing/workflows/CI/badge.svg)
[![Slack](https://img.shields.io/badge/slack-chat-informational.svg?label=Slack&logo=slack)](http://pointfree.co/slack-invite)
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
* [Community](#community)
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
let user = Parse(input: Substring.self) {
  Int.parser()
  ","
}
```

Note that this parsing library is quite general, allowing one to parse _any_ kind of input into
_any_ kind of output. For this reason we sometimes need to specify the exact input type the parser
can process, in this case substrings.

Already this can consume the beginning of the input:

```swift
try user.parse("1,")  // 1
```

Next we want to take everything up until the next comma for the user's name, and then consume the comma:

```swift
let user = Parse(input: Substring.self) {
  Int.parser()
  ","
  Prefix { $0 != "," }
  ","
}
```

And then we want to take the boolean at the end of the row for the user's admin status:

```swift
let user = Parse(input: Substring.self) {
  Int.parser()
  ","
  Prefix { $0 != "," }
  ","
  Bool.parser()
}
```

Currently this will parse a tuple `(Int, Substring, Bool)` from the input, and we can `.map` on that to turn it into a `User`:

```swift
let user = Parse(input: Substring.self) {
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
let user = Parse(input: Substring.self) {
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
let user = Parse(input: Substring.self, User.init(id:name:isAdmin:)) {
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
Arithmetic.Parser                                6166.000 ns ±  10.73 %     228888
BinaryData.Parser                                 208.000 ns ±  39.64 %    1000000
Bool.Bool.init                                     41.000 ns ±  84.71 %    1000000
Bool.Bool.parser                                   42.000 ns ±  87.86 %    1000000
Bool.Scanner.scanBool                             916.000 ns ±  30.55 %    1000000
Color.Parser                                      208.000 ns ±  28.34 %    1000000
CSV.Parser                                    3675250.000 ns ±   1.16 %        380
CSV.Ad hoc mutating methods                    651333.000 ns ±   1.00 %       2143
Date.Parser                                      5833.000 ns ±   5.65 %     238924
Date.DateFormatter                              23542.000 ns ±   5.50 %      58766
Date.ISO8601DateFormatter                       29041.000 ns ±   3.31 %      48028
HTTP.HTTP                                       10250.000 ns ±   6.24 %     135657
JSON.Parser                                     38167.000 ns ±   3.26 %      36423
JSON.JSONSerialization                           1792.000 ns ±  54.14 %     753770
Numerics.Int.init                                   0.000 ns ±    inf %    1000000
Numerics.Int.parser                                83.000 ns ±  67.28 %    1000000
Numerics.Scanner.scanInt                          125.000 ns ±  38.65 %    1000000
Numerics.Digits                                    83.000 ns ±  65.03 %    1000000
Numerics.Comma separated: Int.parser         15364583.000 ns ±   0.63 %         91
Numerics.Comma separated: Scanner.scanInt    50654458.500 ns ±   0.30 %         28
Numerics.Comma separated: String.split       15452542.000 ns ±   1.30 %         90
Numerics.Double.init                               42.000 ns ± 152.57 %    1000000
Numerics.Double.parser                            166.000 ns ±  45.23 %    1000000
Numerics.Scanner.scanDouble                       167.000 ns ±  42.36 %    1000000
Numerics.Comma separated: Double.parser      18539833.000 ns ±   0.57 %         75
Numerics.Comma separated: Scanner.scanDouble 55239167.000 ns ±   0.46 %         25
Numerics.Comma separated: String.split       17636000.000 ns ±   1.34 %         78
PrefixUpTo.Parser: Substring                   182041.000 ns ±   1.78 %       7643
PrefixUpTo.Parser: UTF8                         40417.000 ns ±   2.71 %      34379
PrefixUpTo.String.range(of:)                    49792.000 ns ±   2.70 %      27891
PrefixUpTo.Scanner.scanUpToString               53959.000 ns ±   3.87 %      25745
Race.Parser                                     59583.000 ns ±   2.78 %      23333
README Example.Parser: Substring                 2834.000 ns ±  12.87 %     488264
README Example.Parser: UTF8                      1291.000 ns ±  22.65 %    1000000
README Example.Ad hoc                            2459.000 ns ±  20.61 %     561930
README Example.Scanner                          12084.000 ns ±   5.53 %     115388
String Abstractions.Substring                  472083.500 ns ±   1.38 %       2962
String Abstractions.UTF8                       196041.000 ns ±   3.38 %       7059
UUID.UUID.init                                    208.000 ns ±  43.60 %    1000000
UUID.UUID.parser                                  167.000 ns ±  42.00 %    1000000
Xcode Logs.Parser                             4511625.500 ns ±   0.58 %        226
```

## Documentation

The documentation for releases and main are available here:

* [main][swift-parsing-docs]
* [0.10.0](https://pointfreeco.github.io/swift-parsing/0.10.0/documentation/parsing)
<details>
  <summary>
  Other versions
  </summary>

 * [0.9.0](https://pointfreeco.github.io/swift-parsing/0.9.0/documentation/parsing)
  * [0.8.0](https://pointfreeco.github.io/swift-parsing/0.8.0/documentation/parsing)
  * [0.7.1](https://pointfreeco.github.io/swift-parsing/0.7.1/documentation/parsing)
  * [0.7](https://pointfreeco.github.io/swift-parsing/0.7.0/documentation/parsing)
  * [0.6](https://pointfreeco.github.io/swift-parsing/0.6.0/documentation/parsing)
  * [0.5](https://pointfreeco.github.io/swift-parsing/0.5.0/documentation/parsing)

</details>

## Community

If you want to discuss this library or have a question about how to use it to solve
a particular problem, there are a number of places you can discuss with fellow
[Point-Free](http://www.pointfree.co) enthusiasts:

* For long-form discussions, we recommend the [discussions](http://github.com/pointfreeco/swift-parsing/discussions) tab of this repo.
* For casual chat, we recommend the [Point-Free Community Slack](http://pointfree.co/slack-invite).

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
