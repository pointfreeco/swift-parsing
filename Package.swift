// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "swift-parsing",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "Parsing",
      targets: ["Parsing"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "0.5.0"),
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    .package(url: "https://github.com/pointfreeco/swift-case-paths", from: "0.8.0"),
    .package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay", from: "0.2.1"),
    .package(url: "https://github.com/google/swift-benchmark", from: "0.1.1"),
  ],
  targets: [
    .target(
      name: "Parsing",
      dependencies: [.product(name: "CasePaths", package: "swift-case-paths")]
    ),
    .testTarget(
      name: "ParsingTests",
      dependencies: [
        "Parsing"
      ]
    ),
    .executableTarget(
      name: "swift-parsing-benchmark",
      dependencies: [
        "Parsing",
        .product(name: "Benchmark", package: "swift-benchmark"),
      ]
    ),
  ]
)
