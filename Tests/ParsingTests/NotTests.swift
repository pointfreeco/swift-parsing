import XCTest
import Parsing

class NotTests: XCTestCase {

    func testNotUpstreamFails() throws {
        var input = """
        let foo = true
        let bar = false
        """[...]
        
        let uncommentedLine = Not("//")
            .take(Prefix { $0 != "\n" })
            .skip("\n".orElse(End()))
        
        let result = uncommentedLine.parse(&input)
        
        XCTAssertEqual(result, "let foo = true")
        XCTAssertEqual(input, "let bar = false"[...])
    }
    
    func testNotUpstreamParses() throws {
        var input = """
        // a comment
        let foo = true
        """[...]
        
        let uncommentedLine = Not("//")
            .take(Prefix { $0 != "\n" })
        
        let result = uncommentedLine.parse(&input)
        
        XCTAssertNil(result)
        XCTAssertEqual(input, """
        // a comment
        let foo = true
        """[...])
    }

}
