// swift-tools-version:5.5

import PackageDescription

let swiftSettings: [SwiftSetting] = [
  .unsafeFlags([
//    "-Xfrontend", "-enable-experimental-pairwise-build-block",
//    "-Xfrontend", "-enable-parameterized-protocol-types",
//    "-Xfrontend", "-requirement-machine-protocol-signatures=on",
    "-Xfrontend", "-warn-long-expression-type-checking=75",
    "-Xfrontend", "-warn-long-function-bodies=75",
  ]),
]

let package = Package(
  name: "swift-parsing",
  products: [
    .library(
      name: "Parsing",
      targets: ["Parsing"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "0.5.0"),
    .package(name: "Benchmark", url: "https://github.com/google/swift-benchmark", from: "0.1.1"),
  ],
  targets: [
    .target(
      name: "Parsing",
      swiftSettings: swiftSettings
    ),
    .testTarget(
      name: "ParsingTests",
      dependencies: ["Parsing"],
      swiftSettings: swiftSettings
    ),
    .executableTarget(
      name: "swift-parsing-benchmark",
      dependencies: [
        "Parsing",
        .product(name: "Benchmark", package: "Benchmark"),
      ]
    ),
    .executableTarget(
      name: "variadics-generator",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser")
      ]
    ),
  ]
)
