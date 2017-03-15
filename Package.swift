import PackageDescription

let package = Package(
    name: "SwiftVision"
    targets: [],
    dependencies: [
        .Package(url: “../SwiftImage“, majorVersion: 1)
    ]
)