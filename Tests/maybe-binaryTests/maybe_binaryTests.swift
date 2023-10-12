import XCTest
import OSLog
@testable import maybe_binary

final class maybe_binaryTests: XCTestCase {
    let logger = Logger(subsystem: "maybe", category: "binary")
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(maybe_binary().text, "Hello, Maybe!")
    }
    
    func testMaybe() {
        (0...9).forEach { n in
            let maybe = Bool.maybe
            logger.info("[💡][ Maybe \(n): \(maybe ? "+" : "-") ][\(maybe)]")
        }
    }
    
    func testCollatz() {
        (0...9).forEach { n in
            let collatz = n.collatz
            logger.info("[💡]")
            logger.info("[💡][ Base : \(collatz.base) ]")
            logger.info("[💡][ Base Steps: \(collatz.steps) ]")
            logger.info("[💡][ Base Inverse Steps: \(collatz.inverseSteps) ]")
            logger.info("[💡][ Collatz: \(collatz.collatz.description) ]")
            logger.info("[💡][ Inverse Collatz: \(collatz.negatives.description) ]")
            logger.info("[ ™️ ]")
        }
    }
}
