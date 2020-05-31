# Swift Package Manager - Resources in test targets

This repository is a minimal example to reproduce a bug in the SPM for the upcoming swift version 5.3.

## Content

It has three products:
1) Executable containing Resources
2) Library containing Resources
3) Executable depending on Library containing Resources

It also has two test targets:

1) Testing the library containing Resources
2) Test target containing resources itself

## Bug

Output of several commands to show the bug:

`swiftenv version`: `5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a (set by /Users/Steffen/Projects/SPMResourcesInTest/.swift-version)`

`swift version`: `Apple Swift version 5.3-dev (LLVM d2c5a6fb91, Swift 4eac5a1f0f) Target: x86_64-apple-darwin19.5.0`

`swift build --version`: `Swift Package Manager - Swift 5.3.0`

`swift build`: Successful

`swift run SPMResources`: (as expected)
```
File URL: file:///Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTest_SPMResources.bundle/SourceResource.txt
File Content: File Content SPMResources
```

`swift run SPMResourcesLibraryConsumer`: (as expected)
```
Library File URL: file:///Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTest_SPMResourcesLibrary.bundle/SourceResource.txt
Library File Content: File Content SPMResourcesLibrary
Library Consumer File URL: file:///Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTest_SPMResourcesLibrary.bundle/SourceResource.txt
Library Consumer File Content: File Content SPMResourcesLibrary
```

<details><summary>swift test -v: (for SPMResourcesInTests target, broken)</summary>
<p>
  
```
/usr/bin/xcrun --sdk macosx --show-sdk-path
/usr/bin/xcrun --sdk macosx --show-sdk-platform-path
/usr/bin/xcrun --sdk macosx --find xctest
/Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/bin/swiftc -print-target-info
xcrun vtool -show-build /Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/lib/swift/pm/4_2/libPackageDescription.dylib
/Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/bin/swiftc -L /Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/lib/swift/pm/4_2 -lPackageDescription -Xlinker -rpath -Xlinker /Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/lib/swift/pm/4_2 -target x86_64-apple-macosx10.15 -swift-version 5 -I /Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/lib/swift/pm/4_2 -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk -package-description-version 5.3.0 /Users/Steffen/Projects/SPMResourcesInTest/Package.swift -o /var/folders/q4/2jw_s4rj6rn5r3flsgh0mc800000gn/T/TemporaryDirectory.uh7pLo/spmresourcesintest-manifest
/var/folders/q4/2jw_s4rj6rn5r3flsgh0mc800000gn/T/TemporaryDirectory.uh7pLo/spmresourcesintest-manifest -fileno 7 sandbox-exec -p '(version 1)
(deny default)
(import "system.sb")
)
'
xcrun --sdk macosx --show-sdk-platform-path
xcrun vtool -show-build /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks/XCTest.framework/XCTest
xcrun --sdk iphoneos --show-sdk-platform-path
xcrun vtool -show-build /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Frameworks/XCTest.framework/XCTest
xcrun --sdk appletvos --show-sdk-platform-path
xcrun vtool -show-build /Applications/Xcode.app/Contents/Developer/Platforms/AppleTVOS.platform/Developer/Library/Frameworks/XCTest.framework/XCTest
xcrun --sdk watchos --show-sdk-platform-path
xcrun vtool -show-build /Applications/Xcode.app/Contents/Developer/Platforms/WatchOS.platform/Developer/Library/Frameworks/XCTest.framework/XCTest
/Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/bin/swiftc -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk -F /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks -I /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/usr/lib -L /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/usr/lib -L /Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug -o /Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTestPackageTests.xctest/Contents/MacOS/SPMResourcesInTestPackageTests -module-name SPMResourcesInTestPackageTests -Xlinker -bundle -Xlinker -rpath -Xlinker @loader_path/../../../ @/Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTestPackageTests.product/Objects.LinkFileList -Xlinker -rpath -Xlinker /Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/lib/swift/macosx -target x86_64-apple-macosx10.14 -Xlinker -add_ast_path -Xlinker /Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTests.swiftmodule -L /Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/lib
/Applications/Xcode.app/Contents/Developer/usr/bin/xctest /Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTestPackageTests.xctest
Test Suite 'All tests' started at 2020-05-31 01:05:48.764
Test Suite 'SPMResourcesInTestPackageTests.xctest' started at 2020-05-31 01:05:48.764
Test Suite 'SPMResourcesInTestTest' started at 2020-05-31 01:05:48.764
Test Case '-[SPMResourcesInTests.SPMResourcesInTestTest testFileContent]' started.
Fatal error: could not load resource bundle: /Applications/Xcode.app/Contents/Developer/usr/bin/SPMResourcesInTest_SPMResourcesInTests.bundle: file /Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTests.build/DerivedSources/resource_bundle_accessor.swift, line 7
Exited with signal code 4
```

