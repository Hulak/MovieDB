// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MDBMain",
  platforms: [
    .iOS(.v13)
  ],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "MDBMain",
      targets: ["MDBMain"]
    ),
    .library(
      name: "MDBMainMocks",
      targets: ["MDBMainMocks"]
    )
  ],
  dependencies: [
    .package(path: "../../Libraries/MDBServices"),
    .package(path: "../../Libraries/MDBConstants"),
    .package(path: "../../Libraries/MDBComponents")
  ],
  targets: [
    .target(
      name: "MDBMain",
      dependencies: [
        "MDBServices",
        "MDBConstants",
        "MDBComponents"
      ]
    ),
    .target(
      name: "MDBMainMocks",
      dependencies: [
        "MDBMain"
      ],
      path: "Tests/MDBMainMocks"
    ),
    .testTarget(
      name: "MDBMainTests",
      dependencies: ["MDBMainMocks"]
    )
  ]
)
