import Foundation

/// A collection that supports empty initialization and the ability to prepend a sequence of
/// elements of elements to itself.
///
/// `PrependableCollection` is a specialized subset of `RangeReplaceableCollection` that is tuned to
/// incremental printing.
///
/// In fact, any `RangeReplaceableCollection` can get a conformance for free:
///
/// ```swift
/// extension MyRangeReplaceableCollection: PrependableCollection {}
/// ```
///
/// Because it is also less strict than `RangeReplaceableCollection`, it is an appropriate protocol
/// to conform to for types that cannot and should not conform to `RangeReplaceableCollection`
/// directly.
///
/// For example, `Substring.UTF8View` is a common input for string parsers to parse from, but it
/// does not conform to `RangeReplaceableCollection`. It does, however, conform to
/// `PrependableCollection` by validating and prepending the given UTF-8 bytes to its underlying
/// substring. So in order to write a parser against generic sequences of UTF-8 bytes, you would
/// constrain its input against `PrependableCollection`.
///
/// For example the following `Digits` parser is generic over an `Collection` of bytes, and its
/// printer conformance further constraints its input to be prependable.
///
/// ```swift
/// struct Digits<Input: Collection>: Parser
/// where
///   Input.Element == UTF8.CodeUnit,  // Required for working with a collection of bytes (`UInt8`)
///   Input.SubSequence == Input       // Required for the parser to consume from input
/// {
///   func parse(_ input: inout Input) throws -> Int {
///     // Collect all bytes between ASCII "0" and "9"
///     let prefix = input.prefix(while: { $0 >= .init(ascii: "0") && $0 <= .init(ascii: "9") })
///
///     // Attempt to convert to an `Int`
///     guard let int = Int(prefix) else {
///       struct ParseError: Error {}
///       throw ParseError()
///     }
///
///     // Incrementally consume bytes from input
///     input.removeFirst(prefix.count)
///
///     return int
///   }
/// }
///
/// extension Digits: ParserPrinter where Input: PrependableCollection {
///   func print(_ output: Int, into input: inout Input) {
///     // Convert `Int` to string's underlying bytes
///     let bytes = String(output).utf8
///
///     // Prepend bytes using `PrependableCollection` conformance.
///     input.prepend(contentsOf: bytes)
///   }
/// }
/// ```
///
/// The `Digits` parser-printer now works on any collection of UTF-8 code units, including
/// `UTF8View` and `ArraySlice<UInt8>`:
///
/// ```swift
/// var input = "123"[...].utf8
/// try Digits().parse(&input) // 123
/// try Digits().print(123, into: &input)
/// Substring(input) // "123"
/// ```
///
/// ```swift
/// var input = ArraySlice("123"[...].utf8)
/// try Digits().parse(&input) // 123
/// try Digits().print(123, into: &input)
/// Substring(decoding: input, as: UTF8.self) // "123"
/// ```
public protocol PrependableCollection<Element>: Collection, _EmptyInitializable {
  /// Inserts the elements of a sequence or collection to the beginning of this collection.
  ///
  /// The collection being prepended to allocates any additional necessary storage to hold the new
  /// elements.
  ///
  /// - Parameter newElements: The elements to append to the collection.
  mutating func prepend<S: Sequence>(contentsOf newElements: S) where S.Element == Element
}

extension PrependableCollection {
  /// Creates a new instance of a collection containing the elements of a sequence.
  ///
  /// - Parameter elements: The sequence of elements for the new collection. `elements` must be
  ///   finite.
  @inlinable
  public init<S: Collection>(_ elements: S) where S.Element == Element {
    var collection = Self()
    collection.prepend(contentsOf: elements)
    self = collection
  }

  /// Adds an element to the beginning of the collection.
  ///
  /// - Parameter newElement: The element to prepend to the collection.
  @inlinable
  public mutating func prepend(_ newElement: Element) {
    self.prepend(contentsOf: CollectionOfOne(newElement))
  }
}

extension RangeReplaceableCollection {
  @inlinable
  public mutating func prepend<S: Sequence>(contentsOf newElements: S)
  where S.Element == Element {
    var newSelf = Self()
    newSelf.append(contentsOf: newElements)
    newSelf.append(contentsOf: self)
    self = newSelf
  }
}

extension Array: PrependableCollection {}
extension ArraySlice: PrependableCollection {}
extension ContiguousArray: PrependableCollection {}
extension Data: PrependableCollection {}
extension Slice: PrependableCollection, _EmptyInitializable
where Base: RangeReplaceableCollection {}
extension String: PrependableCollection {}
extension String.UnicodeScalarView: PrependableCollection {}
extension Substring: PrependableCollection {}
extension Substring.UnicodeScalarView: PrependableCollection {}

extension String.UTF8View: PrependableCollection {
  @inlinable
  public init() {
    self = "".utf8
  }

  @inlinable
  public mutating func prepend<S: Sequence>(contentsOf elements: S)
  where S.Element == Element {
    var str = String(self)
    defer { self = str.utf8 }

    switch elements {
    case let elements as String.UTF8View:
      str.prepend(contentsOf: String(elements))
    case let elements as Substring.UTF8View:
      str.prepend(contentsOf: Substring(elements))
    default:
      str.prepend(contentsOf: Substring(decoding: Array(elements), as: UTF8.self))
    }
  }
}

extension Substring.UTF8View: PrependableCollection {
  @inlinable
  public init() {
    self = ""[...].utf8
  }

  @inlinable
  public mutating func prepend<S: Sequence>(contentsOf elements: S)
  where S.Element == Element {
    var str = Substring(self)
    defer { self = str.utf8 }

    switch elements {
    case let elements as String.UTF8View:
      str.prepend(contentsOf: String(elements))
    case let elements as Substring.UTF8View:
      str.prepend(contentsOf: Substring(elements))
    default:
      str.prepend(contentsOf: Substring(decoding: Array(elements), as: UTF8.self))
    }
  }
}
