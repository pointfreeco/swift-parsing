# Float

A parser that consumes a float from the beginning of a string.

Parses the same format parsed by `Float.init(_:)`.

```swift
var input = "123.45 Hello world"[...]
try Float.parser().parse(&input)  // 123.45
input // " Hello world"

input = "-123. Hello world"[...]
try Float.parser().parse(&input)  // -123.0
input // " Hello world"


input = "123.123E+2 Hello world"[...]
try Float.parser().parse(&input)  // 12312.3
input // " Hello world"
```

The `Float.parser()` method is overloaded to work on a variety of string representations in order
to be as efficient as possible, including `Substring`, `UTF8View`, and generally collections of 
UTF-8 code units (see <doc:StringAbstractions> for more info).

Typically Swift can choose the correct overload by using type inference based on what other parsers
you are combining `Float.parser()` with. For example, if you use `Float.parser()` with a
`Substring` parser, say the literal "," parser (see <doc:String> for more information), Swift
will choose the overload that works on substrings:

```swift
try Parse {
  Float.parser()
  ","
  Float.parser()
}
.parse("1,-2") // (1.0, -2.0)
```

On the other hand, if `Float.parser()` is used in a context where the input type cannot be inferred,
then you will get an compiler error:

```swift
let parser = Parse {
  Float.parser()
  Float.parser() // 🛑 Ambiguous use of 'parser(of:)'
}

try parser.parse(".1.2")
```

To fix this you can force one of the float parsers to be the `Substring` parser, and then the 
other will figure it out via type inference:

```swift
try Parse {
  Float.parser(of: Substring.self)
  Float.parser()
}
.parse(".1.2") // (0.1, 0.2)
```
