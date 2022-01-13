import XCTest
import Parsing

class PeekTests: XCTestCase {

    func testPeekMatches() throws {
        var input = "_foo1 = nil"[...]
        
        let identifier = Peek(Prefix(1) { $0.isLetter || $0 == "_" })
            .take(Prefix { $0.isNumber || $0.isLetter || $0 == "_" })
        
        let result = identifier.parse(&input)
        
        XCTAssertEqual(result, "_foo1")
        XCTAssertEqual(input, " = nil"[...])
    }
    
    func testPeekFails() throws {
        var input = "1foo = nil"[...]
        
        let identifier = Peek(Prefix(1) { $0.isLetter || $0 == "_" })
            .take(Prefix { $0.isNumber || $0.isLetter || $0 == "_" })
        
        let result = identifier.parse(&input)
        
        XCTAssertNil(result)
        XCTAssertEqual(input, "1foo = nil"[...])
    }

}
