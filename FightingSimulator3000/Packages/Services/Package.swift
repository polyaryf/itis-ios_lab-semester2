// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Services",
    platforms: [ .iOS(.v16), .macOS(.v13) ],
    products: [
        .library(
            name: "FightingServices",
            targets: ["FightingServices"]
        ),
        .library(
            name: "PlayerServices",
            targets: ["PlayerServices"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FightingServices",
            path: "FightingServices"
        ),
        .target(
            name: "PlayerServices",
            path: "PlayerServices"
        ),
        
    ]
)
