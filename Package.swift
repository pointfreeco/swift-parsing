// swift-tools-version:5.9

import PackageDescription

// For migration to Swift 6
let swift6Settings: [SwiftSetting] = [
  .enableUpcomingFeature("StrictConcurrency"),
  .enableUpcomingFeature("ExistentialAny"),
  .enableUpcomingFeature("MemberImportVisibility"),
//  .enableUpcomingFeature("NonisolatedNonsendingByDefault"), // should not matter, package doesn't use Concurrency yet
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
      targets: ["Parsing"],
    )
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    .package(url: "https://github.com/pointfreeco/swift-case-paths", from: "1.0.0"),
    .package(url: "https://github.com/google/swift-benchmark", from: "0.1.1"),
  ],
  targets: [
    .target(
      name: "Parsing",
      dependencies: [.product(name: "CasePaths", package: "swift-case-paths")],
      swiftSettings: swift6Settings,
    ),
    .testTarget(
      name: "ParsingTests",
      dependencies: [
        "Parsing",
      ],
      swiftSettings: swift6Settings,
    ),
    .executableTarget(
      name: "swift-parsing-benchmark",
      dependencies: [
        "Parsing",
        .product(name: "Benchmark", package: "swift-benchmark"),
      ],
      swiftSettings: swift6Settings,
    ),
    .testTarget(
      name: "Swift6Tests",
      dependencies: [
        "Parsing",
      ],
      swiftSettings: swift6Settings,
    )
  ],
)
