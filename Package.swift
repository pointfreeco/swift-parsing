// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "swift-parsing",
  products: [
    .library(
      name: "Parsing",
      targets: ["Parsing"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/google/swift-benchmark", from: "0.1.0"),
    .package(url: "https://github.com/pointfreeco/swift-case-paths", from: "0.2.0"),
  ],
  targets: [
    .target(
      name: "Parsing"
      dependencies: ["CasePaths"]
    ),
    .testTarget(
      name: "ParsingTests",
      dependencies: ["Parsing"]
    ),
    .target(
      name: "swift-parsing-benchmark",
      dependencies: [
        "Parsing",
        .product(name: "Benchmark", package: "Benchmark"),
      ]
    ),
  ]
)
