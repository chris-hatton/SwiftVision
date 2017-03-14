import PackageDescription

let package = Package(
    name: "SwiftVision",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/chris-hatton/SwiftImage.git", majorVersion: 1)
    ]
)
