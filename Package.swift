// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SPMResourcesInTest",
    products: [
        .executable(
            name: "SPMResources",
            targets: ["SPMResources"]),
        .library(
            name: "SPMResourcesLibrary",
            targets: ["SPMResourcesLibrary"]),
        .executable(
            name: "SPMResourcesLibraryConsumer",
            targets: ["SPMResourcesLibraryConsumer"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SPMResources",
            dependencies: [],
            resources: [
                .process("Resources"),
            ]),
        .testTarget(
            name: "SPMResourcesInTests",
            dependencies: [],
            resources: [
                .process("Resources"),
            ]),
        .target(
            name: "SPMResourcesLibrary",
            dependencies: [],
            resources: [
                .process("Resources"),
            ]),
        .testTarget(
            name: "SPMResourcesLibraryTests",
            dependencies: ["SPMResourcesLibrary"]),
        .target(
            name: "SPMResourcesLibraryConsumer",
            dependencies: ["SPMResourcesLibrary"]),
    ]
)
