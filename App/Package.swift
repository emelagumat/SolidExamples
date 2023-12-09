// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "App",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "App",
            targets: ["App"]),
    ],
    dependencies: [
        .package(path: "../Domain")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "App",
            dependencies: [
                "Domain"
            ]
        )
    ]
)
/*
 
 name: "Data",
 platforms: [.iOS(.v16), .macOS(.v13)],
 products: [
     .library(
         name: "Data",
         targets: ["Data"])
 ],
 dependencies: [
     .package(path: "../Domain"),
     .package(url: "https://github.com/emelagumat/MLDCore.git", branch: "develop")
 ],
 targets: [
     .target(
         name: "Data",
         dependencies: [
             "Domain",
             .product(name: "APIClient", package: "MLDCore")
         ]
     ),
     .testTarget(
         name: "DataTests",
         dependencies: ["Data"])
 ]
)
 */
