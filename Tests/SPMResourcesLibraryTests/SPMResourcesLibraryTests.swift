
@testable import SPMResourcesLibrary
import XCTest

class SPMResourcesLibraryTests: XCTestCase {

    func testFileURL() {
        XCTAssertNotNil(SPMResourcesLibrary.fileURL)
    }

    func testFileContent() {
        XCTAssertEqual(SPMResourcesLibrary.fileContent, "File Content SPMResourcesLibrary")
    }

}