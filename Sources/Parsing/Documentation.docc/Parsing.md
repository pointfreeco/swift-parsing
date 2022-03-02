# ``Parsing``

A library for turning nebulous data into well-structured data, with a focus on composition,
performance, generality, and ergonomics.

## Resources

- [GitHub Repo](https://github.com/pointfreeco/swift-parsing/)
- [Discussions](https://github.com/pointfreeco/swift-parsing/discussions)
- [Point-Free Videos](https://www.pointfree.co/collections/parsing)

## Overview

Combine many small parsers that describe how to incrementally consume an input string and capture the bits that you are interested in as strongly-typed Swift data. 

Start parsing with <doc:GettingStarted> which offers a detailed kickstarer with the library.

## Basics 

``Parsing`` doesn't assume any specific input format — you freely describe the structure and which bits you want to capture.

For example, suppose you
have a string that holds some user data that you want to parse into an array of `User`s:

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

Construct a parser capturing the sequence of an `Int`, comma, `String`, comma, and a `Bool` into the `User` structure and wrap it in a `Many` to parse the complete list:

```swift
let user = Parse(User.init) {
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
} terminator: {
  End()
}

try users.parse(input)  // [User(id: 1, name: "Blob", isAdmin: true), ...]
```

## Topics

### Parsing

Combine a mix of data and logic parsers to describe the source data format and parse it into useful data structures.

* <doc:GettingStarted>
* <doc:ParsingData>
* <doc:ParsingLogic>
* <doc:Functional>
* ``Parser``

### Diving Deeper

Learn about the library design and deeper topics like error handling and optimization.  

* <doc:Design>
* <doc:StringAbstractions>
* <doc:ErrorMessages>
* <doc:Backtracking>

### Further Parsers

* ``Parsers``

## See Also

The collecton of videos from Point-Free that dive deep into the development of the Parsing library.

* [Parsing Point-Free Videos](https://www.pointfree.co/collections/parsing)
