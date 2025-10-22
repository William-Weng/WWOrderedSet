// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWOrderedSet",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "WWOrderedSet", targets: ["WWOrderedSet"]),
    ],
    targets: [
        .target(name: "WWOrderedSet"),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
