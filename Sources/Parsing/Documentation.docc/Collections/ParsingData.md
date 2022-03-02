# Capturing Data

Capture strongly-typed chunks of data from your input string. 

## Overview

Use these parsers to descibe the parts of the input you want to capture and their expected format.

For example, you have a string describing a user with an ID, name, and admin flag:

```text
1  ,Peter,isAdmin:true
```

You want to capture some parts of the string like "1", "Peter" and "true" and skip others like the whitespace after the ID and the "isAdmin:" string. 

Combine capturing parsers to sequentially describe the source format like below:

```swift
let values = Parse {
  Int.parser()
  Skip { Whitespace() }
  ","
  Prefix { $0 != "," }
  ",isAdmin:"
  Bool.parser()
}
```

To directly convert the captured values into a `User` struct with matching properties use `Parse/init(_:with:)` like so:

```swift
let user = Parse(User.init) {
  ... parsers ...
}
```

## Topics

### Capturing continuous data 

- ``Prefix``
- ``PrefixUpTo``
- ``PrefixThrough``
- ``StartsWith``
- ``Rest``

### Capturing Typed Values

You will not typically need to interact with these parsers directly. Instead use the extensions on each target type like `Bool.parser()`, `Int.parser()`, etc. which construct the desired parser.

- ``Parsers/BoolParser``
- ``Parsers/IntParser``
- ``Parsers/DoubleParser``
- ``Parsers/FloatParser``
- ``Parsers/Float80Parser``
- ``Parsers/UUIDParser``

### Consuming Whitespace

- ``Whitespace``
- ``Newline``

### Specialized String Parsers

- ``FromSubstring``
- ``FromUTF8View``
- ``FromUnicodeScalarView``
