import XCTest

import Foundation
import Parsing

nonisolated final class SendableTests: XCTestCase {
  
  func testGlobalParser() throws {
    var test: Substring = "this,is,a,word,list"
    let expected: [Substring] = ["this", "is", "a", "word", "list"]
    
    let result: [Substring] = try GlobalParsers.wordParser.parse(&test)
    XCTAssertEqual(result, expected)
  }

  func testGlobalParserWithTransformClosure() throws {
    var test: Substring = "67"
    let expected: Int = 134

    let result: Int = try GlobalParsers.mapParser.parse(&test)
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
  
  static let mapParser: some Parser<Substring, Int> & Sendable = Parse {
    let ns = NotSendable()
    Int.parser()
      .map { n in
        // let capture = ns // Should be a warning in Swift 6, not an error
        return n * 2
      }
  }
  
}

class NotSendable { }

@available(*, unavailable)
extension NotSendable: Sendable { }
 
