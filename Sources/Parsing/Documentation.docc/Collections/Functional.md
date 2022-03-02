# Composable Parsers

Compose parsers in a more functional way with the likes of map, zip, flatMap, etc.

## Overview

Use classic functions like map, flatMap, and more.

Below is an example of using a `CompactMap` parser for each of the color components in a hex color representation: 

```swift
struct Color {
  let red, green, blue: UInt8
}

let hexPrimary = Prefix(2)
  .compactMap { UInt8($0, radix: 16) }

let hexColor = Parse(Color.init(red:green:blue:)) {
  "#"
  hexPrimary
  hexPrimary
  hexPrimary
}
```

The parser captures a `Color(red: 255, green: 0, blue: 0)` value out of the "#FF0000" input. 

## Topics

### Functional Parsers

- ``Parsers/Map``
- ``Parsers/FlatMap``
- ``Parsers/CompactMap``
- ``Parsers/Filter``
- ``Parsers/Pipe``

### Transformation Parsers

- ``Parsers/Pullback``
- ``Parsers/ReplaceError``
