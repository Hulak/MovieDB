// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MDBNetworking",
  platforms: [
    .iOS(.v13)
  ],
  products: [
    .library(
      name: "MDBNetworking",
      targets: ["MDBNetworking"]
    ),
    .library(
      name: "MDBNetworkingMocks",
      targets: ["MDBNetworkingMocks"]
    )
  ],
  dependencies: [
    .package(path: "../MDBCommon")
  ],
  targets: [
    .target(
      name: "MDBNetworking",
      dependencies: [
        "MDBCommon"
      ],
      resources: [
        .process("Resources")
      ]
    ),
    .target(
      name: "MDBNetworkingMocks",
      dependencies: [
        "MDBNetworking"
      ],
      path: "Tests/MDBNetworkingMocks"
    ),
    .testTarget(
      name: "MDBNetworkingTests",
      dependencies: [
        "MDBNetworkingMocks"
      ],
      resources: [
        .process("Resources")
      ]
    )
  ]
)
