import XCTest

import Foundation
import Parsing

nonisolated final class SendableTests: XCTestCase {
  
  func testGlobalParser() throws {
    var test: Substring = "this,is,a,word,list"
    let expected: [Substring] = ["this", "is", "a", "word", "list"]
    
    let result = try GlobalParsers.wordParser.parse(&test)
    XCTAssertEqual(result, expected)
  }
  
}

enum GlobalParsers {
  
  static let wordParser: some Parser<Substring, [Substring]> & Sendable = Parse {
    Many {
      CharacterSet.letters
    } separator: {
      ","
    }
  }
  
}
 
