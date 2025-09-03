import XCTest

import Foundation
import Parsing

final class SendableTests: XCTestCase {

}

enum GlobalParsers {
  
  static let wordParser: some Parser<Substring, [Substring]> = Parse {
    Many {
      CharacterSet.letters
    } separator: {
      ","
    }
  }
  
}
 
