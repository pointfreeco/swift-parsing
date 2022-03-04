# CharacterSet

A parser that consumes the characters contained in a `CharacterSet` from the beginning of a string.

For example:

```swift
try Parse {
  CharacterSet.alphanumerics
  CharacterSet.punctuationCharacters
  CharacterSet.alphanumerics
}
.parse("Hello...World") // ("Hello", "...", "World")
```
