// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "swift-parsing",
  products: [
    .library(
      name: "Parsing",
      targets: ["Parsing"]
    ),
  ],
  dependencies: [
    .package(name: "Benchmark", url: "https://github.com/MaxDesiatov/swift-benchmark", .branch("swift-5.4-windows")),
  ],
  targets: [
    .target(
      name: "Parsing"
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
