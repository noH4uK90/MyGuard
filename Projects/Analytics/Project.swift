import ProjectDescription

let project = Project(
    name: "Analytics",
    packages: [
        .remote(url: "https://github.com/uber/needle", requirement: .exact("0.25.1")),
        .remote(url: "https://github.com/apple/swift-async-algorithms", requirement: .upToNextMinor(from: "1.0.4")),
        .remote(url: "https://github.com/noH4uK90/UDFKit", requirement: .exact("0.1.2"))
    ],
    targets: [
        .target(
            name: "Analytics",
            destinations: .iOS,
            product: .framework,
            bundleId: "noh4uk.MyGuard.Analytics",
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
            scripts: [
                .pre(script: """
                export PATH="$PATH:/opt/homebrew/bin"
                if which needle; then
                    SOURCEKIT_LOGGING=0 && needle generate Sources/Generator/NeedleGenerated.swift Sources/
                else
                    echo "warning: Needle not installed, download from https://github.com/uber/needle using Homebrew"
                fi
                """,
                     name: "Analytics Needle Generator",
                     inputPaths: ["$(SRCROOT)/Projects/Analytics/Sources/**"],
                     outputPaths: ["$(SRCROTT)/Projects/Analytics/Sources/Generator/NeedleGenerated.swift"]
                    )
            ],
            dependencies: [
                .package(product: "NeedleFoundation", type: .runtime, condition: .none),
                .package(product: "AsyncAlgorithms", type: .runtime, condition: .none),
                .package(product: "UDFKit", type: .runtime, condition: .none),
                .project(target: "Core", path: "../Core"),
            ],
        )
    ]
)
