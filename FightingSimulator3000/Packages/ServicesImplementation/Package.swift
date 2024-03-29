// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ServicesImplementation",
    platforms: [ .iOS(.v16), .macOS(.v13) ],
    products: [
        .library(
            name: "FightingServicesImplementation",
            targets: ["FightingServicesImplementation"]
        ),
        .library(
            name: "PlayerServicesImplementation",
            targets: ["PlayerServicesImplementation"]
        ),
    ],
    dependencies: [
        .package(path: "../Services")
    ],
    targets: [
        .target(
            name: "FightingServicesImplementation",
            dependencies: [
                .product(name: "FightingServices", package: "Services"),
            ],
            path: "FightingServicesImplementation"
        ),
        .target(
            name: "PlayerServicesImplementation",
            dependencies: [
                .product(name: "PlayerServices", package: "Services"),
            ],
            path: "PlayerServicesImplementation"
        ),
        
    ]
)
