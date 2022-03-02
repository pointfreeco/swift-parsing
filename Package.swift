// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "swift-parsing",
  products: [
    .library(
      name: "Parsing",
      targets: ["Parsing"]
    ),
    .library(
      name: "_URLRouting",
      targets: ["_URLRouting"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "0.5.0"),
    .package(url: "https://github.com/pointfreeco/swift-case-paths", from: "0.8.0"),
    .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "0.3.0"),
    .package(name: "Benchmark", url: "https://github.com/google/swift-benchmark", from: "0.1.1"),
  ],
  targets: [
    .target(
      name: "Parsing",
      dependencies: [.product(name: "CasePaths", package: "swift-case-paths")]
    ),
    .testTarget(
      name: "ParsingTests",
      dependencies: [
        "Parsing",
        .product(name: "CustomDump", package: "swift-custom-dump"),
      ]
    ),
    .executableTarget(
      name: "swift-parsing-benchmark",
      dependencies: [
        "Parsing",
        "_URLRouting",
        .product(name: "Benchmark", package: "Benchmark"),
      ]
    ),
    .executableTarget(
      name: "variadics-generator",
      dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")]
    ),
    .target(
      name: "_URLRouting", dependencies: ["Parsing"]
    ),
    .testTarget(
      name: "_URLRoutingTests",
      dependencies: [
        "_URLRouting",
        .product(name: "CustomDump", package: "swift-custom-dump"),
      ]
    ),
  ]
)
