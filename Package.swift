import PackageDescription

let package = Package(
    name: "PoursteadyCleanroomLogger",
    dependencies: [
        .Package(url: "https://github.com/steadyequipment/CleanroomLogger.git", majorVersion: 3, minor: 0),
        .Package(url: "https://github.com/onevcat/Rainbow.git", majorVersion: 2, minor: 0)
    ]
)
