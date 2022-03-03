# ``Parsing/Parser``

## Topics

### Diving deeper

* <doc:GettingStarted>
* <doc:Design>
* <doc:StringAbstractions>
* <doc:ErrorMessages>
* <doc:Backtracking>

### Running a parser

There are a few ways to run a given parser on an input.

<!-- inout -->
- ``parse(_:)-76tcw``
<!-- non-inout -->
- ``parse(_:)-717qw``
<!-- Parse String with UTF8 parser -->
- ``parse(_:)-2wzcq``
<!-- Parse C's with parser of C.SubSequence  -->
- ``parse(_:)-6h1d0``

### Common parsers

Some of the most commonly used parsers in the library. Use these parsers with operators in order
to build complex parsers from simpler pieces.

- <doc:Bool>
- <doc:Int>
- <doc:Double>
- <doc:String>
- <doc:CharacterSet>
- ``Parse``
- ``OneOf``
- ``Many``
- ``Prefix``
- ``PrefixThrough``
- ``PrefixUpTo``
- ``Always``
- ``End``
- ``Rest``
- ``Fail``
- ``FromSubstring``
- ``FromUTF8View``
- ``FromUnicodeScalarView``
- <doc:UUID>
- ``Skip``
- ``Lazy``
- ``Newline``
- ``Whitespace`` 
- ``AnyParser``
- ``Peek``
- ``Not``

### Parser operators

- ``map(_:)``
- ``flatMap(_:)``
- ``compactMap(_:)``
- ``filter(_:)``
- ``pipe(_:)``
- ``pullback(_:)``
- ``replaceError(with:)``
- ``eraseToAnyParser()``
- ``pipe(_:)``
