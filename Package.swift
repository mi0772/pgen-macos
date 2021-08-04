// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PGen",
    platforms: [
        .macOS(.v10_12),
    ],
    dependencies: [
        .package(
              name: "swift-argument-parser",
              url: "https://github.com/apple/swift-argument-parser",
              .upToNextMinor(from: "0.4.3")
            ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PGen",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]),
        .testTarget(
            name: "PGenTests",
            dependencies: ["PGen"]),
    ]
)
