# Error messages

Learn how the library reports parsing errors and how to integrate your own custom error messages 
into parsers. 

## Overview

When a parser fails it throws an error containing information about what went wrong. The actual 
error thrown by the parsers shipped with this library is internal, and so should be considered 
opaque. To get a human-readable description of the error message you can stringify the error. For 
example, the following `UInt8` parser fails to parse a string that would cause it to overflow:

```swift
do {
  var input = "1234 Hello"[...]
  let number = try UInt8.parser().parse(&input))
} catch {
  print(error)

  // error: failed to process "UInt8"
  //  --> input:1:1-4
  // 1 | 1234 Hello
  //   | ^^^^ overflowed 255
}
```

When the ``OneOf`` parser is used and fails, there are multiple errors that can be shown. ``OneOf``
prioritizes the error messages based on which parser got the furthest along. For example, consider
a parser that can parse accounting style of numbers, i.e. plain numbers are considered positive
and numbers in parentheses are considered negative:

```swift
let accountingNumber = OneOf {
  Int.parser(isSigned: false)

  Parse {
    "("
    Int.parser(isSigned: false)
    ")"
  }
  .map { -$0 }
}

try accountingNumber.parse("100")   // 100
try accountingNumber.parse("(100)") // -100
```

If we try parsing something erroneous, such as "(100]", we get multiple error messages, but the
second parser's error shows first since it was able to get the furthest:

```swift
do {
  try accountingNumber.parse("(100]")
} catch {
  print(error))

  // error: multiple failures occurred
  // 
  // error: unexpected input
  //  --> input:1:5
  // 1 | (100]
  //   |     ^ expected ")"
  // 
  // error: unexpected input
  //  --> input:1:1
  // 1 | (100]
  //   | ^ expected integer
}
```

## Improving error messages

- [ ] `compactMap` vs `Not`
- [ ] `Many` with terminator

## Throwing your own errors

- [ ] more
