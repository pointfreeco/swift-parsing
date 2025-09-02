//
//  MapValues.swift
//  OpenFestival
//
//  Created by Woodrow Melling on 10/31/24.
//



extension Conversions {
  public struct MapValues<C: Conversion>: Conversion {
    var transform: C
    
    public init(_ transform: C) {
      self.transform = transform
    }
    
    public init(@ConversionBuilder _ build: () -> C) {
      self.transform = build()
    }
    
    public func apply(_ input: [C.Input]) throws -> [C.Output] {
      try input.map(transform.apply)
    }
    
    public func unapply(_ output: [C.Output]) throws -> [C.Input] {
      try output.map(transform.unapply)
    }
  }
  
}



extension Conversions {
  public struct MapKVPairs<KeyConversion: Conversion, ValueConversion: Conversion>: Conversion
  where KeyConversion.Input: Hashable & Sendable,
        KeyConversion.Output: Hashable & Sendable,
        ValueConversion.Input: Sendable,
        ValueConversion.Output: Sendable
  {
    public typealias Input = [KeyConversion.Input: ValueConversion.Input]
    public typealias Output = [KeyConversion.Output: ValueConversion.Output]
    
    var keyConversion: KeyConversion
    var valueConversion: ValueConversion
    
    public init(keyConversion: KeyConversion, valueConversion: ValueConversion) {
      self.keyConversion = keyConversion
      self.valueConversion = valueConversion
    }
    
    public func apply(_ input: Input) throws -> Output {
      try input.mapKVPairs(
        keyConversion.apply,
        valueConversion.apply
      )
    }
    
    public func unapply(_ output: Output) throws -> Input {
      try output.mapKVPairs(
        keyConversion.unapply,
        valueConversion.unapply
      )
    }
  }
}

extension Dictionary {
  func mapKVPairs<NewKey, NewValue>(
    _ keyTransform:  @escaping (Key) throws -> NewKey,
    _ valueTransform: @escaping (Value) throws -> NewValue
  ) rethrows -> [NewKey: NewValue] {
    return try Dictionary<NewKey, NewValue>(uniqueKeysWithValues: self.map {
      return try (keyTransform($0.0), valueTransform($0.1))
    })
  }
}

extension Sequence {
  /// - Parameters:
  ///   - closure: Transformation to apply to each element
  /// - Returns: Array of transformed elements in original order
  public func concurrentMap<T: Sendable>(
    _ transform: @escaping @Sendable (Element) async throws -> T
  ) async rethrows -> [T] where Element: Sendable {
    return try await withThrowingTaskGroup(of: (value: T, offset: Int).self) { group in
      for (id, element) in self.enumerated() {
        group.addTask {
          try await (value: transform(element), offset: id)
        }
      }
      
      var array: [(value: T, offset: Int)] = []
      array.reserveCapacity(self.underestimatedCount)
      for try await result in group {
        array.append(result)
      }
      
      // Could this sort be avoided somehow? Maybe with an OrderedDictionary?
      return array.sorted { lhs, rhs in
        lhs.offset < rhs.offset
      }
      .map(\.value)
    }
  }
  
}
