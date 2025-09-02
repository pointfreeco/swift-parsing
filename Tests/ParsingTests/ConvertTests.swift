import Parsing
import XCTest

final class ConvertTests: XCTestCase {
  func testNonThrowingConvert() throws {
    let conversion = AnyConversion<Int, String>(
      apply: { input in input > 0 ? "\(input)" : nil },
      unapply: { output in Int(output) }
    )
    
    let result = try conversion.apply(42)
    XCTAssertEqual(result, "42")
    
    let reversed = try conversion.unapply("123")
    XCTAssertEqual(reversed, 123)
    
    // Test error case
    XCTAssertThrowsError(try conversion.apply(-5))
  }
  
  func testThrowingConvert() throws {
    enum ValidationError: Error {
      case invalidInput
      case invalidOutput
    }
    
    let conversion = AnyConversion<Int, String>(
      apply: { input in
        guard input > 0 else {
          throw ValidationError.invalidInput
        }
        return "\(input)"
      },
      unapply: { output in
        guard let number = Int(output), number > 0 else {
          throw ValidationError.invalidOutput
        }
        return number
      }
    )
    
    // Test successful apply
    let result = try conversion.apply(42)
    XCTAssertEqual(result, "42")
    
    // Test successful unapply
    let reversed = try conversion.unapply("123")
    XCTAssertEqual(reversed, 123)
    
    // Test throwing apply
    XCTAssertThrowsError(try conversion.apply(-5)) { error in
      XCTAssertTrue(error is ValidationError)
    }
    
    // Test throwing unapply
    XCTAssertThrowsError(try conversion.unapply("invalid")) { error in
      XCTAssertTrue(error is ValidationError)
    }
  }
  
  func testConvertStaticMethodThrowing() throws {
    enum ValidationError: Error {
      case invalidNumber
    }
    
    let conversion: AnyConversion<String, Int> = .convert(
      apply: { (input: String) throws -> Int in
        guard let number = Int(input), number > 0 else {
          throw ValidationError.invalidNumber
        }
        return number
      },
      unapply: { (output: Int) throws -> String in
        guard output > 0 else {
          throw ValidationError.invalidNumber
        }
        return "\(output)"
      }
    )
    
    // Test successful operations
    let result = try conversion.apply("42")
    XCTAssertEqual(result, 42)
    
    let reversed = try conversion.unapply(123)
    XCTAssertEqual(reversed, "123")
    
    // Test throwing operations
    XCTAssertThrowsError(try conversion.apply("invalid"))
    XCTAssertThrowsError(try conversion.unapply(-5))
  }

  func testThrowingConvertOverloadDisambiguation() throws {
    // Test that compiler correctly chooses non-throwing version for non-throwing functions
    let nonThrowing: AnyConversion<Int, String> = .convert(
      apply: { "\($0)" },
      unapply: { Int($0) }
    )
    
    // Test that we can explicitly use throwing version
    let throwing: AnyConversion<Int, String> = .convert(
      apply: { (input: Int) throws -> String in "\(input)" },
      unapply: { (output: String) throws -> Int in Int(output) ?? 0 }
    )
    
    XCTAssertEqual(try nonThrowing.apply(42), "42")
    XCTAssertEqual(try throwing.apply(42), "42")
  }
}