# Int

A parser that consumes an integer (with an optional leading `+` or `-` sign) from the beginning of 
a string.

```swift
var input = "123 Hello world"[...]
try Int.parser().parse(&input) // 123
input // " Hello world")

input = "-123 Hello world"
try Int.parser().parse(&input) // -123
input // " Hello world")
```

This parser fails when it does not find an integer at the beginning of the collection:

```swift
var input = "+Hello"[...]
let number = try Int.parser().parse(&input)
// error: unexpected input
//  --> input:1:2
// 1 | +Hello
//   |  ^ expected integer
```

And it fails when the digits extracted from the beginning of the collection would cause the
integer type to overflow:

```swift
var input = "9999999999999999999 Hello"[...]
let number = try Int.parser().parse(&input)
// error: failed to process "Int"
//  --> input:1:1-19
// 1 | 9999999999999999999 Hello
//   | ^^^^^^^^^^^^^^^^^^^ overflowed 9223372036854775807
```

The `Int.parser()` method is overloaded to work on a variety of string representations in order
to be as efficient as possible, including `Substring`, `UTF8View`, and generally collections of 
UTF-8 code units (see <doc:StringAbstractions> for more info).

Typically Swift can choose the correct overload by using type inference based on what other parsers
you are combining `Int.parser()` with. For example, if you use `Int.parser()` with a
`Substring` parser, say the literal "," parser (see <doc:String> for more information), Swift
will choose the overload that works on substrings:

```swift
try Parse {
  Int.parser()
  ","
  Int.parser()
}
.parse("true,false") // (true, false)
```

On the other hand, if `Int.parser()` is used in a context where the input type cannot be inferred,
then you will get an compiler error:

```swift
try Parse {
  Int.parser()
  Int.parser() // 🛑 Ambiguous use of 'parser(of:)'
}
.parse("truefalse")
```

To fix this you can force one of the integer parsers to be the `Substring` parser, and then the 
other will figure it out via type inference:

```swift
try Parse {
  Int.parser(of: Substring.self)
  Int.parser()
}
.parse("truefalse") // (true, false)
```
