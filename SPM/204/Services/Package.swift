// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Services",
    products: [
        .library(
            name: "Services",
            targets: ["Services"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Services",
            dependencies: [],
        path: "Sources"),
        
        .testTarget(
            name: "ServicesTests",
            dependencies: ["Services"]),
    ]
)
