# swift-parsing

![CI](https://github.com/pointfreeco/swift-parsing/workflows/CI/badge.svg)

A library for turning nebulous data into well-structured data, with a focus on composition, performance, and generality:

* **Composition**: Ability to break large, complex parsing problems down into smaller, simpler ones. And the ability to take small, simple parsers and easily combine them into larger, more complex ones.

* **Performance**: Parsers that have been composed of many smaller parts should perform as well as highly-tuned, hand-written parsers.

* **Generality**: Ability to parse _any_ kind of input into _any_ kind of output. This allows you to choose which abstraction levels you want to work on based on how much performance you need or how much correctness you want guaranteed. For example, you can write a highly tuned parser on collections of UTF-8 code units, and it will automatically plug into parsers of strings, arrays, unsafe buffer pointers and more.

[Motivation](#motivation)<br>
[Getting started](#getting-started)<br>
[Design](#design)<br>
[Benchmarks](#benchmarks)<br>
[Documentation](#documentation)<br>
[Other libraries](#other-libraries)<br>
[License](#license)<br>

## Learn More

This library was designed over the course of many [episodes](https://www.pointfree.co/collections/parsing) on [Point-Free](https://www.pointfree.co), a video series exploring functional programming and the Swift language, hosted by [Brandon Williams](https://twitter.com/mbrandonw) and [Stephen Celis](https://twitter.com/stephencelis). You can watch all of the episodes [here](https://www.pointfree.co/collections/parsing).

<a href="https://www.pointfree.co/collections/parsing">
  <img alt="video poster image" src="https://i.vimeocdn.com/video/1000228065.jpg" width="600">
</a>

## Motivation

Parsing is a surprisingly ubiquitous problem in programming. We can define parsing as trying to take a more nebulous blob of data and transform it into something more well-structured. The Swift standard library comes with a number of parsers that we reach for every day. For example, there are initializers on `Int`, `Double`, and even `Bool`, that attempt to parse numbers and booleans from strings:

```swift
Int("42")         // 42
Int("Hello")      // nil

Double("123.45")  // 123.45
Double("Goodbye") // nil

Bool("true")      // true
Bool("0")         // nil
```

And there are types like `JSONDecoder` and `PropertyListDecoder` that attempt to parse `Decodable`-conforming types from data:

```swift
try JSONDecoder().decode(User.self, from: data)
try PropertyListDecoder().decode(Settings.self, from: data)
```

While parsers are everywhere in Swift, Swift has no holistic story _for_ parsing. Instead, we typically parse data in an ad hoc fashion using a number of unrelated initializers, methods, and other means. And this typically leads to less maintainable, less reusable code.

This library aims to write such a story for parsing in Swift. It introduces a single unit of parsing that can be combined in interesting ways to form large, complex parsers that can tackle the programming problems you need to solve in a maintainable way.

## Getting started

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

We can start by describing what it means to parse a single row, first by parsing an integer off the front of the string, and then parsing a comma that we discard using the `.skip` operator:

```swift
let user = Int.parser()
  .skip(StartsWith(","))
```

Already this can consume the beginning of the input:

```swift
user.parse(&input) // => 1
input // => "Blob,true\n2,Blob Jr.,false\n3,Blob Sr.,true"
```

Next we want to take everything up until the next comma for the user's name, and then skip the comma:

```swift
let user = Int.parser()
  .skip(StartsWith(","))
  .take(Prefix { $0 != "," })
  .skip(StartsWith(","))
```

Here the `.take` operator has combined parsed values together into a tuple, `(Int, Substring)`.

And then we want to take the boolean at the end of the row for the user's admin status:

```swift
let user = Int.parser()
  .skip(StartsWith(","))
  .take(Prefix { $0 != "," })
  .skip(StartsWith(","))
  .take(Bool.parser())
```

Currently this will parse a tuple `(Int, Substring, Bool)` from the input, and we can `.map` on that to turn it into a `User`:

```swift
let user = Int.parser()
  .skip(StartsWith(","))
  .take(Prefix { $0 != "," })
  .skip(StartsWith(","))
  .take(Bool.parser())
  .map { User(id: $0, name: String($1), isAdmin: $2) }
```

That is enough to parse a single user from the input string:

```swift
user.parse(&input) // => User(id: 1, name: "Blob", isAdmin: true)
input // => "\n2,Blob Jr.,false\n3,Blob Sr.,true"
```

To parse multiple users from the input we can use the `Many` parser:

```swift
let users = Many(user, separator: StartsWith("\n"))

user.parse(&input) // => [User(id: 1, name: "Blob", isAdmin: true), ...]
input // => ""
```

Now this parser can process an entire document of users, and the code is simpler and more straightforward than the version that uses `.split` and `.compactMap`.

Even better, it's more performant. We've written [benchmarks](Sources/swift-parsing-benchmark/ReadmeExample.swift) for these two styles of parsing, and the `.split`-style of parsing is more than twice as slow:

```
name                             time        std        iterations
------------------------------------------------------------------
README Example.Parser: Substring 3426.000 ns ±  63.40 %     385395
README Example.Adhoc             7631.000 ns ±  47.01 %     169332
Program ended with exit code: 0
```

Further, if you are willing write your parsers against `UTF8View` instead of `Substring`, you can eke out even more performance, more than doubling the speed:

```
name                             time        std        iterations
------------------------------------------------------------------
README Example.Parser: Substring 3693.000 ns ±  81.76 %     349763
README Example.Parser: UTF8      1272.000 ns ± 128.16 %     999150
README Example.Adhoc             8504.000 ns ±  59.59 %     151417
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
README Example.Adhoc              8029.000 ns ±  44.44 %     163719
README Example.Scanner           19786.000 ns ±  35.26 %      62125
```

That's the basics of parsing a simple string format, but there's a lot more operators and tricks to learn in order to performantly parse larger inputs. View the [benchmarks](Sources/swift-parsing-benchmark) for examples of real life parsing scenarios.

## Design

### Protocol

The design of the library is largely inspired by the Swift standard library and Apple’s Combine framework. A parser is represented as a protocol that many types conform to, and then parser transformations (also known as “combinators”) are methods that return concrete types conforming to the parser protocol.

For example, to parse all the characters from the beginning of a substring until you encounter a comma you can use the `Prefix` parser:

```swift
let parser = Prefix<Substring> { $0 != "," }

var input = "Hello,World"[...]
parser.parse(&input) // => "Hello"
input // => ",Hello"
```

The type of this parser is:

```swift
Prefix<Substring>
```

We can `.map` on this parser in order to transform its output, which in this case is the string "Hello":

```swift
let parser = Prefix<Substring> { $0 != "," }
  .map { $0 + "!!!" }

var input = "Hello,World"[...]
parser.parse(&input) // => "Hello!!!"
input // => ",Hello"
```

The type of this parser is now:

```swift
Parsers.Map<Prefix<Substring>, Substring>
```

Notice how the type of the parser encodes the operations that we performed. This adds a bit of complexity when using these types, but comes with some performance benefits because Swift can usually optimize the creation of those nested types.

### Low-level versus high-level

The library makes it easy to choose which abstraction level you want to work on. Both low-level and high-level have their pros and cons.

Parsing low-level inputs, such as UTF-8 code units, has better performance, but at the cost of potentially losing correctness. The most canonical example of this is trying to parse the character "é", which can be represented in code units as `[233]` or `[101, 769]`. If you don't remember to always parse both representations you may have a bug where you accidentally fail your parser when it encounters a code unit sequence you don't support.

On the other hand, parsing high-level inputs, such as `String`, can guarantee correctness, but at the cost of performance. For example, `String` handles the complexities of extended grapheme clusters and UTF-8 normalization for you, but traversing strings is slower since its elements are variable width.

The library gives you the tools that allow you to choose which abstraction level you want to work on, as well as the ability to fluidly move between abstraction levels where it makes sense.

For example, say we want to parse particular city names from the beginning of a string:

```swift
enum City {
  case london
  case newYork
  case sanJose
}
```

Because "San José" has an accented character, the safest way to parse it is to parse on the `Substring` abstraction level:

```swift
let city = StartsWith<Substring>("London").map { City.london }
  .orElse(StartsWith("New York").map { .newYork })
  .orElse(StartsWith("San José").map { .sanJose })

var input = "San José,123"
city.parse(&input) // => City.sanJose
input // => ",123"
```

However, we are incurring the cost of parsing `Substring` for this entire parser, even though only the "San José" case needs that power. We can refactor this parser so that "London" and "New York" are parsed on the `UTF8View` level, since they consist of only ASCII characters, and then parse "San José" as `Substring`:

```swift
let city = StartsWith("London".utf8).map { City.london }
  .orElse(StartsWith("New York".utf8).map { .newYork })
  .orElse(StartsWith("San José").utf8.map { .sanJose })
```

It's subtle, but `StartsWith("London".utf8)` is a parser that parses the code units for "London" from the beginning of a `UTF8View`, whereas `StartsWith("San José").utf8` parses "San José" as a `Substring`, and then converts that into a `UTF8View` parser.

This allows you to parse as much as possible on the more performant, low-level `UTF8View`, while still allowing you to parse on the more correct, high-level `Substring` when necessary.

## Benchmarks

This library comes with a benchmark executable that not only demonstrates the performance of the library, but also provides a wide variety of parsing examples:

* [URL router](Sources/swift-parsing-benchmark/Routing.swift)
* [Xcode test logs](Sources/swift-parsing-benchmark/XcodeLogs)
* [Simplfied CSV](Sources/swift-parsing-benchmark/CSV)
* [Hex color](Sources/swift-parsing-benchmark/Color.swift)
* [ISO8601 date](Sources/swift-parsing-benchmark/Date.swift)
* [HTTP request](Sources/swift-parsing-benchmark/HTTP.swift)
* [Simplified JSON](Sources/swift-parsing-benchmark/JSON.swift)
* [Arithmetic grammar](Sources/swift-parsing-benchmark/Arithmetic.swift)
* and more

These are the times we currently get when running the benchmarks:

```text
MacBook Pro (16-inch, 2019)
2.4 GHz 8-Core Intel Core i9
64 GB 2667 MHz DDR4

name                                         time             std        iterations
-----------------------------------------------------------------------------------
Arithmetic.Parser                                13291.000 ns ±  47.42 %      92380
BinaryData.Parser                                  541.000 ns ± 201.34 %    1000000
Bool.Bool.init                                      29.000 ns ± 618.75 %    1000000
Bool.BoolParser                                     45.000 ns ± 697.67 %    1000000
Bool.Scanner.scanBool                              866.000 ns ± 152.94 %    1000000
Color.Parser                                       130.000 ns ± 362.56 %    1000000
CSV.Parser                                     1370783.000 ns ±  11.26 %        987
CSV.Ad hoc mutating methods                    1380702.000 ns ±  12.58 %        991
Date.Parser                                      13026.000 ns ±  50.38 %      98904
Date.DateFormatter                               42814.000 ns ±  41.11 %      30427
Date.ISO8601DateFormatter                        57900.000 ns ±  37.00 %      21041
HTTP.HTTP                                         4031.000 ns ±  83.99 %     314128
JSON.Parser                                       6088.000 ns ±  65.76 %     210078
JSON.JSONSerialization                            3361.000 ns ±  84.90 %     376928
Numerics.Int.init                                   40.000 ns ± 639.27 %    1000000
Numerics.Int.parser                                 42.000 ns ± 716.38 %    1000000
Numerics.Scanner.scanInt                           146.000 ns ± 378.76 %    1000000
Numerics.Comma separated: Int.parser           5390299.000 ns ±   5.52 %        253
Numerics.Comma separated: Scanner.scanInt     86885256.500 ns ±   5.40 %         16
Numerics.Comma separated: String.split       120884645.000 ns ±   2.18 %         11
Numerics.Double.init                                62.000 ns ± 615.58 %    1000000
Numerics.Double.parser                              92.000 ns ± 249.73 %    1000000
Numerics.Scanner.scanDouble                        204.000 ns ± 301.13 %    1000000
Numerics.Comma separated: Double.parser        8743220.000 ns ±   6.54 %        138
Numerics.Comma separated: Scanner.scanDouble  90561940.000 ns ±   1.49 %         16
Numerics.Comma separated: String.split        36217863.000 ns ±   4.66 %         39
PrefixUpTo.Parser                                22917.000 ns ±  39.36 %      53264
PrefixUpTo.Scanner.scanUpToString               166872.000 ns ±  23.59 %       7710
Race.Parser                                      31445.000 ns ±  38.86 %      40463
README Example.Parser: Substring                  3553.000 ns ±  80.09 %     337107
README Example.Parser: UTF8                       1291.000 ns ± 124.36 %     912187
README Example.Adhoc                              7952.000 ns ±  60.09 %     161835
Routing.Parser                                    5362.000 ns ±  65.88 %     241853
String Abstractions.Substring                  1102496.000 ns ±  11.32 %       1227
String Abstractions.UTF8                        144420.000 ns ±  22.45 %       8905
Xcode Logs.Parser                              7369318.000 ns ±   5.83 %        190
```

## Documentation

The latest documentation for swift-parsing is available [here](https://pointfreeco.github.io/swift-parsing/).

## Other libraries

There are a few other parsing libraries in the Swift community that you might also be interested in:

* [Sparse](https://github.com/johnpatrickmorgan/Sparse)
* [SwiftParsec](https://github.com/davedufresne/SwiftParsec)

## License

This library is released under the MIT license. See [LICENSE](LICENSE) for details.
