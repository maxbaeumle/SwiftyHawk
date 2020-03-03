// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "SwiftyHawk",
    products: [
        .library(
            name: "SwiftyHawk",
            targets: ["SwiftyHawk"]),
    ],
    targets: [
        .target(
            name: "SwiftyHawk",
            path: "SwiftyHawk")
    ]
)
