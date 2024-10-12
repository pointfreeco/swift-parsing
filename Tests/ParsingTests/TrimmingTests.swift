import Parsing
import XCTest

final class TrimmingTests: XCTestCase {
    func testTrimming() throws {
        let peopleParser: some ParserPrinter<Substring, [String]> = Many {
            Prefix { $0 != "," }.map(.trimming())
        } separator: { ", " }
        XCTAssertEqual(try peopleParser.parse("   Blob  ,    Blob Jr     "), ["Blob", "Blob Jr"])
        XCTAssertEqual(try peopleParser.print(["Blob", "Blob Jr"]), "Blob, Blob Jr")
    }
    
    func testFluentTrimming() throws {
        let peopleParser: some ParserPrinter<Substring, [String]> = Many {
            Prefix { $0 != "," }.map(.string.trimming())
        } separator: { ", " }
        XCTAssertEqual(try peopleParser.parse("   Blob  ,    Blob Jr     "), ["Blob", "Blob Jr"])
        XCTAssertEqual(try peopleParser.print(["Blob", "Blob Jr"]), "Blob, Blob Jr")
    }
}