</p></details>

<details><summary>swift test -v: (for SPMResourcesLibraryTests target, broken)</summary>
<p>
  
```
/usr/bin/xcrun --sdk macosx --show-sdk-path
/usr/bin/xcrun --sdk macosx --show-sdk-platform-path
/usr/bin/xcrun --sdk macosx --find xctest
/Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/bin/swiftc -print-target-info
xcrun vtool -show-build /Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/lib/swift/pm/4_2/libPackageDescription.dylib
/Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/bin/swiftc -L /Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/lib/swift/pm/4_2 -lPackageDescription -Xlinker -rpath -Xlinker /Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/lib/swift/pm/4_2 -target x86_64-apple-macosx10.15 -swift-version 5 -I /Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/lib/swift/pm/4_2 -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk -package-description-version 5.3.0 /Users/Steffen/Projects/SPMResourcesInTest/Package.swift -o /var/folders/q4/2jw_s4rj6rn5r3flsgh0mc800000gn/T/TemporaryDirectory.9GztsW/spmresourcesintest-manifest
/var/folders/q4/2jw_s4rj6rn5r3flsgh0mc800000gn/T/TemporaryDirectory.9GztsW/spmresourcesintest-manifest -fileno 7 sandbox-exec -p '(version 1)
(deny default)
(import "system.sb")
)
'
xcrun --sdk macosx --show-sdk-platform-path
xcrun vtool -show-build /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks/XCTest.framework/XCTest
xcrun --sdk iphoneos --show-sdk-platform-path
xcrun vtool -show-build /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Frameworks/XCTest.framework/XCTest
xcrun --sdk appletvos --show-sdk-platform-path
xcrun vtool -show-build /Applications/Xcode.app/Contents/Developer/Platforms/AppleTVOS.platform/Developer/Library/Frameworks/XCTest.framework/XCTest
xcrun --sdk watchos --show-sdk-platform-path
xcrun vtool -show-build /Applications/Xcode.app/Contents/Developer/Platforms/WatchOS.platform/Developer/Library/Frameworks/XCTest.framework/XCTest
/Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/bin/swiftc -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.15.sdk -F /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/Library/Frameworks -I /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/usr/lib -L /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/usr/lib -L /Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug -o /Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTestPackageTests.xctest/Contents/MacOS/SPMResourcesInTestPackageTests -module-name SPMResourcesInTestPackageTests -Xlinker -bundle -Xlinker -rpath -Xlinker @loader_path/../../../ @/Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTestPackageTests.product/Objects.LinkFileList -Xlinker -rpath -Xlinker /Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/lib/swift/macosx -target x86_64-apple-macosx10.14 -Xlinker -add_ast_path -Xlinker /Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesLibrary.swiftmodule -Xlinker -add_ast_path -Xlinker /Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesLibraryTests.swiftmodule -L /Library/Developer/Toolchains/swift-5.3-DEVELOPMENT-SNAPSHOT-2020-05-19-a.xctoolchain/usr/lib
/Applications/Xcode.app/Contents/Developer/usr/bin/xctest /Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesInTestPackageTests.xctest
Test Suite 'All tests' started at 2020-05-31 01:05:15.615
Test Suite 'SPMResourcesInTestPackageTests.xctest' started at 2020-05-31 01:05:15.616
Test Suite 'SPMResourcesLibraryTests' started at 2020-05-31 01:05:15.616
Test Case '-[SPMResourcesLibraryTests.SPMResourcesLibraryTests testFileContent]' started.
Fatal error: could not load resource bundle: /Applications/Xcode.app/Contents/Developer/usr/bin/SPMResourcesInTest_SPMResourcesLibrary.bundle: file /Users/Steffen/Projects/SPMResourcesInTest/.build/x86_64-apple-macosx/debug/SPMResourcesLibrary.build/DerivedSources/resource_bundle_accessor.swift, line 7
Exited with signal code 4
```

</p></details>

For more information see https://forums.swift.org/t/swift-5-3-spm-resources-in-tests-uses-wrong-bundle-path/37051/2

The bug is filed here: https://bugs.swift.org/browse/SR-12912
