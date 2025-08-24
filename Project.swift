import ProjectDescription



let project = Project(
    name: "MyGuard",
    packages: [
        .remote(url: "https://github.com/uber/needle", requirement: .exact("0.25.1")),
        .remote(url: "https://github.com/apple/swift-async-algorithms", requirement: .upToNextMinor(from: "1.0.4")),
        .remote(url: "https://github.com/noH4uK90/UDFKit", requirement: .exact("0.1.1"))
    ],
    targets: [
        .target(
            name: "MyGuard",
            destinations: .iOS,
            product: .app,
            bundleId: "noh4uk.MyGuard",
            deploymentTargets: .iOS("17.5"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["MyGuard/Sources/**"],
            resources: ["MyGuard/Resources/**"],
            scripts: [
                .pre(script: """
                export PATH="/opt/homebrew/bin:$PATH"
                if which needle; then
                    SOURCEKIT_LOGGING=0 && needle generate MyGuard/Sources/Generator/NeedleGenerated.swift MyGuard/Sources/
                else
                    echo "warning: Needle not installed, download from https://github.com/uber/needle using Homebrew"
                fi
                """, name: "Needle Generator")
            ],
            dependencies: [
                .package(product: "NeedleFoundation", type: .runtime, condition: .none),
                .package(product: "AsyncAlgorithms", type: .runtime, condition: .none),
                .package(product: "UDFKit", type: .runtime, condition: .none),
            ],
        ),
        .target(
            name: "MyGuardTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "noh4uk.MyGuardTests",
            infoPlist: .default,
            sources: ["MyGuard/Tests/**"],
            resources: [],
            dependencies: [.target(name: "MyGuard")]
        ),
    ]
)
