import Foundation

public struct SPMResources {

    public static var fileURL: URL {
        NSURL.fileURL(withPath: Bundle.module.path(forResource: "SourceResource", ofType: "txt")!)
    }

    public static var fileContent: String {
        do {
            return try String(contentsOf: fileURL)
        } catch {
            return error.localizedDescription
        }
    }

}
