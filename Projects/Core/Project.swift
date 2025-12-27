import ProjectDescription

let project = Project(
    name: "Core",
    packages: [
        .remote(url: "https://github.com/apple/swift-async-algorithms", requirement: .upToNextMinor(from: "1.0.4")),
    ],
    targets: [
        .target(
            name: "Core",
            destinations: .iOS,
            product: .framework,
            bundleId: "noh4uk.MyGuard.Core",
            deploymentTargets: .iOS("17.5"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": ""
                    ]
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .package(product: "AsyncAlgorithms", type: .runtime, condition: .none),
            ],
        )
    ]
)
