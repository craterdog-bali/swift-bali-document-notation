// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "BDN",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "BDN",
            targets: ["BDN"]
        )
    ],
    targets: [
        .target(
            name: "BDN",
            dependencies: []
        ),
        .testTarget(
            name: "BDNTests",
            dependencies: ["BDN"]
        )
    ]
)
