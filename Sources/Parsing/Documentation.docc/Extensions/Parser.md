# ``Parsing/Parser``

## Topics

### Diving deeper

* <doc:GettingStarted>
* <doc:Design>
* <doc:StringAbstractions>
* <doc:ErrorMessages>
* <doc:Backtracking>

### Running a parser

All of the ways to run a parser on an input.

<!-- non-inout -->
- ``parse(_:)-717qw``
<!-- Parse C's with parser of C.SubSequence  -->
- ``parse(_:)-6h1d0``
<!-- Parse String with UTF8 parser -->
- ``parse(_:)-2wzcq``
<!-- inout -->
<!--- ``parse(_:)-76tcw``-->

### Common parsers

Some of the most commonly used parsers in the library. Use these parsers with operators in order
to build complex parsers from simpler pieces.

- <doc:Bool>
- <doc:Int>
- <doc:Double>
- <doc:String>
- <doc:CharacterSet>
- <doc:UUID>
- ``Parse``
- ``OneOf``
- ``Many``
- ``Prefix``
- ``PrefixThrough``
- ``PrefixUpTo``
- ``Optionally``
- ``Always``
- ``End``
- ``Rest``
- ``Fail``
- ``FromSubstring``
- ``FromUTF8View``
- ``FromUnicodeScalarView``
- ``First``
- ``Skip``
- ``Lazy``
- ``Newline``
- ``Whitespace`` 
- ``AnyParser``
- ``Peek``
- ``Not``
- ``StartsWith``
- ``Stream``

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
