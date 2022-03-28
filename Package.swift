// swift-tools-version:5.5

import PackageDescription

let swiftSettings: [SwiftSetting] = [
  .unsafeFlags([
    "-Xfrontend", "-enable-experimental-pairwise-build-block",
    "-Xfrontend", "-enable-experimental-type-inference-from-defaults",
    "-Xfrontend", "-enable-parameterized-protocol-types",
    "-Xfrontend", "-requirement-machine-protocol-signatures=on",
    "-Xfrontend", "-warn-long-expression-type-checking=75",
    "-Xfrontend", "-warn-long-function-bodies=75",
  ])
]

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
    ),
    .library(
      name: "_URLRouting",
      targets: ["_URLRouting"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-case-paths", from: "0.8.0"),
    .package(name: "Benchmark", url: "https://github.com/google/swift-benchmark", from: "0.1.1"),
  ],
  targets: [
    .target(
      name: "Parsing",
      dependencies: [.product(name: "CasePaths", package: "swift-case-paths")],
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
        "_URLRouting",
        .product(name: "Benchmark", package: "Benchmark"),
      ],
      swiftSettings: swiftSettings
    ),
    .target(
      name: "_URLRouting",
      dependencies: ["Parsing"],
      swiftSettings: swiftSettings
    ),
    .testTarget(
      name: "_URLRoutingTests",
      dependencies: ["_URLRouting"],
      swiftSettings: swiftSettings
    ),
  ]
)
