import ProjectDescription



let project = Project(
    name: "MyGuard",
    packages: [
        .remote(url: "https://github.com/uber/needle", requirement: .exact("0.25.1")),
    ],
    targets: [
        .target(
            name: "MyGuard",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.MyGuard",
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
                .package(product: "NeedleFoundation", type: .runtime, condition: .none)
            ],
        ),
        .target(
            name: "MyGuardTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.MyGuardTests",
            infoPlist: .default,
            sources: ["MyGuard/Tests/**"],
            resources: [],
            dependencies: [.target(name: "MyGuard")]
        ),
    ]
)
