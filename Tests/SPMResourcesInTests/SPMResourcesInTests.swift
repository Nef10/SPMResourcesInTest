
import XCTest

class SPMResourcesInTestTest: XCTestCase {

    func testFileURL() {
        XCTAssertNotNil(NSURL.fileURL(withPath: Bundle.module.path(forResource: "TestResource", ofType: "txt")!))
    }

    func testFileContent() {
        let fileURL = NSURL.fileURL(withPath: Bundle.module.path(forResource: "TestResource", ofType: "txt")!)
        var content = ""
        do {
            content = try String(contentsOf: fileURL)
        } catch {
            XCTFail(error.localizedDescription)
        }
        XCTAssertEqual(content, "File Content SPMResourcesInTests")
    }

}