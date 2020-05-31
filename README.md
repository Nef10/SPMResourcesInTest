# Swift Package Manager - Resources in test targets

This repository is a minimal example to reproduce a bug in the SPM for the upcoming swift version 5.3.

It has three products:
1) Executable containing Resources
2) Library containing Resources
3) Executable depending on Library containing Resources

It also has two test targets:

1) Testing the library containing Resources
2) Test target containing resources itself

Output of several commands to show the bug:

`swiftenv version`: `5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a (set by /Users/Steffen/Projects/SPMResourcesInTest/.swift-version)`
`swift version`: `Apple Swift version 5.3-dev (LLVM d2c5a6fb91, Swift 4eac5a1f0f) Target: x86_64-apple-darwin19.5.0`
`swift build`: Successful

`swift run SPMResources`: (as expected)
```
File URL: file:///Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTest_SPMResources.bundle/SourceResource.txt
File Content: File Content SPMResources
``

`swift run SPMResourcesLibraryConsumer`: (as expected)
```
Library File URL: file:///Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTest_SPMResourcesLibrary.bundle/SourceResource.txt
Library File Content: File Content SPMResourcesLibrary
Library Consumer File URL: file:///Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTest_SPMResourcesLibrary.bundle/SourceResource.txt
Library Consumer File Content: File Content SPMResourcesLibrary
```

`swift test`: (for SPMResourcesInTests target)
```
Test Suite 'All tests' started at 2020-05-31 00:56:26.548
Test Suite 'SPMResourcesInTestPackageTests.xctest' started at 2020-05-31 00:56:26.548
Test Suite 'SPMResourcesInTestTest' started at 2020-05-31 00:56:26.548
Test Case '-[SPMResourcesInTests.SPMResourcesInTestTest testFileContent]' started.
Fatal error: could not load resource bundle: /Applications/Xcode.app/Contents/Developer/usr/bin/SPMResourcesInTest_SPMResourcesInTests.bundle: file /Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTests.build/DerivedSources/resource_bundle_accessor.swift, line 7
Exited with signal code 4
```

`swift test`: (for SPMResourcesLibraryTests target)
```
Test Suite 'All tests' started at 2020-05-31 00:57:32.842
Test Suite 'SPMResourcesInTestPackageTests.xctest' started at 2020-05-31 00:57:32.842
Test Suite 'SPMResourcesLibraryTests' started at 2020-05-31 00:57:32.842
Test Case '-[SPMResourcesLibraryTests.SPMResourcesLibraryTests testFileContent]' started.
Fatal error: could not load resource bundle: /Applications/Xcode.app/Contents/Developer/usr/bin/SPMResourcesInTest_SPMResourcesLibrary.bundle: file /Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesLibrary.build/DerivedSources/resource_bundle_accessor.swift, line 7
Exited with signal code 4
```

For more information see https://forums.swift.org/t/swift-5-3-spm-resources-in-tests-uses-wrong-bundle-path/37051/2