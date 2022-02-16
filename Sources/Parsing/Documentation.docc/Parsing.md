# ``Parsing``

A library for turning nebulous data into well-structured data, with a focus on composition, performance, generality, and ergonomics.

## Overview

Parsing with this library is performed by listing out many small parsers that describe how to incremental consume small bits from the beginning of an input string. For example, suppose you have a string that holds some user data that you want to parse into an array of `User`s:

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

A parser can be constructed for transforming the input string into an array of users in succinct and fluent API:

```swift
let user = Parse(User.init(id:name:isAdmin:)) {
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

try users.parse(&input)  // [User(id: 1, name: "Blob", isAdmin: true), ...]
input                    // ""
```

This says that to parser a user we consume an integer from the beginning of the input, then a comma, then everything up to the next comma, then another comma, and finally a boolean. And to parse an entire array of users we run the `user` parser many times and between each invocation we run the separator parser, which consumes a newline.

Further, if the input is malformed, like say we mistyped one of the booleans, then the parser emits an error that describes exactly what went wrong:

```swift
var input = """
1,Blob,true
2,Blob Jr.,false
3,Blob Sr.,tru
"""[...]

try users.parse(&input)

// error: unexpected input
//  --> input:3:11
// 3 | 3,Blob Jr,tru
//   |           ^ expected "true" or "false"
```

That's the basics of parsing a simple string format, but there's a lot more operators and tricks to learn in order to performantly parse larger inputs.

#### Additional Resources

- [GitHub Repo](https://github.com/pointfreeco/swift-parsing/)
- [Discussions](https://github.com/pointfreeco/swift-parsing/discussions)
- [Point-Free Videos](https://www.pointfree.co/collections/parsing)

## Topics

### Essentials

* <doc:GettingStarted>
* <doc:Design>

### Advanced

* <doc:StringAbstractions>
* <doc:ErrorMessages>
* <doc:Backtracking>
