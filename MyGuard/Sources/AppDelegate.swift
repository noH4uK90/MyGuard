//
//  AppDelegate.swift
//  MyGuard
//
//  Created by Иван Спирин on 24.12.2025.
//

import NeedleFoundation
import UDFKit
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!
    var appObserver: AppObserver!

    override init() {
        registerProviderFactories()
        AppConfig.shared.setupToken()
    }

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication
            .LaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)

        let coordinatorComponent = AppCoordinatorComponent()
        appCoordinator = coordinatorComponent.appCoordinator(window)
        appObserver = coordinatorComponent.appObserver(
            store: Store(
                state: RootReducer.State(),
                reducer: RootReducer(
                    dependency: ThreadSafe(coordinatorComponent.rootComponent.dependency)
                )
            ),
            coordinator: appCoordinator
        )

        appObserver.start()

        return true
    }
}
