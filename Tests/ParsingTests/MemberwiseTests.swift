import Parsing
import XCTest

final class MemberwiseTests: XCTestCase {
  func testNonThrowingMemberwise() throws {
    struct Point {
      let x: Double
      let y: Double
    }
    
    let parser = ParsePrint(.memberwise(Point.init(x:y:))) {
      "("
      Double.parser()
      ","
      Double.parser()
      ")"
    }
    
    let result = try parser.parse("(1.5,-2.3)")
    XCTAssertEqual(result.x, 1.5)
    XCTAssertEqual(result.y, -2.3)
    
    let printed = try parser.print(Point(x: 3.0, y: 4.0))
    XCTAssertEqual(printed, "(3.0,4.0)")
  }
  
  func testThrowingMemberwise() throws {
    struct ValidatedPoint {
      let x: Double
      let y: Double
      
      init(x: Double, y: Double) throws {
        guard x.isFinite && y.isFinite else {
          throw ValidationError.invalidCoordinate
        }
        self.x = x
        self.y = y
      }
    }
    
    enum ValidationError: Error {
      case invalidCoordinate
    }
    
    let parser = ParsePrint(.memberwise(ValidatedPoint.init(x:y:))) {
      "("
      Double.parser()
      ","
      Double.parser()
      ")"
    }
    
    // Test successful parsing
    let result = try parser.parse("(1.5,-2.3)")
    XCTAssertEqual(result.x, 1.5)
    XCTAssertEqual(result.y, -2.3)
    
    // Test successful printing
    let printed = try parser.print(ValidatedPoint(x: 3.0, y: 4.0))
    XCTAssertEqual(printed, "(3.0,4.0)")
    
    // Test throwing during parsing - should propagate the ValidationError
    XCTAssertThrowsError(try parser.parse("(inf,-2.3)"))
  }
}