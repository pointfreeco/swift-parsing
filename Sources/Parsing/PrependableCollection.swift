import Foundation

/// A collection that supports empty initialization and the ability to append itself with a sequence
/// of elements.
///
/// A partial conformance of `RangeReplaceableCollection`, and any `RangeReplaceableCollection` can
/// get a conformance for free:
///
/// ```swift
/// extension MyRangeReplaceableCollection: PrependableCollection {}
/// ```
///
/// `PrependableCollection` is a useful constraint for the input of a parser-printer's ``Printer``
/// conformance, where `RangeReplaceableCollection` would be too strict.
///
/// For example, `Substring.UTF8View` is a common input for string parsers to parse from, but it
/// does not conform to `RangeReplaceableCollection`. It does, however, conform to
/// `PrependableCollection` by validating and appending the given UTF-8 bytes to its underlying
/// substring. So in order to write a parser against generic sequences of UTF-8 bytes, you would
/// constrain its input against `PrependableCollection`.
///
/// For example the following `Digits` parser is generic over an `Collection` of bytes, and its
/// printer conformance further constraints its input to be appendable.
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
/// extension Digits: Printer where Input: PrependableCollection {
///   func print(_ output: Int, into input: inout Input) {
  ///   // Convert `Int` to string's underlying bytes
///     let bytes = String(output).utf8
///
///     // Append bytes using `PrependableCollection` conformance.
///     input.append(contentsOf: bytes)
///   }
/// }
/// ```
public protocol PrependableCollection: Collection, EmptyInitializable {
  /// Adds the elements of a sequence or collection to the end of this collection.
  ///
  /// The collection being appended to allocates any additional necessary storage to hold the new
  /// elements.
  ///
  /// - Parameter newElements: The elements to append to the collection.
  mutating func prepend<S: Collection>(contentsOf newElements: S) where S.Element == Element
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

  /// Adds an element to the end of the collection.
  ///
  /// - Parameter newElement: The element to append to the collection.
  @inlinable
  public mutating func prepend(_ newElement: Element) {
    self.prepend(contentsOf: CollectionOfOne(newElement))
  }
}

extension Array: PrependableCollection {
  public mutating func prepend<S>(contentsOf newElements: S) where S : Collection, Element == S.Element {
    insert(contentsOf: newElements, at: startIndex)
  }
}

extension ArraySlice: PrependableCollection {
  public mutating func prepend<S>(contentsOf newElements: S) where S : Collection, Element == S.Element {
    insert(contentsOf: newElements, at: startIndex)
  }
}

extension ContiguousArray: PrependableCollection {
  public mutating func prepend<S>(contentsOf newElements: S) where S : Collection, Element == S.Element {
    insert(contentsOf: newElements, at: startIndex)
  }
}

extension Data: PrependableCollection {
  public mutating func prepend<S>(contentsOf newElements: S) where S : Collection, UInt8 == S.Element {
    insert(contentsOf: newElements, at: startIndex)
  }
}

extension Slice: PrependableCollection, EmptyInitializable where Base: RangeReplaceableCollection {
  public mutating func prepend<S>(contentsOf newElements: S) where S : Collection, Base.Element == S.Element {
    insert(contentsOf: newElements, at: startIndex    )
  }
}

extension String: PrependableCollection {
  public mutating func prepend<S>(contentsOf newElements: S) where S : Collection, Character == S.Element {
    insert(contentsOf: newElements, at: startIndex)
  }
}
  
extension String.UnicodeScalarView: PrependableCollection {
  public mutating func prepend<S>(contentsOf newElements: S) where S : Collection, Unicode.Scalar == S.Element {
    insert(contentsOf: newElements, at: startIndex  )
  }
}
extension Substring: PrependableCollection {
  public mutating func prepend<S>(contentsOf newElements: S) where S : Collection, Character == S.Element {
    insert(contentsOf: newElements, at: startIndex)
  }
}
  
extension Substring.UnicodeScalarView: PrependableCollection {
  public mutating func prepend<S>(contentsOf newElements: S) where S : Collection, String.UnicodeScalarView.Element == S.Element {
    insert(contentsOf: newElements, at: startIndex)
  }
}

extension Substring.UTF8View: PrependableCollection {
  @inlinable
  public init() {
    self = ""[...].utf8
  }

  @inlinable
  public mutating func prepend<S>(contentsOf elements: S) where S : Collection, String.UTF8View.Element == S.Element {
    var str = Substring(self)
    defer { self = str.utf8 }

    switch elements {
    case let elements as Substring.UTF8View:
      str.prepend(contentsOf: Substring(elements))
    default:
      str.prepend(contentsOf: Substring(decoding: Array(elements), as: UTF8.self))
    }
  }
}
