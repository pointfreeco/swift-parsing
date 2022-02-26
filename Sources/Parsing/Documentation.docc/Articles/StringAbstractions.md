#  String Abstractions

Learn how to write parsers on different levels of string abstractions, giving you the ability to 
trade performance for correctness where needed.

## Effecient consumption of strings

Nearly none of the parsers in the library work on `String`s directly, and instead operate on
_views_ into a string, such as `Substring`, `UnicodeScalarView` and `UTF8View`. Each of these
types represents a particular kind of "view" into some subset of a string, which makes consuming
elements from the beginning and end of the string very efficient. However, there are tradeoffs to 
using each type:

* `Substring`, like `String`, is a collection of `Character`s, which are extended grapheme clusters
that most closely represents a single visual character one can see on the screen. This type
is easy to use and hides a lot of the complexities of UTF8 from you (such multiple byte
sequences that represent the same visual character), but as such it is less efficient to use. Its
elements are variable width, which means scanning its elements is an O(n) operation.
  
  Test something

* `UnicodeScalarView` is a collection of unicode scalars represented by the `Unicode.Scalar` type.

