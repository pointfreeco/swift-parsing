# Double

A parser that consumes a double from the beginning of a string.

Parses the same format parsed by `Double.init(_:)`.

```swift
var input = "123.45 Hello world"[...]
try Double.parser().parse(&input)  // 123.45
input // " Hello world"

input = "-123. Hello world"[...]
try Double.parser().parse(&input)  // -123.0
input // " Hello world"


input = "123.123E+2 Hello world"[...]
try Double.parser().parse(&input)  // 12312.3
input // " Hello world"
```

The `Double.parser()` method is overloaded to work on a variety of string representations in order
to be as efficient as possible, including `Substring`, `UTF8View`, and generally collections of 
UTF-8 code units (see <doc:StringAbstractions> for more info).

Typically Swift can choose the correct overload by using type inference based on what other parsers
you are combining `Double.parser()` with. For example, if you use `Double.parser()` with a
`Substring` parser, say the literal "," parser (see <doc:String> for more information), Swift
will choose the overload that works on substrings:

```swift
try Parse {
  Double.parser()
  ","
  Double.parser()
}
.parse("1,-2") // (1.0, -2.0)
```

On the other hand, if `Double.parser()` is used in a context where the input type cannot be inferred,
then you will get an compiler error:

```swift
try Parse {
  Double.parser()
  Double.parser() // 🛑 Ambiguous use of 'parser(of:)'
}
.parse("truefalse")
```

To fix this you can force one of the double parsers to be the `Substring` parser, and then the 
other will figure it out via type inference:

```swift
try Parse {
  Double.parser(of: Substring.self)
  Double.parser()
}
.parse("truefalse") // (true, false)
```
