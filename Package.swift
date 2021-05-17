// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftSyntaxSimplified",
    products: [
        .library(
            name: "SwiftSyntaxSimplified",
            targets: ["SwiftSyntaxSimplified"]
        ),
    ],
    dependencies: [
        .package(
            name: "SwiftSyntax",
            url: "https://github.com/apple/swift-syntax.git",
            .exact("0.50400.0")
        ),
    ],
    targets: [
        .target(
            name: "SwiftSyntaxSimplified",
            dependencies: [
                .product(
                    name: "SwiftSyntax",
                    package: "SwiftSyntax"
                ),
            ]
        ),
    ]
)
