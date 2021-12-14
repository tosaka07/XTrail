// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XTrail",
    products: [
        .executable(name: "xtrail", targets: ["XTrail"])
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.2"),
      .package(url: "https://github.com/kylef/PathKit", from: "1.0.1"),
      .package(url: "https://github.com/onevcat/Rainbow", from: "4.0.1"),
    ],
    targets: [
        .executableTarget(
            name: "XTrail",
            dependencies: ["XTrailCLI"]),
        .target(
          name: "XTrailCLI",
          dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
            .product(name: "PathKit", package: "PathKit"),
            .product(name: "Rainbow", package: "Rainbow"),
          ]
        ),
        .testTarget(
            name: "XTrailTests",
            dependencies: ["XTrail"]),
    ]
)
