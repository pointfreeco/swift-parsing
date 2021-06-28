// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "swift-parsing",
  products: [
    .library(
      name: "Parsing",
      targets: ["Parsing"]
    )
  ],
  targets: [
    .target(
      name: "Parsing",
    ),
    .testTarget(
      name: "ParsingTests",
      dependencies: ["Parsing"]
    ),
  ]
)
